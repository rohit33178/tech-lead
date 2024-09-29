# Major Topics in React

1. Components and Props
   - Definition: Building blocks of React applications
   - Functional vs Class Components
   - Props: Passing data between components
   - PropTypes: Type-checking for props
   - Default Props
   - Children props
   - Component composition


2. State and Lifecycle
   - Definition: Managing component data
   - useState: Managing state in functional components
   - useEffect: Handling side effects
   - Lifecycle methods: Managing component lifecycle
   - Hooks: Managing state and side effects
   - useContext: Accessing context in functional components
   - useReducer: Managing state with reducers   
   - useCallback: Memoizing callbacks
   - useMemo: Memoizing values
   - useRef: Accessing DOM elements
   - useImperativeHandle: Customizing refs
   - useLayoutEffect: Side effects with layout updates      


3. Event Handling
   - Definition: Handling user interactions
   - Event handlers: Handling events in React
   - SyntheticEvent: Standardized event handling
   - Event delegation: Efficient event handling
   - SyntheticEvent: Standardized event handling    


4. Conditional Rendering
   - Definition: Conditional rendering of components
   - Ternary operator: Conditional rendering
   - Logical &&: Conditional rendering
   - useMemo: Memoizing values
   - useCallback: Memoizing callbacks


5. Lists and Keys
   - Definition: Rendering lists of components
   - Key props: Identifying elements in lists



6. Forms and Controlled Components
   - Definition: Handling form inputs
   - Controlled components: Managing form state
   - Uncontrolled components: Accessing form state


7. Lifting State Up
   - Definition: Passing state up to parent components



8. Composition vs Inheritance
   - Definition: Composition vs Inheritance


9. Context
   - Definition: Sharing data between components
10. Hooks
    **- useState**
    Example:
    ```jsx
    import React, { useState } from 'react';

    function Counter() {
      const [count, setCount] = useState(0);

      return (
        <div>
          <p>You clicked {count} times</p>
          <button onClick={() => setCount(count + 1)}>
            Click me
          </button>
        </div>
      );
    }
    ```
    This example demonstrates the basic usage of useState hook to manage state in a functional component.
    
    **- useEffect**
    Example:
    ```jsx
    import React, { useState, useEffect } from 'react';

    function DataFetcher() {
      const [data, setData] = useState(null);

      useEffect(() => {
        // This effect runs after the component mounts
        fetch('https://api.example.com/data')
          .then(response => response.json())
          .then(result => setData(result));

        // Optional cleanup function
        return () => {
          // This runs when the component unmounts
          console.log('Component is unmounting');
        };
      }, []); // Empty dependency array means this effect runs once on mount

      return (
        <div>
          {data ? <p>Data: {JSON.stringify(data)}</p> : <p>Loading...</p>}
        </div>
      );
    }
    ```
    This example demonstrates the usage of useEffect hook for side effects like data fetching. It also includes a cleanup function.

    **- useContext**
    Example:
    ```jsx
    import React, { useContext, createContext } from 'react';

    const ThemeContext = createContext('light');

    function ThemedButton() {
      const theme = useContext(ThemeContext);
      return <button style={{ background: theme === 'dark' ? 'black' : 'white', color: theme === 'dark' ? 'white' : 'black' }}>I'm a {theme} themed button</button>;
    }

    function App() {
      return (
        <ThemeContext.Provider value="dark">
          <ThemedButton />
        </ThemeContext.Provider>
      );
    }
    ```
    This example shows how to use useContext to consume a context value, allowing for theme-based styling.

    **- useReducer**
    Example:
    ```jsx
    import React, { useReducer } from 'react';

    const initialState = { count: 0 };

    function reducer(state, action) {
      switch (action.type) {
        case 'increment':
          return { count: state.count + 1 };
        case 'decrement':
          return { count: state.count - 1 };
        default:
          throw new Error();
      }
    }

    function Counter() {
      const [state, dispatch] = useReducer(reducer, initialState);
      return (
        <>
          Count: {state.count}
          <button onClick={() => dispatch({ type: 'increment' })}>+</button>
          <button onClick={() => dispatch({ type: 'decrement' })}>-</button>
        </>
      );
    }
    ```
    This example demonstrates useReducer for more complex state logic, implementing a simple counter.

    **- useCallback**
    Example:
    ```jsx
    import React, { useState, useCallback } from 'react';

    function ParentComponent() {
      const [count, setCount] = useState(0);

      const incrementCount = useCallback(() => {
        setCount(prevCount => prevCount + 1);
      }, []); // Empty dependency array means this callback is memoized and won't change

      return (
        <div>
          <ChildComponent onIncrement={incrementCount} />
          <p>Count: {count}</p>
        </div>
      );
    }

    function ChildComponent({ onIncrement }) {
      console.log('ChildComponent rendered');
      return <button onClick={onIncrement}>Increment</button>;
    }
    ```
    This example shows useCallback to memoize a callback function, optimizing performance by preventing unnecessary re-renders of child components.

    **- useMemo**
    Example:
    ```jsx
    import React, { useState, useMemo } from 'react';

    function ExpensiveComputation({ list, filter }) {
      const filteredList = useMemo(() => {
        console.log('Computing filtered list');
        return list.filter(item => item.includes(filter));
      }, [list, filter]); // Only recompute if list or filter changes

      return (
        <ul>
          {filteredList.map(item => <li key={item}>{item}</li>)}
        </ul>
      );
    }

    function App() {
      const [filter, setFilter] = useState('');
      const list = ['apple', 'banana', 'cherry', 'date', 'elderberry'];

      return (
        <div>
          <input value={filter} onChange={e => setFilter(e.target.value)} placeholder="Filter fruits" />
          <ExpensiveComputation list={list} filter={filter} />
        </div>
      );
    }
    ```
    This example demonstrates useMemo to memoize the result of an expensive computation, improving performance by avoiding unnecessary recalculations.

    **- useRef**
    Example:
    ```jsx
    import React, { useRef, useEffect } from 'react';

    function FocusInput() {
      const inputRef = useRef(null);

      useEffect(() => {
        // Focus the input element when component mounts
        inputRef.current.focus();
      }, []);

      return <input ref={inputRef} />;
    }
    ```
    This example shows useRef to get a reference to a DOM element and focus it when the component mounts.
    
11. Higher-Order Components (HOCs)
Higher-Order Components (HOCs) are functions that take a component and return a new component with additional props or behavior. They're used for code reuse, logic abstraction, and to modify component behavior.

Use cases for HOCs include:
1. Adding loading states
2. Handling authentication
3. Wrapping components with common styles or layouts
4. Adding additional props or modifying existing ones

Example:

**1. Adding loading states**
```javascript
function withLoading(Component) {
  return function WithLoadingComponent({ isLoading, ...props }) {
    if (!isLoading) return <Component {...props} />;
    return <p>Loading...</p>;
  };
}

const DataComponent = ({ data }) => <div>{data}</div>;
const DataComponentWithLoading = withLoading(DataComponent);
```

**2. Handling authentication**
```javascript
function withAuth(Component) {
  return function WithAuthComponent({ isAuthenticated, ...props }) {
    if (isAuthenticated) return <Component {...props} />;
    return <p>Please log in to view this content.</p>;
  };
}

const SecretComponent = () => <div>Secret Content</div>;
const SecretComponentWithAuth = withAuth(SecretComponent);
```

**3. Wrapping components with common styles or layouts**

```javascript
function withLayout(Component) {
  return function WithLayoutComponent(props) {
    return (
      <div style={{ border: '1px solid black', padding: '10px' }}>
        <Component {...props} />
      </div>
    );
  };
}

const SimpleComponent = () => <div>Simple Content</div>;
const SimpleComponentWithLayout = withLayout(SimpleComponent);
```

**4. Adding additional props or modifying existing ones**
```javascript
function withExtraProps(Component) {
  return function WithExtraPropsComponent(props) {
    const newProps = { ...props, extraProp: 'I am an extra prop' };
    return <Component {...newProps} />;
  };
}

const BasicComponent = ({ extraProp }) => <div>{extraProp}</div>;
const BasicComponentWithExtraProps = withExtraProps(BasicComponent);
```

12. Render Props
```javascript
// Render Props Example
const DataFetcher = ({ render }) => {
  const [data, setData] = React.useState(null);

  React.useEffect(() => {
    fetch('/api/data')
      .then(response => response.json())
      .then(data => setData(data));
  }, []);

  return render(data);
};

const RenderPropsComponent = () => (
  <DataFetcher render={data => (data ? <div>{data}</div> : <div>Loading...</div>)} />
);

// Another use case: Toggle Component using Render Props
const Toggle = ({ render }) => {
  const [on, setOn] = React.useState(false);

  const toggle = () => setOn(!on);

  return render({ on, toggle });
};

const ToggleComponent = () => (
  <Toggle
    render={({ on, toggle }) => (
      <div>
        <button onClick={toggle}>{on ? 'ON' : 'OFF'}</button>
        {on && <div>The toggle is ON</div>}
      </div>
    )}
  />
);
```


13. Refs and the DOM
14. Error Boundaries
15. Fragments
16. Portals
17. Reconciliation and Virtual DOM
18. JSX
19. React Router
20. State Management (e.g., Redux, MobX)
21. Server-Side Rendering (SSR)
22. Performance Optimization
23. Testing React Applications
24. React DevTools
25. Styling in React (CSS-in-JS, Styled Components)
26. React and TypeScript
27. React Suspense and Lazy Loading
28. Concurrent Mode
29. Server Components
30. React Native (for mobile development)

These topics cover the core concepts, advanced features, and ecosystem tools related to React development.
