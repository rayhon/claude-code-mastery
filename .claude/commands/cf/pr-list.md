## PR List

Display a prioritized list of open PRs in the current repository.

### Usage

```bash
# Ask Claude
"Show me the list of open PRs, ordered by priority."
```

### Basic Example

```bash
# Get repository info
gh repo view --json nameWithOwner | jq -r '.nameWithOwner'

# Get open PR info and ask Claude
gh pr list --state open --draft=false --json number,title,author,createdAt,additions,deletions,reviews --limit 30

"Sort the above PRs by priority and display them with 2-line summaries for each PR. Use the repository name obtained above to generate the URLs."
```

### Display Format

```
List of Open PRs (by Priority)

### High Priority
#Number Title [Draft/DNM] | Author | Time since opened | Approved count | +Additions/-Deletions
      ├─ Summary line 1
      └─ Summary line 2
      https://github.com/owner/repo/pull/Number

### Medium Priority
(Same format)

### Low Priority
(Same format)
```

### Priority Criteria

**High Priority**

* PRs with `fix:` (bug fixes)
* PRs with `release:` (release tasks)

**Medium Priority**

* PRs with `feat:` (new features)
* PRs with `update:` (improvements)
* Other regular PRs

**Low Priority**

* PRs marked "DO NOT MERGE"
* Draft PRs with `test:`, `build:`, or `perf:`

### Notes

* Requires GitHub CLI (`gh`)
* Only open (non-draft) PRs are displayed
* Up to 30 PRs will be shown
* Time shown is the elapsed time since the PR was opened
* PR URLs are auto-generated using the actual repository name
