<instruction>Main task</instruction>
<context>Background info</context>
<code_example>Sample code</code_example>

# Create a new branch and worktree
git worktree add ../project-feature-a -b feature-a

# Use an existing branch
git worktree add ../project-bugfix bugfix-123

# List and remove
git worktree list
git worktree remove ../project-feature-a


## Loop Case 1
<execution-flow>

  FOR each parent_task assigned in Step 1:
    EXECUTE instructions from execute-task.md with:
      - parent_task_number
      - all associated subtasks
    WAIT for task completion
    UPDATE tasks.md status
  END FOR and EXIT WHEN <exit-condition> is TRUE

  <exit-condition>
  </exit-condition>

</execution-flow>

## Loop Case 2
<execution-flow>

  <foreach parent_task in Step 1>
    EXECUTE instructions from execute-task.md with:
      - parent_task_number
      - all associated subtasks
    WAIT for task completion
    UPDATE tasks.md status
  </foreach exit="<exit-condition>">

  <exit-condition>
  </exit-condition>

</execution-flow>

## If/Else Case
<execution-flow>

  <if condition="<condition>">
    - 
    - 
  </if>
  <else>
    - 
  </else>

</execution-flow>

## Switch Cases
<execution-flow>
<check>
    <condition="xxxx">
        - kkh
    </condition>
    <condition="xxxx">
        - jyf
    </condition>
    <condition="xxxx">
        - 
    </condition>
    <catch-all>
    </catch-all>
</check>
    
</execution-flow>