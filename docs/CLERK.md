## Setup
### Install clerk/remix
```bash
npm install @clerk/remix
```

### .env
```
CLERK_PUBLISHABLE_KEY=<your clerk publishable key>
CLERK_SECRET_KEY=<your clerk secret key>
```

### app/routes/root.tsx
* Take care of the import and export in the root.tsx file.
```tsx

import type { MetaFunction, LoaderFunction } from '@remix-run/node'
// Import `rootAuthLoader()`
import { rootAuthLoader } from '@clerk/remix/ssr.server'
// Import ClerkApp
import { ClerkApp } from '@clerk/remix'

// Export `rootAuthLoader()` as the root route `loader`
export const loader: LoaderFunction = (args) => rootAuthLoader(args)

...
...

// Wrap your app with `ClerkApp`
export default ClerkApp(App)

```