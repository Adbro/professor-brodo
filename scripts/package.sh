#!/bin/sh
# Builds dist/professor-brodo.zip: the skill folder, ready to upload to ChatGPT
# (Skills -> Create -> Upload from your computer) or claude.ai (custom skill upload).
# Run from anywhere after editing anything under plugins/professor-brodo/skills/.
set -eu
root=$(cd "$(dirname "$0")/.." && pwd)
mkdir -p "$root/dist"
rm -f "$root/dist/professor-brodo.zip"
cd "$root/plugins/professor-brodo/skills"
# -X drops extra file attributes; folder name must match the skill's `name`
zip -q -X -r "$root/dist/professor-brodo.zip" professor-brodo -x '*.DS_Store'
echo "built dist/professor-brodo.zip"
unzip -l "$root/dist/professor-brodo.zip"
