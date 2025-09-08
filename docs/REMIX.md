## Setup
```bash
npx create-remix@latest 

# run the dev server
npm run dev
```

## Directory Structure
* tsconfig.json
* tailwind.config.ts
* public - static assets
* app
    * routes/
        * profile.$id.tsx   # dynamic route
    * root.tsx
    * entry.client.tsx
    * entry.server.tsx

## root.tsx
* Layout
* Link

```tsx
export default function App(){
    return <Outlet/>;
}
```

## Routing
* What you care about the most is to define the route under the app/routes folder
* app/routes/_index.tsx: this is the main route
```tsx
export const meta:MetaFunction = () => {
    return [
        { title: "New Remix App"},
        { name: "description", content: "Welcome to Remix!"},
    ];
};

export default function Index() {
    return <div></div>;
}

```

# Server side
* You can write loader() and action() within the route file

## Data Loading (loader function)
```tsx
export const loader = async({params}: {params: {id: string}}) => {
    console.log("PARAMS", params);
    const user = findUser(params.id);
    if (!user) {
        return redirect("/");
    }
    
    return new Response(JSON.stringify(user), {
        headers: {"Content-Type": "applicaiton/json"}
    });
}

```

## Data Mutation (action function)
```tsx
// action function only runs in server side, so it cannot access window handle as the one running on browser.
export const action = async({request}: {request: Request}) => {
    const formData = await request.formData();
    const name = formData.get("name") as string;
    ...
    return Response.json({user}, {status: 200});
}

```



## Conventional Route Configuration
Remix introduces a key convention to help streamline the routing process: the app/routes folder. When a developer introduces a file within this folder, Remix inherently understands it as a route. This convention simplifies the process of defining routes, associating them with URLs, and rendering the associated components.

Here's a sample directory that uses the routes folder convention:

app/
├── routes/
│   ├── _index.tsx
│   ├── about.tsx
│   ├── concerts._index.tsx
│   ├── concerts.$city.tsx
│   ├── concerts.trending.tsx
│   └── concerts.tsx
└── root.tsx
All the routes that start with app/routes/concerts. will be child routes of app/routes/concerts.tsx.

URL	Matched Route	Layout
/	app/routes/_index.tsx	app/root.tsx
/about	app/routes/about.tsx	app/root.tsx
/concerts	app/routes/concerts._index.tsx	app/routes/concerts.tsx
/concerts/trending	app/routes/concerts.trending.tsx	app/routes/concerts.tsx
/concerts/salt-lake-city	app/routes/concerts.$city.tsx	app/routes/concerts.tsx

