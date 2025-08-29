#!/usr/bin/env bash

set -euo pipefail

# Define log paths (disabled)
# log_dir="./logs"
# log_path="$log_dir/post_tool_use.log"
# json_path="$log_dir/post_tool_use.json"

# mkdir -p "$log_dir"

# Read entire stdin as JSON
input_json=$(cat)

# Extract file path using jq
file_path=$(echo "$input_json" | jq -r '.tool_input.file_path')

# Append raw JSON to .json log (disabled)
# if [ -f "$json_path" ]; then
#   # Append to existing JSON array
#   tmp_file=$(mktemp)
#   jq ". += [$input_json]" "$json_path" > "$tmp_file" && mv "$tmp_file" "$json_path"
# else
#   echo "[$input_json]" > "$json_path"
# fi

# Check if file is Python source
if [[ "$file_path" =~ \.pyi?$ && -f "$file_path" ]]; then
  ruff check --fix "$file_path" >/dev/null 2>&1
  ruff format "$file_path" >/dev/null 2>&1
fi

# Match .ts, .tsx, .js, .jsx
if [[ "$file_path" =~ \.(ts|tsx|js|jsx)$ && -f "$file_path" ]]; then
  npx prettier --write "$file_path" >/dev/null 2>&1
fi
