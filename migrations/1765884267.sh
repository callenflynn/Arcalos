echo "Change to openai-codex instead of openai-codex-bin"

if arcalos-pkg-present openai-codex-bin; then
    arcalos-pkg-drop openai-codex-bin
    arcalos-pkg-add openai-codex
fi
