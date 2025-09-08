Please analyze and fix the GitHub issue: $ARGUMENTS.

Use following steps:

## 1. PLAN
1. Use 'gh issue view' to get the issue details  
2. Understand the problem described in the issue  
3. Ask clarifying questions if necessary  
4. Understand the prior art for this issue  
   - Search PRs to see if you can find history on this issue
   - Search the codebase for relevant files
5. Think harder about how to break the issue down into a series of small, manageable tasks.  
6. Document your plan for reference during implementation

## 2. CREATE CODE  
- Create a new Git branch for the issue.
- Solve the issue in small, manageable steps, according to your plan.  
- Commit your changes after each step.
- Document your changes in project documentation (README.md and /docs/ folder)

## 3. TEST  
- Use playwright via MCP to test the changes if you have made changes to the UI. To login in playwright, execute `docker compose drush uli` command and grab the one-time login URL as Drupal user #1.
- Write behat and (or) tests to describe the expected behavior of your code
- Run the full test suite to ensure you haven't broken anything
- If the tests are failing, fix them, or the functionality.
- Ensure that all tests are passing before moving on to the next step

## 4. LINT
Execute code linting, using tools specific to the project and resolve any errors and warnings.

## 5. DEPLOY  
- Open a PR and request a review.
- Create a cross-reference links between the PR and GH issue.

Remember to use the GitHub CLI (`gh`) for all GitHub-related tasks. 