"""Checks the zip built by the BigWigs packager before it is published.

usage: python3 tools/check_package.py .release/Ding-<version>.zip   (from the repository root)

The zip must hold one Ding/ folder with exactly the files of the repository's Ding/ folder,
plus the license and the generated changelog: no tools, docs or stray files. Every file the
TOC loads must be there, the version keyword must have been replaced, and the textures and
fonts must be byte for byte the ones of the repository. Pure Python, no dependency.
"""
import os
import subprocess
import sys
import zipfile

ROOT = "Ding/"
EXTRAS = {"Ding/LICENSE", "Ding/CHANGELOG.md"}       # added by the packager
REQUIRED = {"Ding/LICENSE", "Ding/Ding.toc", "Ding/Bindings.xml", "Ding/Media/Fonts/OFL.txt"}
BINARY = (".tga", ".ttf", ".blp", ".png")
PROJECT_ID = "1739053"


def tracked():
    out = subprocess.run(["git", "ls-files", "Ding"], capture_output=True, text=True, check=True)
    return {line.strip() for line in out.stdout.splitlines() if line.strip()}


def toc_header_and_files(text):
    header, files = {}, []
    for line in text.replace("\r", "").split("\n"):
        line = line.strip()
        if line.startswith("##"):
            key, _, value = line[2:].partition(":")
            header[key.strip()] = value.strip()
        elif line and not line.startswith("#"):
            files.append(ROOT + line.replace("\\", "/"))
    return header, files


def main():
    if len(sys.argv) != 2:
        sys.exit("usage: python3 tools/check_package.py <zip>")
    problems = []
    with zipfile.ZipFile(sys.argv[1]) as archive:
        names = {n for n in archive.namelist() if not n.endswith("/")}
        outside = sorted(n for n in names if not n.startswith(ROOT))
        if outside:
            problems.append("outside the Ding folder: " + ", ".join(outside))

        expected = tracked()
        missing = sorted((expected | REQUIRED) - names)
        extra = sorted(names - expected - EXTRAS)
        if missing:
            problems.append("missing: " + ", ".join(missing))
        if extra:
            problems.append("not part of the addon: " + ", ".join(extra))

        for name in sorted(expected & names):
            if name.lower().endswith(BINARY):
                with open(name, "rb") as source:
                    if archive.read(name) != source.read():
                        problems.append("changed by the packager: " + name)

        version = "?"
        if "Ding/Ding.toc" in names:
            header, files = toc_header_and_files(archive.read("Ding/Ding.toc").decode("utf-8"))
            version = header.get("Version", "")
            if not version or "@" in version:
                problems.append("TOC version not replaced: " + repr(version))
            if header.get("X-Curse-Project-ID") != PROJECT_ID:
                problems.append("TOC X-Curse-Project-ID is not " + PROJECT_ID)
            if not header.get("Interface", "").startswith("16"):
                problems.append("TOC interface is not Forever's: " + header.get("Interface", ""))
            for path in files:
                if path not in names:
                    problems.append("loaded by the TOC but missing: " + path)

    if problems:
        for problem in problems:
            print("ERROR", problem)
        sys.exit(1)
    print("ok: %d files, version %s" % (len(names), version))


if __name__ == "__main__":
    main()
