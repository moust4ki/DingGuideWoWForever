-- Release: what the BigWigs packager needs to build Ding's zip and publish it on CurseForge
-- (.pkgmeta, Ding.toc, .github/workflows/release.yml). The zip itself is checked by
-- tools/check_package.py in the Release workflow.
local tools = (arg[0]:match("^(.*)[/\\]") or ".") .. "/.."
local T = dofile(tools .. "/testlib.lua")(arg[1])
local Ding = T.Ding

local function read(path)
    local handle = assert(io.open(tools .. "/../" .. path, "rb"))
    local text = handle:read("*a"):gsub("\r", "")
    handle:close()
    return text
end

local function toc(field)
    local pattern = "\n##%s*" .. field:gsub("%-", "%%-") .. ":%s*([^\n]-)%s*\n"
    return ("\n" .. read("Ding/Ding.toc")):match(pattern)
end

T.test("the TOC has Forever's interface, the CurseForge project and the version keyword", function()
    T.eq(toc("Interface"), "16001")
    T.eq(toc("X-Curse-Project-ID"), "1739053")
    T.eq(toc("Version"), "@project-version@")
end)

T.test('a copy of the repository (keyword not replaced) calls itself "dev"', function()
    T.eq(Ding.version, "dev")
end)

T.test(".pkgmeta: the Ding folder becomes the root of the zip, without tools or docs", function()
    local meta = read(".pkgmeta")
    T.ok(meta:find("\npackage%-as: Ding\n"), "package-as: Ding")
    T.ok(meta:find("\nmove%-folders:\n  Ding/Ding: Ding\n"), "move-folders Ding/Ding: Ding")
    local ignore = meta:match("\nignore:\n(.-\n)\n")
    T.ok(ignore, "ignore list")
    for _, path in ipairs({ "tools", "docs", "README.md", "CLAUDE.md" }) do
        T.ok(ignore:find("  - " .. path .. "\n", 1, true), path .. " must be ignored")
    end
    T.ok(not ignore:find("LICENSE"), "the license goes into the zip")
    T.ok(meta:find("\noptional%-dependencies:\n  %- tomtom"), "TomTom as an optional dependency")
    T.ok(meta:find("\nmanual%-changelog:\n  filename: CHANGELOG%.md\n  markup%-type: markdown\n"),
        "changelog written by hand")
end)

T.test("the changelog starts with the latest version and says what to install", function()
    local log = read("CHANGELOG.md")
    T.ok(log:find("^# Changelog\n\n## v%d+%.%d+%.%d+"), "one entry per version, the latest at the top")
    -- Since v1.3.0 Ding carries its own data: the top entry says QuestieDB is no longer needed.
    local top = log:match("^# Changelog\n\n(## v.-)\n## v") or log
    T.ok(top:find("QuestieDB is no longer needed", 1, true), "says QuestieDB is no longer needed")
end)

T.test("publishing: only on a tag, after the tests and the zip check", function()
    local wf = read(".github/workflows/release.yml")
    T.ok(wf:find("\n  push:\n    tags: %['v%*'%]\n"), "triggered by v* tags")
    T.ok(wf:find("uses: %./%.github/workflows/tests%.yml"), "runs the test suite")
    T.ok(wf:find("\n    needs: tests\n"), "the package waits for the tests")
    local dry = wf:find("args: %-d")
    local check = wf:find("run: python3 tools/check_package%.py")
    local publish = wf:find("CF_API_TOKEN: %${{ secrets%.CF_API_TOKEN }}")
    T.ok(dry and check and publish and dry < check and check < publish,
        "dry-run zip, check, and only then the upload")
    -- packager@v2 ignores GH_API_TOKEN: v1.0.0 reached CurseForge but not the GitHub releases.
    T.ok(wf:find("GITHUB_API_TOKEN: %${{ secrets%.GITHUB_TOKEN }}", publish), "GitHub token under a name the v2 packager reads")
    T.ok(wf:sub(check, publish):find("if: github%.event_name == 'push'"), "the upload only happens on a tag")
    T.ok(read(".github/workflows/tests.yml"):find("\n  workflow_call:"), "tests.yml callable")
end)

T.run()
