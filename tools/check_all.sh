#!/usr/bin/env bash
# The whole check suite (CLAUDE.md, tools/README.md section 9), spread over the machine's cores.
# Run from the repository root (Git Bash on Windows). Environment:
#   LUA  = the Lua 5.1 interpreter (default: QuestieDB's lua.exe next to this repository, else lua5.1)
#   QDB  = the QuestieDB Forever export (default: ../QuestieDB/src/corrections/Forever/combined)
#   JOBS = parallel processes (default: the number of cores minus 2)
if [ -z "$LUA" ]; then
  if [ -x /d/Dev/QuestieDB/tools/lua-binary/lua.exe ]; then LUA=/d/Dev/QuestieDB/tools/lua-binary/lua.exe
  else LUA=lua5.1; fi
fi
QDB=${QDB:-../QuestieDB/src/corrections/Forever/combined}
if [ -z "$JOBS" ]; then
  cores=$(nproc 2>/dev/null || getconf _NPROCESSORS_ONLN 2>/dev/null || echo 4)
  JOBS=$((cores - 2)); [ "$JOBS" -lt 1 ] && JOBS=1
fi
S="$(cd "$(dirname "$0")" && pwd)"
OUT=$(mktemp -d)
export LUA QDB OUT
start=$(date +%s)
# Every job: its command line, then its output and exit code in a file of its own.
job() {
  name=$1; shift
  "$@" > "$OUT/$name.log" 2>&1
  echo $? > "$OUT/$name.rc"
}
export -f job
{
  echo "syntax|bash -c 'find Ding tools examples -name \"*.lua\" -print0 2>/dev/null | xargs -0 -n 200 $LUA $S/syntax.lua'"
  echo "check_data|$LUA tools/check_data.lua"
  echo "check_guides|$LUA tools/check_guides.lua $QDB"
  [ -d examples/DingExamplePack ] && echo "check_pack|$LUA tools/check_guides.lua $QDB --addon examples/DingExamplePack"
  [ -f tools/translate_guides.lua ] && echo "translations|$LUA tools/translate_guides.lua"
  for f in tools/tests/*_test.lua; do n=$(basename $f .lua); echo "unit_$n|$LUA $f $QDB"; done
  for v in "" "--skip-optional" "--locale enUS" "--skip-optional --locale enUS" "--tomtom" "--tomtom --skip-optional" \
           "--locale deDE" "--locale esES" "--locale ptBR" "--locale koKR" "--locale zhCN" "--locale zhTW"; do
    n=smoke$(echo "$v" | tr -d ' -'); echo "$n|$LUA tools/smoke_test.lua $QDB --quiet $v"
  done
} > "$OUT/jobs.txt"
# Longest first: the smoke runs, then the rest.
{ grep "^smoke" "$OUT/jobs.txt"; grep -v "^smoke" "$OUT/jobs.txt"; } | \
  tr '\n' '\0' | xargs -0 -P "$JOBS" -I{} bash -c 'line="{}"; name=${line%%|*}; cmd=${line#*|}; eval "job $name $cmd"'
fail=0; units=0; ufail=0
for rc in "$OUT"/*.rc; do
  name=$(basename "$rc" .rc); code=$(cat "$rc")
  case $name in unit_*) units=$((units+1)); [ "$code" != 0 ] && ufail=$((ufail+1));; esac
  if [ "$code" != 0 ]; then fail=1; echo "!! $name (code $code)"; tail -n 6 "$OUT/$name.log"; fi
done
for f in "$OUT"/smoke*.log; do grep -q "Result: 0 problem" "$f" || { echo "!! $(basename $f .log): $(tail -1 $f)"; fail=1; }; done
echo "Unit tests: $units file(s), $ufail failed; smoke runs: $(ls $OUT/smoke*.log | wc -l); $JOBS jobs; $(( $(date +%s) - start )) s"
[ $fail -eq 0 ] && echo "ALL GREEN" || echo "FAILURES"
rm -rf "$OUT"
exit $fail
