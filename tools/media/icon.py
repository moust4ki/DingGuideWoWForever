"""Turns the Ding icon (a large RGBA PNG) into the game's textures.

usage: python3 tools/media/icon.py docs/icon.png Ding/Media/Textures

Writes icon.tga (64 x 64: minimap button) and icon32.tga (32 x 32: addon list), uncompressed
32-bit TGA with their origin at the bottom left, like the other textures of Ding. The image
is reduced by averaging every source pixel that falls in a target pixel, weighted by its
opacity (no dark fringe around transparent edges). Pure Python, no dependency.
"""
import os
import struct
import sys
import zlib

SIZES = {"icon.tga": 64, "icon32.tga": 32}


def read_png(path):
    """8-bit RGBA, non-interlaced PNG -> (width, height, rows of bytes RGBA)."""
    data = open(path, "rb").read()
    if data[:8] != b"\x89PNG\r\n\x1a\n":
        sys.exit("not a PNG: " + path)
    pos, idat, header = 8, b"", None
    while pos < len(data):
        length, kind = struct.unpack(">I4s", data[pos:pos + 8])
        chunk = data[pos + 8:pos + 8 + length]
        if kind == b"IHDR":
            header = struct.unpack(">IIBBBBB", chunk)
        elif kind == b"IDAT":
            idat += chunk
        pos += 12 + length
    width, height, depth, color, _, _, interlace = header
    if depth != 8 or color != 6 or interlace != 0:
        sys.exit("expected an 8-bit RGBA, non-interlaced PNG")
    raw = zlib.decompress(idat)
    stride, bpp = width * 4, 4
    rows, prev = [], bytearray(stride)
    for y in range(height):
        start = y * (stride + 1)
        kind, line = raw[start], bytearray(raw[start + 1:start + 1 + stride])
        for i in range(stride):
            a = line[i - bpp] if i >= bpp else 0
            b = prev[i]
            c = prev[i - bpp] if i >= bpp else 0
            if kind == 1:
                line[i] = (line[i] + a) & 255
            elif kind == 2:
                line[i] = (line[i] + b) & 255
            elif kind == 3:
                line[i] = (line[i] + (a + b) // 2) & 255
            elif kind == 4:
                p = a + b - c
                pa, pb, pc = abs(p - a), abs(p - b), abs(p - c)
                line[i] = (line[i] + (a if pa <= pb and pa <= pc else (b if pb <= pc else c))) & 255
        rows.append(line)
        prev = line
    return width, height, rows


def reduce(width, height, rows, size):
    """Area average, colors weighted by alpha. Rows of the result from the top."""
    out = []
    for ty in range(size):
        y0, y1 = ty * height // size, (ty + 1) * height // size
        line = []
        for tx in range(size):
            x0, x1 = tx * width // size, (tx + 1) * width // size
            r = g = b = a = n = 0
            for y in range(y0, y1):
                row = rows[y]
                for x in range(x0, x1):
                    i = x * 4
                    alpha = row[i + 3]
                    r += row[i] * alpha
                    g += row[i + 1] * alpha
                    b += row[i + 2] * alpha
                    a += alpha
                    n += 1
            if a:
                line.append((round(r / a), round(g / a), round(b / a), round(a / n)))
            else:
                line.append((0, 0, 0, 0))
        out.append(line)
    return out


def write_tga(path, pixels):
    size = len(pixels)
    header = struct.pack("<BBBHHBHHHHBB", 0, 0, 2, 0, 0, 0, 0, 0, size, size, 32, 0x08)
    body = bytearray()
    for line in reversed(pixels):                 # origin at the bottom left
        for r, g, b, a in line:
            body += bytes((b, g, r, a))           # TGA stores BGRA
    with open(path, "wb") as out:
        out.write(header + bytes(body))


def main():
    if len(sys.argv) != 3:
        sys.exit("usage: python3 tools/media/icon.py <icon.png> <textures dir>")
    width, height, rows = read_png(sys.argv[1])
    for name, size in SIZES.items():
        write_tga(os.path.join(sys.argv[2], name), reduce(width, height, rows, size))
        print(name, size, "x", size)


if __name__ == "__main__":
    main()
