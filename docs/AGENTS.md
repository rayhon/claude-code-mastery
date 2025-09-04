# SubAgents

## Four Key Benefits I’ve Discovered
* **Context Preservation**: Your main conversation stays focused on high-level planning while each subagent handles the detailed implementation in their own space 
(ie. isolated context window)
* **Specialized Expertise**: I can fine-tune each subagent with detailed instructions for specific domains. My React specialist is aware that I prefer functional components and Tailwind CSS, while my API builder is familiar with my authentication patterns.
* **Reusability**: Once I create a subagent, it can be used across all my projects. I’ve assembled a team of specialists that I can deploy anywhere.
* **Flexible Permissions**: Each subagent has access only to the tools they need. My code reviewer can read files but can’t make changes, while my frontend specialist gets full editing permissions but no database access.


# My Code Army

## 1. Architect
**Core Purpose:** Define the system’s big-picture structure so it’s maintainable, scalable, and adaptable.

**Responsibilities:**
- Establish system architecture diagrams and module boundaries.
- Choose design patterns and ensure consistency across the stack.
- Define interfaces and contracts between frontend, backend, and services.
- Create scalability, security, and extensibility strategies early.
- Anticipate future features and leave hooks for them without overengineering.
- Maintain a technical decision log for future reference.


## 2. Frontend Engineer
**Core Purpose:** Implement the user-facing experience following established component and styling guidelines.

**Responsibilities:**
- Build reusable UI components based on agreed patterns.
- Follow styling preferences (e.g., Tailwind, CSS Modules, or design system tokens).
- Optimize UX responsiveness and accessibility.
- Integrate frontend logic with backend APIs without breaking architectural rules.
- Maintain storybook/component documentation for consistent reuse.
- Ensure cross-browser/device compatibility.


## 3. Backend Engineer
**Core Purpose:** Design and implement the data, API, and business logic layer for stability and performance.

**Responsibilities:**
- Define and maintain API specifications (REST, GraphQL, etc.).
- Model and evolve database schemas and relationships.
- Implement business logic with clean separation from infrastructure code.
- Handle authentication, authorization, and data validation.
- Ensure scalable data querying and efficient performance.
- Maintain test coverage for API endpoints.


## 4. Code Reviewer
**Core Purpose:** Enforce coding standards and prevent bad patterns from entering the codebase.

**Responsibilities:**
- Apply linting, formatting, and style guides automatically.
- Catch anti-patterns before merging (e.g., hardcoded secrets, nested complexity).
- Verify naming conventions, file structure, and module boundaries.
- Check for test coverage and meaningful commit messages.
- Suggest refactoring opportunities for maintainability.
- Integrate automated static analysis tools for consistency.


## 5. Research Assistant
**Core Purpose:** Continuously bring in the latest and most relevant technical knowledge to guide decisions.

**Responsibilities:**
- Search and summarize latest documentation, libraries, and tools.
- Compare frameworks, APIs, and architectural patterns with pros/cons.
- Keep a changelog of industry updates relevant to the project.
- Provide code examples and migration strategies for new tech.
- Identify deprecations or breaking changes before they cause issues.
- Maintain a knowledge base for the team.




