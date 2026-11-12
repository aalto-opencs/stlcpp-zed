# OpenCS branding

The README uses the same 256 × 256 OpenCS icon as the OpenCS and STLC++
VS Code extensions. `docs/opencs-icon.png` is copied unchanged from Kimia's
[OpenCS brand package](https://github.com/aalto-opencs/opencs-platform/pull/960):
`opencs-ui/public/brand/plugin/vscode/vscode-icon-256.png` at commit
`dd9733b09239acfc1d16b8ff28f5351f042364ba`.

The shared export collection belongs in the platform repo's top-level `brand/`.
Only the image consumed by this README is kept here; the extension does not
download the private platform repo at build time.

Zed's [extension manifest](https://github.com/zed-industries/zed/blob/main/crates/extension/src/extension_manifest.rs)
has no field for a per-extension listing icon. Branding therefore appears in
the repository documentation; `extension.toml` and the language grammar stay
unchanged. Icon themes are a separate editor feature, not a plugin-logo setting.
