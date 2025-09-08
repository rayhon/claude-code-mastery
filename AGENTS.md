# **Global Rules**

- You are an agent - please keep going until the user's query is completely resolved, before ending your turn and yielding back to the user. Only terminate your turn when you are sure that the problem is solved.
- If you are not sure about file content or codebase structure pertaining to the user's request, use your tools to read files and gather the relevant information: do NOT guess or make up an answer.
- You MUST plan extensively before each function call, and reflect extensively on the outcomes of the previous function calls. DO NOT do this entire process by making function calls only, as this can impair your ability to solve the problem and think insightfully.
- Your thinking should be thorough and so it's fine if it's very long. You can think step by step before and after each action you decide to take.
- You MUST iterate and keep going until the problem is solved.
- THE PROBLEM CAN NOT BE SOLVED WITHOUT EXTENSIVE INTERNET RESEARCH.
- Your knowledge on everything is out of date because your training date is in the past.
- You CANNOT successfully complete this task without using Google to verify your understanding of third party packages and dependencies is up to date. You must use the fetch tool or context7 tool to search the documentation for how to properly use libraries, packages, frameworks, dependencies, etc. every single time you install or implement one. It is not enough to just search, you must also read the content of the pages you find and recursively gather all relevant information by fetching additional links until you have all the information you need.
- Only terminate your turn when you are sure that the problem is solved. Go through the problem step by step, and make sure to verify that your changes are correct. NEVER end your turn without having solved the problem, and when you say you are going to make a tool call, make sure you ACTUALLY make the tool call, instead of ending your turn.
- Take your time and think hard through every step - remember to check your solution rigorously and watch out for boundary cases, especially with the changes you made. Your solution must be perfect. If not, continue working on it. At the end, you must test your code rigorously using the tools provided, and do it many times, to catch all edge cases. If it is not robust, iterate more and make it perfect. Failing to test your code sufficiently rigorously is the NUMBER ONE failure mode on these types of tasks; make sure you handle all edge cases, and run existing tests if they are provided.
- Do not assume anything. Use the docs from context7 tool.
- If there is a lint error (bun run lint), fix it before moving on.
- Always create a plan and present it to user and confirm with user before changing/creating any code.
- Use `agent_rules/commit.md` for commit instructions.

# **Project Details**

- Bun as the package manager
- Tailwind CSS for styling
- TypeScript for type safety
- Sonner for toast notifications
- Phosphor Icons, Lucide React for icons
- Shadcn UI and Prompt-kit for components
- Vercel AI SDK v5 for AI
- Next.js 15 and React 19 for the framework
- Convex for authentication, Database, File storage and serverless functions

# **Code Standards**

- Use TypeScript with strict mode enabled. Avoid `any` and `unknown` types. Prefer explicit types and interfaces. Do not use `@ts-ignore` or disable type checks.
- Use functional React components. Always use hooks at the top level. Do not use default exports for components or functions.
- Follow Next.js 15 and React 19 best practices
- Use Tailwind CSS utility classes for styling. Avoid inline styles.
- Use Bun for all package management and scripts (`bun install`).
- Follow Convex guidelines in `agent_rules/convex_rules.md`.
- Use Shadcn UI and Prompt-kit components as documented. Do not modify library code directly. Prefer composition over modification. Follow guidelines in `agent_rules/ui.md` when creating or editing UI components.
- Use Biome for all linting and formatting. Run Biome (`bun run lint`) before committing. Follow all rules specified in `biome.jsonc`. Do not use other linters or formatters (like ESLint or Prettier) unless explicitly specified. Check `biome.jsonc` for custom or overridden rules. Biome extends the `ultracite` ruleset for this project.
- Ensure accessibility: use semantic HTML, provide alt text for images, use ARIA attributes appropriately, and follow accessibility rules in `agent_rules/ultracite.md`.
- Update this section whenever the stack or tooling changes.

# **Architecture Overview**

## Frontend Architecture

- **Next.js App Router**: Uses the modern App Router with layout nesting. Main layout at `app/layout.tsx` with nested layouts for settings (`app/settings/layout.tsx`).
- **Component Structure**:
  - `app/components/`: React components organized by feature (chat, layout, history, etc.)
  - `components/`: Reusable UI components (shadcn/ui, prompt-kit, motion primitives)
  - Components are functional with TypeScript interfaces for props
- **State Management**:
  - React Context providers in `app/providers/` for global state
  - Convex queries/mutations for server state
  - Local state with React hooks
- **Styling**: Tailwind CSS with custom themes and animations

## Backend Architecture (Convex)

- **Real-time Database**: Convex provides real-time updates across all clients
- **Authentication**: Convex Auth with Google OAuth integration
- **File Storage**: Built-in file storage for attachments and images
- **Schema**: Defined in `convex/schema/` with modular table definitions
- **API Functions**:
  - Queries for reading data (`convex/*.ts`)
  - Mutations for writing data
  - Actions for external API calls (AI models, web search)
  - Internal functions for server-side logic

## AI Integration

- **Multi-model Support**: Supports OpenAI, Anthropic, Google, Mistral, Together AI, and more
- **Vercel AI SDK v5**: Handles streaming, tool calling, and model switching
- **Model Selection**: Dynamic model switching with per-chat preferences
- **API Key Management**: Secure encryption of user-provided API keys
- **Web Search**: Integrated Exa, Tavily, and Brave search APIs

## Key Features

- **Real-time Chat**: Live message streaming with Convex subscriptions
- **Multi-modal**: Text, images, and reasoning model support
- **Chat Management**: Pinning, branching, export/import, time-based organization
- **Search**: Full-text search across chat history
- **Personalization**: User customization with traits and preferences
- **Responsive Design**: Mobile-first with drawer navigation

# **Development Commands**

- `bun install` - Install dependencies
- `bun dev` - Start development server with Turbopack
- `bun build` - Build for production
- `bun start` - Start production server
- `bun run lint` - Run Biome linter (ultracite ruleset)
- `bun run format` - Format code with Biome
- `bunx convex dev` - Run Convex development server
- `bun run typecheck` - Run Typecheck

# **Quality Assurance**

- Run `bun run format` and `bun run lint` before committing to ensure code quality
- All TypeScript errors must be resolved (`bun run typecheck`)
- Test responsive design on mobile and desktop
- Verify real-time features work across multiple clients

# **Reference Files**

- `agent_rules/commit.md` - Commit message conventions and process
- `agent_rules/convex_rules.md` - Convex-specific development guidelines  
- `agent_rules/ultracite.md` - Complete linting rules (read to avoid lint errors)
- `agent_rules/ui.md` - shadcn/ui development guidelines and best practices

# important-instruction-reminders

Do what has been asked; nothing more, nothing less.
NEVER create files unless they're absolutely necessary for achieving your goal.
ALWAYS prefer editing an existing file to creating a new one.
NEVER proactively create documentation files (\*.md) or README files. Only create documentation files if explicitly requested by the User.