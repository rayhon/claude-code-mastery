#!/usr/bin/env bash

# Read JSON input
input=$(cat)
command=$(echo "$input" | jq -r '.tool_input.command' 2>/dev/null || echo "")
tool_name=$(echo "$input" | jq -r '.tool_name' 2>/dev/null || echo "")

# Only process Bash tool type
if [ "$tool_name" != "Bash" ]; then
  exit 0
fi

# Block dangerous commands (simple matching)
if [[ "$command" == "rm -rf "* ]]; then
  echo "Error: Blocked dangerous command: rm -rf" >&2
  exit 2
fi

if [[ "$command" == "shutdown now" ]]; then
  echo "Error: Blocked dangerous command: shutdown now" >&2
  exit 2
fi

# Allow other commands
exit 0
