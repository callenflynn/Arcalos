# Place in each assistant's global skills directory so the arcalos skill is available on first install
mkdir -p ~/.agents/skills ~/.claude/skills ~/.codex/skills ~/.pi/agent/skills
ln -sfn "$ARCALOS_PATH/default/arcalos-skill" ~/.agents/skills/arcalos
ln -sfn "$ARCALOS_PATH/default/arcalos-skill" ~/.claude/skills/arcalos
ln -sfn "$ARCALOS_PATH/default/arcalos-skill" ~/.codex/skills/arcalos
ln -sfn "$ARCALOS_PATH/default/arcalos-skill" ~/.pi/agent/skills/arcalos
