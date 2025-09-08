# User Guide
## Setup
```bash
cd path/to/your/project/
curl -sS https://raw.githubusercontent.com/rayhon/claude-code-mastery/master/install/setup.sh | bash
```

## Initialize
```bash
# initialize the system
/cf:init

# create claude code
/init include rules from .claude/CLAUDE.md

# If you already have a CLAUDE.md file, run: /cf:re-init to update it with important rules from .claude/CLAUDE.md.
/cf:re-init

# prime the system
/cf:prime
```


## Start first feature
```bash
# Turn ideas into prd
/cf:prd [your feature name]
# Create design plan
/cf:design
# Create tasks.md
/cf:plan
# Split into individual tasks that can be handled in separation (ie. parallelizable)
/cf:split-tasks

# Handle tasks
/cf:execute
# Agent begins work, maintains local progress
/cf:issue-start 1234
# Updates posted as issue comments
/cf:issue-sync 1234
# Edit issue details
/cf:issue-edit
# Mark issue as complete
/cf:issue-close
# Reopen closed issue
/cf:issue-reopen
# Check issue status
/cf:issue-status
# Display issue and sub issues
/cf:issue-show 
# Analyze what can be parallelized
/cf:issue-analyze 1234
```

# Technical Notes
## Design Decisions
* All commands operate on local files first for speed
* Synchronization with GitHub is explicit and controlled
* Worktrees provide clean git isolation for parallel work

