#!/usr/bin/env bash

# Extract command from Claude's JSON input
COMMAND=$(jq -r '.tool_input.command' 2>/dev/null || echo "")

# If it's a git commit command
if echo "$COMMAND" | grep -q '^git commit'; then
  # Check if it contains AI generation signature
  if echo "$COMMAND" | grep -q '🤖 Generated with'; then
    echo "Error: Commit message contains AI signature, commit blocked." >&2
    echo "Please remove signature and commit again." >&2
    exit 2
  fi
fi

# Otherwise allow execution
exit 0
