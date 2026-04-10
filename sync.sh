#!/bin/bash
# Syncs .github/copilot-instructions.md (source of truth) to all AI tool files.
# Run this from the skill folder after updating instructions.

SOURCE=".github/copilot-instructions.md"

if [ ! -f "$SOURCE" ]; then
  echo "Error: $SOURCE not found. Run this script from inside a skill folder."
  exit 1
fi

cp "$SOURCE" CLAUDE.md && echo "✅ CLAUDE.md"
cp "$SOURCE" .cursorrules && echo "✅ .cursorrules"
cp "$SOURCE" .windsurfrules && echo "✅ .windsurfrules"

echo ""
echo "All tool files synced from $SOURCE"