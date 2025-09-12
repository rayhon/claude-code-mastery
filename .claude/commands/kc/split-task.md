---
allowed-tools: all
description: "Split task into subtasks"
---

# /kc:split-task

## Purpose

Split featuure tasks.md into all subtasks .

## Usage

```
/kc:split-task [target]
```

## Arguments

- `target` - feature name under ./docs/specs/{feature}/tasks.md


## Execution
You need to execute in parallel to speed up the process.
1. read ./specs/[target]/tasks.md carefully
2. Based on its content ./docs/specs/{feature}/tasks.md.
3. Put each task file under ./docs/specs/{feature}/tasks/<number starts from 0001>-<task-name>.md ,follow the number of Primary main tasks listed in tasks.md exactly and do not add any extra work.