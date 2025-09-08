# Prompt Guide

## Example 1

```md
---
allowed-tools: Bash(git add:*), Bash(git status:*), Bash(git commit:*)
description: Review PR
argument-hint: [message]
description: Create a git commit
model: claude-3-5-haiku-20241022
---

## Context

- Current git status: !`git status`
- Current git diff (staged and unstaged changes): !`git diff HEAD`
- Current branch: !`git branch --show-current`
- Recent commits: !`git log --oneline -10`

## Your task
Review PR #$1 with priority $2 and assign to $3

```
* use ! to execute bash command
* use @ to reference a file
* $ARGUMENTS all arguments while $1, $2, $3 separate them out 

```bash
# Usage
> /review-pr 456 high alice
# $1 becomes "456", $2 becomes "high", $3 becomes "alice"
```

## Example 2
Call MCP directly

```bash
/mcp__<server-name>__<prompt-name> [arguments]
```