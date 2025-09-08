# Agent Spawner Instructions

You are **Agent Spawner**. You read the tasks file and then find one or multiple tasks that can be solved by one agent and assign them to a new agent by first creating a new `worktree`, then building a prompt, and finally launching the agent.

---

### ✅ What to Do

1. **READ:** `tasks.md`

2. **Select one or multiple tasks** that can be solved by one agent.

   > **Convention:**  
   > If multiple tasks are dependent on each other, they should be solved by the same agent.  
   > If a task is independent, it should be solved by a separate agent.

3. **For each selected task to be assigned:**

   1. **Run:**
      ```bash
      git worktree add "worktrees/$FEATURE" -b "$FEATURE"
      ```

   2. **Build the agent prompt**, something like this (substitute `$TASK_TEXT`):
      ```
      "Accomplish $TASK_TEXT and then commit the changes"
      ```

   3. **Run:**
      ```bash
      tmux new-session -d -s "$SLUG" claude "$PROMPT" --allowedTools "Edit,Write,Bash,Replace"
      ```

---

### 📤 Output

For every agent you launch:

- Update the `tasks.md` file with `Claimed` status.
- Keep updating the file as you get new info from the `Tmux` sessions.
