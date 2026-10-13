"""Prepares the textures of the Ding design kit for the game.

usage: python3 tools/media/textures.py Ding/Media/Textures

- Draws the one texture the handoff does not ship: a 1-unit border at radius 4 (dropdown
  list), 32 x 32, white, anti-aliased (8 x 8 samples per pixel), like the kit's.
- Rewrites every uncompressed TGA of the folder with its origin at the bottom left (the
  kit stores rows from the top). That is the usual TGA layout, the one of Blizzard's and
  other addons' files: a loader that ignores the origin flag cannot show it upside down.
Pure Python, no dependency. Running it again changes nothing.
"""
import glob
import os
import struct
import sys

SIZE = 32
SAMPLES = 8
TOP_ORIGIN = 0x20


def inside_rounded(x, y, left, top, right, bottom, radius):
    """Is the point inside the rounded rectangle?"""
    if x < left or x > right or y < top or y > bottom:
        return False
    cx = min(max(x, left + radius), right - radius)
    cy = min(max(y, top + radius), bottom - radius)
    return (x - cx) ** 2 + (y - cy) ** 2 <= radius ** 2


def ring(radius, stroke):
    """Coverage (0-255) of a rounded ring, rows from the top, outer edge on the texture edge."""
    rows = []
    inner = max(radius - stroke, 0)
    for py in range(SIZE):
        row = []
        for px in range(SIZE):
            hits = 0
            for sy in range(SAMPLES):
                for sx in range(SAMPLES):
                    x = px + (sx + 0.5) / SAMPLES
                    y = py + (sy + 0.5) / SAMPLES
                    if inside_rounded(x, y, 0, 0, SIZE, SIZE, radius) and not inside_rounded(
                            x, y, stroke, stroke, SIZE - stroke, SIZE - stroke, inner):
                        hits += 1
            row.append(round(255 * hits / (SAMPLES * SAMPLES)))
        rows.append(row)
    return rows


def write_tga(path, rows):
    """32-bit white TGA, origin at the bottom left (rows given from the top)."""
    height, width = len(rows), len(rows[0])
    header = struct.pack("<BBBHHBHHHHBB", 0, 0, 2, 0, 0, 0, 0, 0, width, height, 32, 0x08)
    body = bytearray()
    for row in reversed(rows):
        for a in row:
            body += bytes((255, 255, 255, a))
    with open(path, "wb") as out:
        out.write(header + bytes(body))


def bottom_origin(path):
    """Rewrites an uncompressed 32-bit TGA stored from the top. Returns True if changed."""
    data = open(path, "rb").read()
    id_length, kind = data[0], data[2]
    width, height, bpp, descriptor = struct.unpack("<HHBB", data[12:18])
    if kind != 2 or bpp != 32 or not descriptor & TOP_ORIGIN:
        return False
    start = 18 + id_length
    stride = width * 4
    pixels = data[start:start + stride * height]
    rows = [pixels[i * stride:(i + 1) * stride] for i in range(height)]
    header = bytearray(data[:start])
    header[17] = descriptor & ~TOP_ORIGIN
    with open(path, "wb") as out:
        out.write(bytes(header) + b"".join(reversed(rows)) + data[start + stride * height:])
    return True


def main():
    if len(sys.argv) != 2:
        sys.exit("usage: python3 tools/media/textures.py <textures dir>")
    folder = sys.argv[1]
    write_tga(os.path.join(folder, "rr4_stroke1.tga"), ring(4, 1))
    print("rr4_stroke1.tga drawn")
    for path in sorted(glob.glob(os.path.join(folder, "*.tga"))):
        if bottom_origin(path):
            print(os.path.basename(path) + ": origin moved to the bottom left")


if __name__ == "__main__":
    main()
