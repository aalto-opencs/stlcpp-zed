# OpenCS branding

The README uses the same 256 × 256 night icon as the STLC++ VS Code extension:
a pink OpenCS symbol on a dark tile. The OpenCS exercise extension uses the pink
tile with a black symbol, so the products are visually distinct.
`docs/opencs-icon.png` is copied unchanged from Kimia's
[OpenCS brand package](https://github.com/aalto-opencs/opencs-platform/pull/960):
`opencs-ui/public/brand/marketplace/night/opencs-listing-night-256.png` at commit
`dd9733b09239acfc1d16b8ff28f5351f042364ba`.

The shared export collection belongs in the platform repo's top-level `brand/`.
This export lives at `exports/marketplace/night/opencs-listing-night-256.png`.
Only the image consumed by this README is kept here; the extension does not
download the private platform repo at build time.

Zed's [extension manifest](https://github.com/zed-industries/zed/blob/main/crates/extension/src/extension_manifest.rs)
has no field for a per-extension listing icon. Branding therefore appears in
the repository documentation; `extension.toml` and the language grammar stay
unchanged. Icon themes are a separate editor feature, not a plugin-logo setting.
