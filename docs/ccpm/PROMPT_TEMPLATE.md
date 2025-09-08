1. **Get issue details:**
```bash
gh issue view $ARGUMENTS --json state,title,labels,body
```
If it fails: "❌ Cannot access issue #$ARGUMENTS. Check number or run: gh auth login"


### 1. Ensure Worktree Exists

Check if epic worktree exists:
```bash
# Find epic name from task file
epic_name={extracted_from_path}

# Check worktree
if ! git worktree list | grep -q "epic-$epic_name"; then
  echo "❌ No worktree for epic. Run: /pm:epic-start $epic_name"
  exit 1
fi
```

### 2. Read Analysis
Read @.claude/epics/{epic_name}/$ARGUMENTS-analysis.md
- Parse parallel streams
- Identify which can start immediately
- Note dependencies between streams


