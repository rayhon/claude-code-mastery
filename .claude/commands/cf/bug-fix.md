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

## Process (no flags)
When /bug-fix <issue-id> is run with no flags, the agent will:

1. Fetch issue details using `gh issue view <issue-id>`
2. Perform a light analysis of the description and comments.
3. Search for related code in the repository
4. Identify the root cause
5. Implement a minimal fix consistent with coding style and conventions.
6. Validate the fix by running the existing test suite.
7. Create a new branch (fix/issue-<id>), commit the changes, and push.
8. Open a pull request referencing the issue.


## Flags

- `--analyze` - Perform deep analysis before fixing
- `--with-tests` - Generate new tests in addition to running existing ones.
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

Fixes #<issue-id>

Root cause: <root cause here>
Solution: <describe fix here>"
```
### Step 7: Push and create a PR
```bash
git push origin fix/issue-<issue-id>
gh pr create --fill --head fix/issue-<issue-id>
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