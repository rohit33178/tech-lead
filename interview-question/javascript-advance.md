Here are some important questions related to advanced topics of JavaScript that can be used to evaluate a 10-year candidate for tech lead roles:

**JavaScript Advanced Topics**

1. Explain the concept of closures in JavaScript and provide an example.
   - Closures are functions that have access to variables in their outer (enclosing) lexical scope, even after the outer function has returned.
   - They allow for data privacy and the creation of function factories.
   Example:
   ```javascript
   function createCounter() {
     let count = 0;
     return function() {
       return ++count;
     };
   }
   const counter = createCounter();
   console.log(counter()); // 1
   console.log(counter()); // 2
   ```

2. Describe the event loop in JavaScript and how it handles asynchronous operations.
   - The event loop is a mechanism that allows JavaScript to perform non-blocking operations despite being single-threaded.
   - It continuously checks the call stack and the callback queue, pushing callbacks to the stack when it's empty.
   Example:
   ```javascript
   console.log('Start');
   setTimeout(() => console.log('Timeout'), 0);
   Promise.resolve().then(() => console.log('Promise'));
   console.log('End');
   // Output: Start, End, Promise, Timeout
   ```

3. What are Symbols in JavaScript and how are they used?
   - Symbols are a primitive data type introduced in ES6, representing unique identifiers.
   - They are often used as property keys to avoid naming conflicts in objects.
   Example:
   ```javascript
   const mySymbol = Symbol('description');
   const obj = {
     [mySymbol]: 'This is a symbol property'
   };
   console.log(obj[mySymbol]); // 'This is a symbol property'
   ```

4. Explain the concept of currying in functional programming and provide an example.
   - Currying is the technique of translating a function with multiple arguments into a sequence of functions, each with a single argument.
   Example:
   ```javascript
   const multiply = (a) => (b) => a * b;
   const multiplyByTwo = multiply(2);
   console.log(multiplyByTwo(4)); // 8
   ```

5. Describe the differences between var, let, and const for variable declarations.
   - var: function-scoped, hoisted, can be redeclared
   - let: block-scoped, not hoisted, cannot be redeclared in the same scope
   - const: block-scoped, not hoisted, cannot be redeclared or reassigned
   Example:
   ```javascript
   function example() {
     var x = 1;
     let y = 2;
     const z = 3;
     if (true) {
       var x = 4; // Same variable
       let y = 5; // Different variable
       // const z = 6; // Would throw an error
     }
     console.log(x, y, z); // 4, 2, 3
   }
   ```



**JavaScript Performance Optimization**

1. What are the different ways to optimize JavaScript performance, and can you provide examples for each?

   a) Minimize DOM manipulation:
      - Batch DOM updates using DocumentFragment
      - Use CSS classes for styling changes instead of inline styles
      - Implement virtual DOM techniques (like in React) for efficient updates
      - Use requestAnimationFrame for smooth animations

      Example of batching DOM updates:
      ```javascript
      const fragment = document.createDocumentFragment();
      for (let i = 0; i < 1000; i++) {
        const li = document.createElement('li');
        li.textContent = `Item ${i}`;
        fragment.appendChild(li);
      }
      document.getElementById('myList').appendChild(fragment);
      ```

   b) Use efficient data structures and algorithms:
      - Choose appropriate data structures (e.g., Map for frequent lookups)
      - Implement efficient sorting and searching algorithms
      - Use Set for unique values and fast lookups
      - Consider using TypedArrays for large numerical datasets

      Example of using Map for efficient lookups:
      ```javascript
      const userMap = new Map();
      users.forEach(user => userMap.set(user.id, user));

      // Efficient lookup
      const user = userMap.get(userId);
      ```

   c) Implement code splitting and lazy loading:
      - Use dynamic imports to load modules on demand
      - Implement route-based code splitting in single-page applications
      - Use intersection observer API for lazy loading images and content
      - Prioritize critical CSS and defer non-critical styles

      Example of dynamic import:
      ```javascript
      button.addEventListener('click', async () => {
        const module = await import('./heavyModule.js');
        module.doSomething();
      });
      ```

   d) Optimize loops and reduce complexity:
      - Use array methods like map, filter, and reduce instead of for loops
      - Implement early returns to avoid unnecessary computations
      - Use object destructuring for faster property access
      - Avoid nested loops when possible, consider using hash tables

      Example of using array methods:
      ```javascript
      const numbers = [1, 2, 3, 4, 5];
      const squaredEvens = numbers
        .filter(num => num % 2 === 0)
        .map(num => num * num);
      ```

   e) Use Web Workers for CPU-intensive tasks:
      - Offload heavy computations to background threads
      - Implement parallel processing for data-intensive operations
      - Use SharedArrayBuffer for efficient data sharing between workers
      - Consider using libraries like Comlink for easier Web Worker usage

      Example of using a Web Worker:
      ```javascript
      // main.js
      const worker = new Worker('worker.js');
      worker.postMessage({ data: largeArray });
      worker.onmessage = (event) => {
        console.log('Processed result:', event.data);
      };

      // worker.js
      self.onmessage = (event) => {
        const result = heavyComputation(event.data.data);
        self.postMessage(result);
      };
      ```

   f) Implement caching strategies:
      - Use memoization for expensive function calls
      - Implement service workers for offline caching and faster loads
      - Use browser caching with appropriate cache headers
      - Implement in-memory caching for frequently accessed data

      Example of memoization:
      ```javascript
      const memoize = (fn) => {
        const cache = new Map();
        return (...args) => {
          const key = JSON.stringify(args);
          if (cache.has(key)) return cache.get(key);
          const result = fn(...args);
          cache.set(key, result);
          return result;
        };
      };

      const expensiveFunction = memoize((n) => {
        console.log('Computing...');
        return n * n;
      });

      console.log(expensiveFunction(4)); // Computing... 16
      console.log(expensiveFunction(4)); // 16 (cached)
      ```

   g) Minimize network requests:
      - Concatenate and minify JavaScript files
      - Use HTTP/2 for multiplexing requests
      - Implement proper lazy loading of assets
      - Use sprite sheets for small, frequently used images

      Example of using HTTP/2 server push (server-side configuration):
      ```nginx
      server {
        listen 443 ssl http2;
        server_name example.com;

        root /var/www/html;
        index index.html;

        location / {
          http2_push /styles.css;
          http2_push /script.js;
        }
      }
      ```

   h) Use asynchronous programming techniques:
      - Implement async/await for cleaner asynchronous code
      - Use Promises for better error handling and chaining
      - Implement debouncing and throttling for event handlers
      - Use requestIdleCallback for non-critical tasks

      Example of debouncing:
      ```javascript
      function debounce(func, delay) {
        let timeoutId;
        return function (...args) {
          clearTimeout(timeoutId);
          timeoutId = setTimeout(() => func.apply(this, args), delay);
        };
      }

      const debouncedSearch = debounce((query) => {
        console.log('Searching for:', query);
        // Perform search operation
      }, 300);

      searchInput.addEventListener('input', (e) => debouncedSearch(e.target.value));
      ```

These optimization techniques, when applied appropriately, can significantly improve the performance of JavaScript applications. It's important to profile and measure the impact of these optimizations in your specific use case to ensure they provide the expected benefits.

2. How do you use JavaScript profiling tools to identify performance bottlenecks?

   a) Use browser developer tools (e.g., Chrome DevTools):
      - Open DevTools (F12 or Cmd+Option+I on Mac)
      - Go to the Performance tab
      - Click the record button and interact with your page
      - Stop recording and analyze the results

   b) Analyze execution time and call stacks:
      - Look for long bars in the flame chart
      - Examine the "Bottom-Up" and "Call Tree" tabs
      - Identify functions that take the most time
      Example:
      ```javascript
      function slowFunction() {
        for (let i = 0; i < 1000000; i++) {
          // Some expensive operation
        }
      }
      ```

   c) Identify long-running functions and excessive memory usage:
      - Use the Memory tab in DevTools
      - Take heap snapshots before and after suspected memory leaks
      - Look for objects with unexpected retention counts

   d) Use timeline and flame charts for visual analysis:
      - In the Performance tab, look at the flame chart
      - Identify tall stacks that indicate long-running operations
      - Look for recurring patterns that might indicate inefficient loops

   e) Implement performance markers in code:
      ```javascript
      performance.mark('startProcess');
      // ... your code here ...
      performance.mark('endProcess');
      performance.measure('processTime', 'startProcess', 'endProcess');
      console.log(performance.getEntriesByName('processTime'));
      ```

   f) Use third-party profiling tools:
      - Lighthouse: Run it from Chrome DevTools or as a CLI tool
      - WebPageTest: Provides detailed performance analysis and suggestions

3. What are the best practices for optimizing JavaScript code for production?

   a) Minify and compress JavaScript files:
      - Use tools like UglifyJS or Terser
      - Implement gzip compression on your server

   b) Use tree shaking to eliminate dead code:
      - Use ES6 modules and a bundler like webpack or Rollup
      - Ensure your package.json has "sideEffects": false

   c) Implement code splitting and lazy loading:
      ```javascript
      // Instead of: import { heavyFunction } from './heavyModule';
      const heavyFunction = () => import('./heavyModule').then(module => module.heavyFunction);
      ```

   d) Use production builds of libraries and frameworks:
      - For React: `npm run build` creates an optimized production build
      - Ensure development-only code is stripped out

   e) Optimize asset loading:
      ```html
      <script src="non-critical.js" defer></script>
      <link rel="preload" href="critical.js" as="script">
      ```

   f) Implement caching strategies:
      - Use service workers for offline caching
      - Set appropriate Cache-Control headers

   g) Use Content Delivery Networks (CDNs):
      ```html
      <script src="https://cdn.example.com/library.min.js"></script>
      ```

   h) Optimize for mobile devices:
      - Use responsive design and mobile-first approach
      - Implement touch events for better mobile interaction

4. How do you use caching to improve JavaScript performance?

   a) Implement browser caching with appropriate cache headers:
      ```
      Cache-Control: max-age=31536000, immutable
      ```

   b) Use service workers for offline caching:
      ```javascript
      self.addEventListener('install', (event) => {
        event.waitUntil(
          caches.open('v1').then((cache) => {
            return cache.addAll([
              '/index.html',
              '/styles.css',
              '/script.js'
            ]);
          })
        );
      });
      ```

   c) Implement in-memory caching for frequently accessed data:
      ```javascript
      const cache = new Map();
      function getData(key) {
        if (cache.has(key)) return cache.get(key);
        const data = fetchDataFromServer(key);
        cache.set(key, data);
        return data;
      }
      ```

   d) Use IndexedDB or LocalStorage for client-side data persistence:
      ```javascript
      localStorage.setItem('user', JSON.stringify(userData));
      const user = JSON.parse(localStorage.getItem('user'));
      ```

   e) Implement API response caching:
      - Use the Cache API in conjunction with service workers
      - Implement conditional requests with ETag or Last-Modified headers

   f) Use memoization for expensive function calls:
      ```javascript
      const memoize = (fn) => {
        const cache = new Map();
        return (...args) => {
          const key = JSON.stringify(args);
          if (cache.has(key)) return cache.get(key);
          const result = fn(...args);
          cache.set(key, result);
          return result;
        };
      };
      ```

5. What are the different techniques for optimizing JavaScript memory usage?

   a) Avoid memory leaks by properly managing event listeners and closures:
      ```javascript
      const button = document.getElementById('myButton');
      const handleClick = () => {
        // Handle click
      };
      button.addEventListener('click', handleClick);
      // Later, when no longer needed:
      button.removeEventListener('click', handleClick);
      ```

   b) Use object pooling for frequently created/destroyed objects:
      ```javascript
      class ObjectPool {
        constructor(createFn, size = 10) {
          this.pool = Array(size).fill().map(() => createFn());
        }
        acquire() {
          return this.pool.pop() || createFn();
        }
        release(obj) {
          if (this.pool.length < this.size) {
            this.pool.push(obj);
          }
        }
      }
      ```

   c) Implement efficient data structures:
      ```javascript
      // Use TypedArray for large numerical datasets
      const largeArray = new Float64Array(1000000);
      ```

   d) Use weak references for caching:
      ```javascript
      const cache = new WeakMap();
      function processObject(obj) {
        if (cache.has(obj)) return cache.get(obj);
        const result = expensiveOperation(obj);
        cache.set(obj, result);
        return result;
      }
      ```

   e) Avoid excessive DOM manipulation:
      ```javascript
      // Instead of multiple appendChild calls:
      const fragment = document.createDocumentFragment();
      items.forEach(item => {
        const li = document.createElement('li');
        li.textContent = item;
        fragment.appendChild(li);
      });
      list.appendChild(fragment);
      ```

   f) Implement pagination or virtualization for large lists:
      - Use libraries like react-window for efficient rendering of large lists

   g) Use Web Workers for memory-intensive tasks:
      ```javascript
      const worker = new Worker('heavy-task.js');
      worker.postMessage({ data: largeDataSet });
      worker.onmessage = (event) => {
        console.log('Processed result:', event.data);
      };
      ```

JavaScript Architecture and Design Patterns

1. What are the different JavaScript architecture patterns and how are they used?
   - MVC (Model-View-Controller): Separates data, UI, and logic
   - MVVM (Model-View-ViewModel): Used in data-binding frameworks
   - Flux/Redux: Unidirectional data flow for state management
   - Module Pattern: Encapsulates functionality and provides public API
   - Pub/Sub (Publisher/Subscriber): Decouples components through events
   - Microservices: Divides application into small, independent services

   a) MVC (Model-View-Controller):
      - Separates data, UI, and logic
      - Model: Manages data and business logic
      - View: Renders UI
      - Controller: Handles user input and updates model/view
      Example:
      ```javascript
      // Model
      class UserModel {
        constructor(name, email) {
          this.name = name;
          this.email = email;
        }
      }

      // View
      class UserView {
        render(user) {
          console.log(`Name: ${user.name}, Email: ${user.email}`);
        }
      }

      // Controller
      class UserController {
        constructor(model, view) {
          this.model = model;
          this.view = view;
        }

        updateUser(name, email) {
          this.model.name = name;
          this.model.email = email;
          this.view.render(this.model);
        }
      }

      // Usage
      const user = new UserModel('John', 'john@example.com');
      const view = new UserView();
      const controller = new UserController(user, view);
      controller.updateUser('Jane', 'jane@example.com');
      ```

   b) MVVM (Model-View-ViewModel):
      - Used in data-binding frameworks like Vue.js
      - ViewModel acts as a converter that changes Model information into View information
      Example (using Vue.js):
      ```javascript
      // Model
      const userModel = {
        name: 'John',
        email: 'john@example.com'
      };

      // ViewModel
      const vm = new Vue({
        el: '#app',
        data: userModel,
        methods: {
          updateEmail(newEmail) {
            this.email = newEmail;
          }
        }
      });

      // View (in HTML)
      // <div id="app">
      //   <p>Name: {{ name }}</p>
      //   <p>Email: {{ email }}</p>
      //   <input v-model="email" @input="updateEmail">
      // </div>
      ```

   c) Flux/Redux:
      - Unidirectional data flow for state management
      - Actions -> Dispatcher -> Store -> View
      Example (using Redux):
      ```javascript
      // Action
      const updateUser = (name, email) => ({
        type: 'UPDATE_USER',
        payload: { name, email }
      });

      // Reducer
      const userReducer = (state = {}, action) => {
        switch (action.type) {
          case 'UPDATE_USER':
            return { ...state, ...action.payload };
          default:
            return state;
        }
      };

      // Store
      const store = Redux.createStore(userReducer);

      // View (React component)
      function UserComponent() {
        const user = useSelector(state => state);
        const dispatch = useDispatch();

        return (
          <div>
            <p>Name: {user.name}</p>
            <p>Email: {user.email}</p>
            <button onClick={() => dispatch(updateUser('Jane', 'jane@example.com'))}>
              Update User
            </button>
          </div>
        );
      }
      ```

   d) Module Pattern:
      - Encapsulates functionality and provides public API
      Example:
      ```javascript
      const UserModule = (function() {
        let name = '';
        let email = '';

        function setName(newName) {
          name = newName;
        }

        function setEmail(newEmail) {
          email = newEmail;
        }

        function getUser() {
          return { name, email };
        }

        return {
          setName,
          setEmail,
          getUser
        };
      })();

      UserModule.setName('John');
      UserModule.setEmail('john@example.com');
      console.log(UserModule.getUser());
      ```

   e) Pub/Sub (Publisher/Subscriber):
      - Decouples components through events
      Example:
      ```javascript
      class EventBus {
        constructor() {
          this.subscribers = {};
        }

        subscribe(event, callback) {
          if (!this.subscribers[event]) {
            this.subscribers[event] = [];
          }
          this.subscribers[event].push(callback);
        }

        publish(event, data) {
          if (!this.subscribers[event]) return;
          this.subscribers[event].forEach(callback => callback(data));
        }
      }

      const bus = new EventBus();

      // Subscriber
      bus.subscribe('userUpdated', user => {
        console.log('User updated:', user);
      });

      // Publisher
      bus.publish('userUpdated', { name: 'John', email: 'john@example.com' });
      ```

   f) Microservices:
      - Divides application into small, independent services
      - Often implemented using separate servers/containers
      Example (conceptual):
      ```javascript
      // User Service
      app.get('/api/users/:id', (req, res) => {
        // Fetch user data
      });

      // Order Service
      app.get('/api/orders/:userId', (req, res) => {
        // Fetch user's orders
      });

      // Payment Service
      app.post('/api/payments', (req, res) => {
        // Process payment
      });
      ```


2. How do you implement the Model-View-Controller (MVC) pattern in JavaScript?
   - Model: Manages data and business logic
   - View: Renders UI and handles user input
   - Controller: Mediates between Model and View
   - Implement event system for communication
   - Use data binding or templating for View updates
   - Separate concerns and maintain loose coupling

   Example implementation:

   ```javascript
   // Model
   class TodoModel {
     constructor() {
       this.todos = [];
     }

     addTodo(text) {
       this.todos.push({ id: Date.now(), text, completed: false });
     }

     toggleTodo(id) {
       const todo = this.todos.find(todo => todo.id === id);
       if (todo) {
         todo.completed = !todo.completed;
       }
     }

     getTodos() {
       return this.todos;
     }
   }

   // View
   class TodoView {
     constructor() {
       this.app = this.getElement('#root');
       this.form = this.createElement('form');
       this.input = this.createElement('input');
       this.input.type = 'text';
       this.input.placeholder = 'Add todo';
       this.submitButton = this.createElement('button');
       this.submitButton.textContent = 'Submit';
       this.todoList = this.createElement('ul', 'todo-list');
       this.form.append(this.input, this.submitButton);
       this.app.append(this.form, this.todoList);
     }

     createElement(tag, className) {
       const element = document.createElement(tag);
       if (className) element.classList.add(className);
       return element;
     }

     getElement(selector) {
       return document.querySelector(selector);
     }

     displayTodos(todos) {
       while (this.todoList.firstChild) {
         this.todoList.removeChild(this.todoList.firstChild);
       }

       if (todos.length === 0) {
         const p = this.createElement('p');
         p.textContent = 'Nothing to do! Add a task?';
         this.todoList.append(p);
       } else {
         todos.forEach(todo => {
           const li = this.createElement('li');
           li.id = todo.id;

           const checkbox = this.createElement('input');
           checkbox.type = 'checkbox';
           checkbox.checked = todo.completed;

           const span = this.createElement('span');
           span.contentEditable = true;
           span.classList.add('editable');

           if (todo.completed) {
             const strike = this.createElement('s');
             strike.textContent = todo.text;
             span.append(strike);
           } else {
             span.textContent = todo.text;
           }

           const deleteButton = this.createElement('button', 'delete');
           deleteButton.textContent = 'Delete';
           li.append(checkbox, span, deleteButton);

           this.todoList.append(li);
         });
       }
     }

     bindAddTodo(handler) {
       this.form.addEventListener('submit', event => {
         event.preventDefault();
         if (this.input.value) {
           handler(this.input.value);
           this.input.value = '';
         }
       });
     }

     bindDeleteTodo(handler) {
       this.todoList.addEventListener('click', event => {
         if (event.target.className === 'delete') {
           const id = parseInt(event.target.parentElement.id);
           handler(id);
         }
       });
     }

     bindToggleTodo(handler) {
       this.todoList.addEventListener('change', event => {
         if (event.target.type === 'checkbox') {
           const id = parseInt(event.target.parentElement.id);
           handler(id);
         }
       });
     }
   }

   // Controller
   class TodoController {
     constructor(model, view) {
       this.model = model;
       this.view = view;

       this.view.bindAddTodo(this.handleAddTodo.bind(this));
       this.view.bindDeleteTodo(this.handleDeleteTodo.bind(this));
       this.view.bindToggleTodo(this.handleToggleTodo.bind(this));

       this.onTodoListChanged(this.model.getTodos());
     }

     onTodoListChanged = todos => {
       this.view.displayTodos(todos);
     }

     handleAddTodo = todoText => {
       this.model.addTodo(todoText);
       this.onTodoListChanged(this.model.getTodos());
     }

     handleDeleteTodo = id => {
       this.model.deleteTodo(id);
       this.onTodoListChanged(this.model.getTodos());
     }

     handleToggleTodo = id => {
       this.model.toggleTodo(id);
       this.onTodoListChanged(this.model.getTodos());
     }
   }

   // Usage
   const app = new TodoController(new TodoModel(), new TodoView());
   ```
   This implementation demonstrates:
   - Separation of concerns
   - Event system for communication (using method binding)
   - Data binding for View updates
   - Loose coupling between Model, View, and Controller

3. What are the different design patterns used in JavaScript and how are they implemented?
   - Singleton: Ensures a class has only one instance
   - Factory: Creates objects without specifying exact class
   - Observer: Defines one-to-many dependency between objects
   - Decorator: Adds new functionality to objects dynamically
   - Strategy: Defines family of algorithms, encapsulates each one
   - Proxy: Provides a surrogate for another object to control access

   a) Singleton: Ensures a class has only one instance
      - Used when exactly one object is needed to coordinate actions across the system
      - Implemented using a private constructor and a static method that returns the instance
      Example:
      ```javascript
      class Singleton {
        constructor() {
          if (Singleton.instance) {
            return Singleton.instance;
          }
          this.data = [];
          Singleton.instance = this;
        }

        addItem(item) {
          this.data.push(item);
        }
      }

      const instance1 = new Singleton();
      const instance2 = new Singleton();
      console.log(instance1 === instance2); // true
      ```

   b) Factory: Creates objects without specifying exact class
      - Provides an interface for creating objects in a superclass, allowing subclasses to decide which class to instantiate
      - Useful when dealing with complex object creation logic
      Example:
      ```javascript
      class Car {
        constructor(make, model) {
          this.make = make;
          this.model = model;
        }
      }

      class CarFactory {
        createCar(type) {
          switch(type) {
            case 'sedan':
              return new Car('Toyota', 'Camry');
            case 'suv':
              return new Car('Honda', 'CR-V');
            default:
              throw new Error('Invalid car type');
          }
        }
      }

      const factory = new CarFactory();
      const sedan = factory.createCar('sedan');
      console.log(sedan); // Car { make: 'Toyota', model: 'Camry' }
      ```

   c) Observer: Defines one-to-many dependency between objects
      - Allows multiple observer objects to watch a subject
      - When the subject changes state, all observers are notified and updated automatically
      Example:
      ```javascript
      class Subject {
        constructor() {
          this.observers = [];
        }

        addObserver(observer) {
          this.observers.push(observer);
        }

        notifyObservers(data) {
          this.observers.forEach(observer => observer.update(data));
        }
      }

      class Observer {
        update(data) {
          console.log('Received update:', data);
        }
      }

      const subject = new Subject();
      const observer1 = new Observer();
      const observer2 = new Observer();

      subject.addObserver(observer1);
      subject.addObserver(observer2);
      subject.notifyObservers('Hello observers!');
      ```

   d) Decorator: Adds new functionality to objects dynamically
      - Allows behavior to be added to individual objects without affecting the behavior of other objects from the same class
      - Implemented using a wrapper that contains the same interface as the wrapped object
      Example:
      ```javascript
      class Coffee {
        cost() {
          return 5;
        }
      }

      class MilkDecorator {
        constructor(coffee) {
          this.coffee = coffee;
        }

        cost() {
          return this.coffee.cost() + 2;
        }
      }

      class SugarDecorator {
        constructor(coffee) {
          this.coffee = coffee;
        }

        cost() {
          return this.coffee.cost() + 1;
        }
      }

      let myCoffee = new Coffee();
      myCoffee = new MilkDecorator(myCoffee);
      myCoffee = new SugarDecorator(myCoffee);
      console.log(myCoffee.cost()); // 8
      ```

   e) Strategy: Defines family of algorithms, encapsulates each one
      - Allows selecting an algorithm at runtime
      - Useful when you have multiple ways to perform a task and want to switch between them dynamically
      Example:
      ```javascript
      class ShippingStrategy {
        calculate(amount) {
          throw new Error('calculate() must be implemented');
        }
      }

      class FreeShipping extends ShippingStrategy {
        calculate(amount) {
          return 0;
        }
      }

      class StandardShipping extends ShippingStrategy {
        calculate(amount) {
          return amount * 0.1;
        }
      }

      class ShippingCalculator {
        constructor(strategy) {
          this.strategy = strategy;
        }

        setStrategy(strategy) {
          this.strategy = strategy;
        }

        calculate(amount) {
          return this.strategy.calculate(amount);
        }
      }

      const calculator = new ShippingCalculator(new StandardShipping());
      console.log(calculator.calculate(100)); // 10

      calculator.setStrategy(new FreeShipping());
      console.log(calculator.calculate(100)); // 0
      ```

   f) Proxy: Provides a surrogate for another object to control access
      - Acts as a placeholder for another object to control access to it
      - Can be used for lazy loading, access control, logging, etc.
      Example:
      ```javascript
      class RealImage {
        constructor(filename) {
          this.filename = filename;
          this.loadImage();
        }

        loadImage() {
          console.log(`Loading image: ${this.filename}`);
        }

        display() {
          console.log(`Displaying image: ${this.filename}`);
        }
      }

      class ImageProxy {
        constructor(filename) {
          this.filename = filename;
          this.image = null;
        }

        display() {
          if (!this.image) {
            this.image = new RealImage(this.filename);
          }
          this.image.display();
        }
      }

      const image = new ImageProxy('photo.jpg');
      // Image is not loaded until display() is called
      image.display();
      // Subsequent calls use the cached RealImage object
      image.display();
      ```

   These design patterns provide solutions to common software design problems and can significantly improve the structure and maintainability of JavaScript code when used appropriately.

4. How do you use dependency injection in JavaScript?
   - Pass dependencies as parameters to functions or constructors
   - Use IoC (Inversion of Control) containers
   - Implement service locator pattern
   - Use module systems (e.g., AMD, CommonJS) for dependency management
   - Utilize dependency injection frameworks (e.g., InversifyJS)

5. What are the best practices for designing scalable JavaScript applications?
   - Use modular architecture and loose coupling
   - Implement proper error handling and logging
   - Design for testability and maintainability
   - Use asynchronous programming techniques
   - Implement efficient state management
   - Optimize for performance and load times
   - Use progressive enhancement and graceful degradation
   - Implement proper security measures

JavaScript Concurrency and Parallel Processing

1. What are the different ways to achieve concurrency in JavaScript?
   - Asynchronous programming with callbacks, promises, and async/await
   - Web Workers for parallel processing
   - Service Workers for background processing
   - Event-driven programming
   - Micro-task queue and macro-task queue
   - Generators and coroutines

2. How do you use Web Workers to achieve parallel processing in JavaScript?
   - Create a separate JavaScript file for the worker
   - Instantiate a Worker object with the file URL
   - Use postMessage() to send data to the worker
   - Listen for messages from the worker using onmessage event
   - Terminate workers when no longer needed
   - Use SharedArrayBuffer for shared memory between workers

3. What are the best practices for implementing concurrent programming in JavaScript?
   - Use asynchronous programming techniques
   - Avoid blocking the main thread with long-running tasks
   - Implement proper error handling for asynchronous operations
   - Use Web Workers for CPU-intensive tasks
   - Implement proper state management in concurrent scenarios
   - Use appropriate data structures for concurrent access
   - Implement proper synchronization mechanisms when needed

4. How do you use async/await to write concurrent code in JavaScript?
   - Mark functions as async to use await inside them
   - Use await to pause execution until a promise is resolved
   - Handle errors using try/catch blocks
   - Use Promise.all() for concurrent execution of multiple promises
   - Implement proper error propagation in async functions
   - Use async IIFE (Immediately Invoked Function Expression) when needed

5. What are the different libraries and frameworks used for concurrent programming in JavaScript?
   - RxJS: Reactive programming library for handling asynchronous data streams
   - Async.js: Utility module for working with asynchronous JavaScript
   - Bluebird: Promise library with additional features
   - Web Workers API: Built-in browser API for parallel processing
   - Parallel.js: Library for parallel computing in JavaScript
   - WorkerDOM: Library for using Web Workers with the DOM

JavaScript Memory Management

1. How does JavaScript manage memory?
   - Automatic memory allocation when objects are created
   - Garbage collection for freeing unused memory
   - Reference counting and mark-and-sweep algorithms
   - Memory heap for storing objects and variables
   - Call stack for managing function executions

2. What are the different ways to optimize JavaScript memory usage?
   - Avoid memory leaks by properly managing references
   - Use appropriate data structures for the task
   - Implement object pooling for frequently created/destroyed objects
   - Use weak references for caching
   - Avoid excessive closures and circular references
   - Implement proper event listener cleanup

3. How do you use JavaScript garbage collection to manage memory?
   - Garbage collection is automatic in JavaScript
   - Mark unreachable objects for deletion
   - Implement generational collection for efficiency
   - Use weak references to allow garbage collection of cached objects
   - Avoid manual memory management unless absolutely necessary
   - Be aware of garbage collection pauses and optimize accordingly

4. What are the best practices for managing memory in JavaScript?
   - Avoid global variables and clean up unused variables
   - Use let and const instead of var for better scoping
   - Implement proper closure management
   - Use object destructuring to avoid unnecessary object creation
   - Implement proper event listener cleanup
   - Use appropriate data structures for the task
   - Implement pagination or virtualization for large datasets

5. How do you use JavaScript memory profiling tools to identify memory leaks?
   - Use browser developer tools (e.g., Chrome DevTools Memory panel)
   - Take heap snapshots and compare them over time
   - Analyze retained size and dominator trees
   - Use allocation timelines to track object creation
   - Implement performance markers in code for specific scenarios
   - Use third-party memory profiling tools like Node.js --inspect

JavaScript Security

1. What are the different types of JavaScript security threats?
   - Cross-Site Scripting (XSS)
   - Cross-Site Request Forgery (CSRF)
   - SQL Injection
   - Clickjacking
   - Man-in-the-Middle (MITM) attacks
   - Denial of Service (DoS) attacks
   - Prototype pollution
   - Insecure dependencies

2. How do you prevent cross-site scripting (XSS) attacks in JavaScript?
   - Sanitize and validate user input
   - Use Content Security Policy (CSP) headers
   - Implement proper output encoding
   - Use HttpOnly flag for sensitive cookies
   - Implement input validation on both client and server sides
   - Use libraries like DOMPurify for HTML sanitization
   - Avoid using eval() and innerHTML with untrusted data

3. What are the best practices for securing JavaScript code?
   - Use HTTPS for all communications
   - Implement proper authentication and authorization
   - Use secure session management
   - Implement proper error handling without exposing sensitive information
   - Keep dependencies up-to-date and use tools like npm audit
   - Use strict mode to catch potential security issues
   - Implement proper CORS (Cross-Origin Resource Sharing) policies

4. How do you use Content Security Policy (CSP) to secure JavaScript?
   - Set appropriate CSP headers in server responses
   - Define allowed sources for scripts, styles, and other resources
   - Use nonce or hash for inline scripts
   - Implement report-uri directive for violation reporting
   - Use strict-dynamic for dynamic script loading
   - Gradually implement CSP using report-only mode
   - Regularly review and update CSP policies

5. What are the different libraries and frameworks used for securing JavaScript?
   - Helmet.js: Helps secure Express apps with various HTTP headers
   - DOMPurify: HTML sanitization library
   - OWASP ESAPI: Enterprise Security API for various security functions
   - Crypto-js: JavaScript library of crypto standards
   - Bcrypt.js: Library for hashing passwords
   - JSON Web Token (JWT): For secure authentication
   - SSL/TLS libraries for secure communication

JavaScript Testing and Debugging

1. What are the different types of JavaScript testing frameworks?
   - Unit testing: Jest, Mocha, Jasmine
   - Integration testing: Cypress, Selenium WebDriver
   - End-to-end testing: Puppeteer, TestCafe
   - Behavior-driven development (BDD): Cucumber.js
   - Performance testing: Lighthouse, WebPageTest
   - Visual regression testing: Percy, BackstopJS

2. How do you write unit tests for JavaScript code?
   - Use a testing framework like Jest or Mocha
   - Write test cases to cover different scenarios
   - Use assertions to verify expected outcomes
   - Implement test doubles (mocks, stubs, spies) for dependencies
   - Organize tests into suites for better structure
   - Use code coverage tools to ensure comprehensive testing
   - Implement continuous integration for automated testing

3. What are the best practices for testing JavaScript code?
   - Write testable code with proper separation of concerns
   - Follow the AAA (Arrange-Act-Assert) pattern
   - Use descriptive test names and proper organization
   - Implement both positive and negative test cases
   - Use test-driven development (TDD) when appropriate
   - Implement integration and end-to-end tests in addition to unit tests
   - Regularly run and maintain tests

4. How do you use debugging tools to debug JavaScript code?
   - Use browser developer tools (e.g., Chrome DevTools)
   - Set breakpoints and step through code execution
   - Use console.log() and debugger statements
   - Analyze call stack and scope variables
   - Use conditional breakpoints and watch expressions
   - Implement source maps for debugging minified code
   - Use browser extensions for additional debugging features

5. What are the different libraries and frameworks used for testing and debugging JavaScript?
   - Testing: Jest, Mocha, Jasmine, Cypress, Selenium
   - Assertion libraries: Chai, Expect.js
   - Mocking: Sinon.js, testdouble.js
   - Code coverage: Istanbul, nyc
   - Visual regression: Percy, BackstopJS
   - Debugging: Chrome DevTools, Firefox Developer Tools
   - Performance profiling: Lighthouse, WebPageTest