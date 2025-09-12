# Bug Fix Command

## Overview

This command reads a GitHub issue by ID and attempts to automatically fix the reported bug.

## Usage

```bash
/bug-fix <issue-id> [flags]
```

## Examples

```bash
# Fix issue #123
/bug-fix 123

# Fix issue with detailed analysis
/bug-fix 123 --analyze

# Fix issue with test generation
/bug-fix 123 --with-tests
```

## Process

1. Fetch issue details using `gh issue view <issue-id>`
2. Analyze the issue description and comments
3. Search for related code in the repository
4. Identify the root cause
5. Implement a fix
6. Validate the fix
7. Create tests if requested
8. Prepare commit message referencing the issue

## Flags

- `--analyze` - Perform deep analysis before fixing
- `--with-tests` - Generate tests for the fix
- `--branch <name>` - Create fix on specific branch
- `--dry-run` - Show what would be changed without making changes

## Implementation Details

### Step 1: Fetch Issue

```bash
gh issue view <issue-id> --json title,body,comments,labels
```

### Step 2: Analyze Issue

- Extract error messages, stack traces
- Identify affected components
- Understand expected vs actual behavior

### Step 3: Search Codebase

- Use Grep/Glob to find relevant files
- Analyze error patterns
- Identify potential fix locations

### Step 4: Implement Fix

- Apply minimal changes to fix the issue
- Ensure backward compatibility
- Follow existing code patterns

### Step 5: Validation

- Run existing tests
- Verify the fix resolves the issue
- Check for regressions

### Step 6: Create Branch & Commit

```bash
git checkout -b fix/issue-<issue-id>
git add .
git commit -m "fix: <issue-title>

Fixes #<issue-id>"
```

## Error Handling

- Issue not found: Suggest checking issue number and repository
- Unable to identify fix: Provide analysis results for manual intervention
- Tests fail after fix: Rollback and report findings

## Integration

- Works with GitHub CLI (`gh`)
- Integrates with existing test frameworks
- Follows conventional commit format
- Compatible with CI/CD workflows