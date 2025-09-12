## Development Approach

- **Test-Driven Development Strategy**:
  - For each code generation session, create a structured approach:
    - Generate code and modify types
    - Create functions with stubbed return values
    - Create unit tests that check for expected values (may initially fail)
    - Implement functions progressively
    - Run unit tests to verify implementation
  - When modifying existing functions:
    - Ensure a unit test exists
    - Create a unit test if none exists
    - Modify the function
    - Run tests to verify changes
- **Continuous TDD Commitment**: Consistently apply test-driven development principles throughout the project lifecycle



## Testing Guidelines

- Do your best to test the exposed API, its inputs and outputs, rather than implementation details.
- TDD is non-negotiable. Always write the tests first and ensure they fail before implementing the fix. Move in baby steps through the red-green-refactor cycles.

## Definition of Done

- A task is not done if the linter is not passing for the whole project
- A task is not done if it has new behavior without tests to ensure the new behavior.

@https://nizar.se/tdd-guard-for-claude-code/