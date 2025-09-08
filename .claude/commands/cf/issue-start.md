# Custom Command: Create GitHub Issue

## Command Usage
`create-issue <description>`

Everything after `create-issue` is treated as a single argument containing the user's description of what they want to achieve.

## Instructions

You are implementing a command that intelligently creates GitHub issues based on user descriptions. Follow these steps thoroughly:

### 1. Parse and Understand Context
- Accept the full text after the command as the user's description
- Analyse the current working directory to understand the project context
- Identify the Git repository and its remote origin

### 2. Codebase Analysis
- Explore the relevant parts of the codebase mentioned in the description
- Look for:
  - Related existing code
  - Configuration files
  - Documentation (README, docs/, wiki references)
  - Similar patterns or implementations
  - Dependencies that might be affected

### 3. Issue Classification
Determine the issue type based on the description:
- **Bug**: Something is broken or not working as expected
- **Feature**: New functionality that doesn't exist
- **Enhancement**: Improvement to existing functionality
- **Task**: Technical work, refactoring, or maintenance

### 4. Break Down Into Tasks
Decompose the description into specific, actionable tasks:
- Each task should be atomic and testable
- Consider technical dependencies
- Include both implementation and testing tasks
- Think about documentation updates needed

### 5. Define Acceptance Criteria
For each major component, establish clear acceptance criteria:
- What specific behaviour should be implemented?
- What are the success conditions?
- What edge cases need handling?
- What tests would validate the implementation?

### 6. Generate Issue Content
Structure the issue with:
- **Title**: Concise, descriptive summary
- **Type**: Bug/Feature/Enhancement/Task label
- **Description**: Clear explanation of the need
- **Tasks**: Bulleted list of implementation steps
- **Acceptance Criteria**: Testable success conditions
- **Technical Notes**: Any implementation considerations
- **Related Files**: Key files that will be affected

### 7. Present for Confirmation
Before creating the issue, present the formatted content to the user:
```
=== GitHub Issue Preview ===
Repository: [detected repo]
Title: [generated title]
Type: [classification]

Description:
[formatted description]

Tasks:
- [ ] Task 1
- [ ] Task 2
...

Acceptance Criteria:
- [ ] Criteria 1
- [ ] Criteria 2
...

Technical Notes:
[any relevant notes]

Related Files:
- file1.js
- file2.php
...
===========================

Would you like to create this issue? (yes/no)


### 8. Create the Issue
If confirmed:
- Detect the Git remote origin URL
- Extract the GitHub repository owner and name
- Use the GitHub API to create the issue
- Return the created issue URL

## Example Behaviour

User input: `create-issue Add user authentication with email verification and password reset functionality`

Your process:
1. Scan for existing auth implementation
2. Check for auth-related dependencies
3. Classify as "Feature"
4. Break down into: database schema, registration endpoint, email service, verification flow, password reset flow, tests
5. Define criteria for each component
6. Present formatted issue for review
7. Create upon confirmation

## Error Handling
- If no Git repository found: Inform user and exit
- If no remote origin: Ask user to specify repository
- If GitHub API fails: Provide issue content for manual creation
- If description too vague: Ask clarifying questions

## Important Notes
- Always think step-by-step through the entire process
- Be thorough in codebase exploration
- Make reasonable assumptions but note them
- Focus on creating actionable, well-structured issues
- Consider the project's conventions and patterns 