# Ding Example Pack

A complete guide pack for [Ding](../../README.md), to copy and start from: two short sections
for the start of a Night Elf (Aldrassil, then the spider cave), with a French translation.

- `DingExamplePack.toc`: the addon, which depends on Ding, and its files in load order.
- `Pack.lua`: the pack (`Ding.RegisterGuidePack`).
- `Guides/`: one section per file (`Ding.RegisterGuide`).
- `Locales/frFR.lua`: the French texts (`Ding.RegisterGuideTranslation`).

To try it, copy this folder into `Interface/AddOns/` and pick "Example pack" in Ding's
settings (*Guide* tab). Everything is explained in [docs/guide-packs.md](../../docs/guide-packs.md).

Ding's tests load this pack and play it, and `tools/check_guides.lua --addon` validates it:
keep it working when the pack format changes.
