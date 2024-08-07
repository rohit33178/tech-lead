Here are some important questions related to different levels of JavaScript that can be used to evaluate a 10-year candidate for tech lead roles:

Beginner Level

1. What is JavaScript and what are its main features?
   Answer: JavaScript is a high-level, interpreted programming language primarily used for client-side web development. Its main features include:
   - Dynamic typing
   - First-class functions
   - Object-oriented programming
   - Prototype-based inheritance
   - Event-driven programming
   - Asynchronous programming support

   Coding question: Write a simple JavaScript function that demonstrates the use of a callback.

   Example:
   ```javascript
   function greet(name, callback) {
     console.log(`Hello, ${name}!`);
     callback();
   }

   function sayGoodbye() {
     console.log("Goodbye!");
   }

   greet("Alice", sayGoodbye);
   ```

2. How do you declare variables in JavaScript?
   Answer: In JavaScript, variables can be declared using three keywords: var, let, and const.
   - var: function-scoped or globally-scoped, can be redeclared and updated
   - let: block-scoped, can be updated but not redeclared
   - const: block-scoped, cannot be updated or redeclared

   Coding question: Declare variables using all three methods and demonstrate their scope differences.

   Example:
   ```javascript
   var globalVar = "I'm global";
   let blockLet = "I'm block-scoped";
   const constantVar = "I can't be reassigned";

   function scopeDemo() {
     var functionVar = "I'm function-scoped";
     if (true) {
       let blockLet = "I'm a different block-scoped variable";
       const constantVar = "I'm a different constant";
       console.log(blockLet, constantVar);
     }
     console.log(functionVar, blockLet, constantVar);
   }

   scopeDemo();
   console.log(globalVar, blockLet, constantVar);
   ```

3. What are data types in JavaScript and how are they used?
   Answer: JavaScript has six primitive data types and one complex data type:
   Primitive: String, Number, Boolean, Undefined, Null, Symbol
   Complex: Object (including Arrays and Functions)

   Coding question: Create variables of each data type and use the typeof operator to verify their types.

   Example:
   ```javascript
   let stringVar = "Hello";
   let numberVar = 42;
   let booleanVar = true;
   let undefinedVar;
   let nullVar = null;
   let symbolVar = Symbol("unique");
   let objectVar = { key: "value" };
   let arrayVar = [1, 2, 3];
   let functionVar = function() {};

   console.log(typeof stringVar, typeof numberVar, typeof booleanVar);
   console.log(typeof undefinedVar, typeof nullVar, typeof symbolVar);
   console.log(typeof objectVar, typeof arrayVar, typeof functionVar);
   ```

4. How do you write conditional statements in JavaScript?
   Answer: Conditional statements in JavaScript can be written using if...else statements, switch statements, and the ternary operator.

   Coding question: Write a function that takes a number and returns a string describing whether it's positive, negative, or zero using if...else statements.

   Example:
   ```javascript
   function describeNumber(num) {
     if (num > 0) {
       return "Positive";
     } else if (num < 0) {
       return "Negative";
     } else {
       return "Zero";
     }
   }

   console.log(describeNumber(5));
   console.log(describeNumber(-3));
   console.log(describeNumber(0));
   ```

5. What are functions in JavaScript and how are they used?
   Answer: Functions in JavaScript are reusable blocks of code that perform a specific task. They can take parameters and return values.

   Coding question: Write a function that calculates the factorial of a given number.

   Example:
   ```javascript
   function factorial(n) {
     if (n === 0 || n === 1) {
       return 1;
     } else {
       return n * factorial(n - 1);
     }
   }

   console.log(factorial(5)); // Output: 120
   console.log(factorial(0)); // Output: 1
   ```
6. How do you handle events in JavaScript?
   Answer: Events in JavaScript are handled using event listeners. You can attach event listeners to HTML elements to respond to user actions or other occurrences.

   Coding question: Create a button that changes its text when clicked.

   Example:
   ```javascript
   const button = document.getElementById('myButton');
   button.addEventListener('click', function() {
     this.textContent = 'Clicked!';
   });
   ```

7. What is the Document Object Model (DOM) and how is it used in JavaScript?
   Answer: The DOM is a programming interface for HTML and XML documents. It represents the structure of a document as a tree-like hierarchy, allowing JavaScript to dynamically access and manipulate the content, structure, and style of web pages.

   Coding question: Write a function that changes the background color of all paragraphs on a page.

   Example:
   ```javascript
   function changeParaBackground(color) {
     const paragraphs = document.getElementsByTagName('p');
     for (let i = 0; i < paragraphs.length; i++) {
       paragraphs[i].style.backgroundColor = color;
     }
   }

   changeParaBackground('yellow');
   ```

8. How do you manipulate HTML elements using JavaScript?
   Answer: HTML elements can be manipulated using various DOM methods and properties, such as getElementById(), createElement(), appendChild(), removeChild(), innerHTML, and textContent.

   Coding question: Create a function that adds a new list item to an existing unordered list.

   Example:
   ```javascript
   function addListItem(text) {
     const ul = document.getElementById('myList');
     const li = document.createElement('li');
     li.textContent = text;
     ul.appendChild(li);
   }

   addListItem('New item');
   ```

9. What are JavaScript arrays and how are they used?
   Answer: Arrays in JavaScript are ordered lists of values. They can contain mixed data types and are used to store multiple values in a single variable.

   Coding question: Write a function that finds the largest number in an array of numbers.

   Example:
   ```javascript
   function findLargestNumber(arr) {
     return Math.max(...arr);
   }

   const numbers = [10, 5, 8, 3, 15, 7];
   console.log(findLargestNumber(numbers)); // Output: 15
   ```

10. How do you use JavaScript to validate form data?
    Answer: Form data can be validated using JavaScript by checking input values against certain criteria before submitting the form.

    Coding question: Create a function that validates an email address using a regular expression.

    Example:
    ```javascript
    function validateEmail(email) {
      const regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
      return regex.test(email);
    }

    console.log(validateEmail('user@example.com')); // Output: true
    console.log(validateEmail('invalid-email')); // Output: false
    ```

11. What is the difference between == and === in JavaScript?
    Answer: == performs type coercion before comparison, while === compares both value and type without coercion.

    Coding question: Write a function that demonstrates the difference between == and ===.

    Example:
    ```javascript
    function compareOperators(a, b) {
      console.log(`${a} == ${b}: ${a == b}`);
      console.log(`${a} === ${b}: ${a === b}`);
    }

    compareOperators(5, '5');
    // Output:
    // 5 == 5: true
    // 5 === 5: false
    ```

12. How do you use template literals in JavaScript?
    Answer: Template literals are string literals that allow embedded expressions and multi-line strings, enclosed by backticks (`).

    Coding question: Create a function that generates a personalized greeting using template literals.

    Example:
    ```javascript
    function greet(name, age) {
      return `Hello, ${name}! You are ${age} years old.`;
    }

    console.log(greet('Alice', 30));
    // Output: Hello, Alice! You are 30 years old.
    ```

13. What is the purpose of the 'use strict' directive in JavaScript?
    Answer: 'use strict' enables strict mode, which catches common coding errors and prevents the use of certain error-prone features.

    Coding question: Write a function that demonstrates the difference between strict and non-strict mode.

    Example:
    ```javascript
    function strictModeDemo() {
      'use strict';
      let x = 3.14;
      // Uncommenting the next line would cause an error in strict mode
      // y = 10;
    }

    strictModeDemo();
    ```

14. How do you use the spread operator in JavaScript?
    Answer: The spread operator (...) allows an iterable to be expanded in places where zero or more arguments or elements are expected.

    Coding question: Write a function that uses the spread operator to merge two arrays.

    Example:
    ```javascript
    function mergeArrays(arr1, arr2) {
      return [...arr1, ...arr2];
    }

    const array1 = [1, 2, 3];
    const array2 = [4, 5, 6];
    console.log(mergeArrays(array1, array2));
    // Output: [1, 2, 3, 4, 5, 6]
    ```

15. What is the purpose of the map() function in JavaScript?
    Answer: The map() function creates a new array with the results of calling a provided function on every element in the array.

    Coding question: Write a function that uses map() to double each number in an array.

    Example:
    ```javascript
    function doubleNumbers(arr) {
      return arr.map(num => num * 2);
    }

    const numbers = [1, 2, 3, 4, 5];
    console.log(doubleNumbers(numbers));
    // Output: [2, 4, 6, 8, 10]
    ```

16. How do you use the ternary operator in JavaScript?
    Answer: The ternary operator is a shorthand way of writing an if-else statement in a single line.

    Coding question: Write a function that uses the ternary operator to return "even" or "odd" based on a number.

    Example:
    ```javascript
    function evenOrOdd(num) {
      return num % 2 === 0 ? "even" : "odd";
    }

    console.log(evenOrOdd(4)); // Output: even
    console.log(evenOrOdd(7)); // Output: odd
    ```

17. What is the purpose of the setTimeout() function in JavaScript?
    Answer: setTimeout() is used to execute a function or a piece of code once after a specified delay.

    Coding question: Write a function that uses setTimeout() to print a message after a 2-second delay.

    Example:
    ```javascript
    function delayedMessage(message) {
      setTimeout(() => {
        console.log(message);
      }, 2000);
    }

    delayedMessage("This message is delayed by 2 seconds");
    ```

18. How do you use the forEach() method in JavaScript?
    Answer: forEach() executes a provided function once for each array element.

    Coding question: Write a function that uses forEach() to print each element of an array.

    Example:
    ```javascript
    function printArray(arr) {
      arr.forEach(item => console.log(item));
    }

    const fruits = ['apple', 'banana', 'orange'];
    printArray(fruits);
    // Output:
    // apple
    // banana
    // orange
    ```

19. What is the purpose of the JSON.stringify() and JSON.parse() methods?
    Answer: JSON.stringify() converts a JavaScript object to a JSON string, while JSON.parse() parses a JSON string to create a JavaScript object.

    Coding question: Write a function that demonstrates the use of JSON.stringify() and JSON.parse().

    Example:
    ```javascript
    function jsonDemo(obj) {
      const jsonString = JSON.stringify(obj);
      console.log("JSON string:", jsonString);

      const parsedObj = JSON.parse(jsonString);
      console.log("Parsed object:", parsedObj);
    }

    const person = { name: "John", age: 30 };
    jsonDemo(person);
    ```

20. How do you use the filter() method in JavaScript?
    Answer: The filter() method creates a new array with all elements that pass the test implemented by the provided function.

    Coding question: Write a function that uses filter() to return an array of even numbers.

    Example:
    ```javascript
    function getEvenNumbers(arr) {
      return arr.filter(num => num % 2 === 0);
    }

    const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    console.log(getEvenNumbers(numbers));
    // Output: [2, 4, 6, 8, 10]
    ```

21. What is the purpose of the Object.keys() method in JavaScript?
    Answer: Object.keys() returns an array of a given object's own enumerable property names.

    Coding question: Write a function that uses Object.keys() to print all keys of an object.

    Example:
    ```javascript
    function printObjectKeys(obj) {
      const keys = Object.keys(obj);
      keys.forEach(key => console.log(key));
    }

    const car = { make: "Toyota", model: "Camry", year: 2022 };
    printObjectKeys(car);
    // Output:
    // make
    // model
    // year
    ```

22. How do you use the reduce() method in JavaScript?
    Answer: The reduce() method executes a reducer function on each element of the array, resulting in a single output value.

    Coding question: Write a function that uses reduce() to calculate the sum of an array of numbers.

    Example:
    ```javascript
    function sumArray(arr) {
      return arr.reduce((sum, current) => sum + current, 0);
    }

    const numbers = [1, 2, 3, 4, 5];
    console.log(sumArray(numbers)); // Output: 15
    ```

23. What is the purpose of the try...catch statement in JavaScript?
    Answer: The try...catch statement is used to handle exceptions (runtime errors) in JavaScript.

    Coding question: Write a function that uses try...catch to handle a potential error when accessing an object property.

    Example:
    ```javascript
    function getPropertySafely(obj, prop) {
      try {
        return obj[prop];
      } catch (error) {
        console.error("An error occurred:", error.message);
        return undefined;
      }
    }

    const person = { name: "Alice" };
    console.log(getPropertySafely(person, "age")); // Output: undefined
    ```

24. How do you use the includes() method in JavaScript?
    Answer: The includes() method determines whether an array includes a certain value among its entries, returning true or false.

    Coding question: Write a function that uses includes() to check if a specific element exists in an array.

    Example:
    ```javascript
    function checkElement(arr, element) {
      return arr.includes(element);
    }

    const fruits = ['apple', 'banana', 'orange'];
    console.log(checkElement(fruits, 'banana')); // Output: true
    console.log(checkElement(fruits, 'grape')); // Output: false
    ```

25. What is the purpose of the Math object in JavaScript?
    Answer: The Math object provides mathematical constants and functions for performing mathematical operations.

    Coding question: Write a function that uses Math methods to generate a random integer between two given numbers (inclusive).

    Example:
    ```javascript
    function getRandomInt(min, max) {
      return Math.floor(Math.random() * (max - min + 1)) + min;
    }

    console.log(getRandomInt(1, 10)); // Output: Random integer between 1 and 10
    ```

These questions cover various basic concepts of JavaScript and include coding questions to evaluate a candidate's understanding and practical skills.



Intermediate Level

1. What is the difference between == and === in JavaScript?
   Answer: == performs type coercion before comparison, while === compares both value and type without coercion.

   Coding question: Write a function that demonstrates the difference between == and ===.

   Example:
   ```javascript
   function compareOperators(a, b) {
     console.log(`${a} == ${b}: ${a == b}`);
     console.log(`${a} === ${b}: ${a === b}`);
   }

   compareOperators(5, '5');
   compareOperators(0, false);
   ```

2. Explain the concept of hoisting in JavaScript.
   Answer: Hoisting is JavaScript's default behavior of moving declarations to the top of their respective scopes during compilation.

   Coding question: Write a function that demonstrates hoisting with variables and functions.

   Example:
   ```javascript
   function demonstrateHoisting() {
     console.log(x); // undefined
     var x = 5;

     foo(); // "Hello from foo!"
     function foo() {
       console.log("Hello from foo!");
     }
   }

   demonstrateHoisting();
   ```

3. What is the purpose of the 'use strict' directive?
   Answer: 'use strict' enables strict mode in JavaScript, which catches common coding errors and prevents the use of certain error-prone features.

   Coding question: Write a function that demonstrates the difference between strict and non-strict mode.

   Example:
   ```javascript
   function strictModeDemo(useStrict) {
     if (useStrict) {
       'use strict';
     }
     
     try {
       undeclaredVar = 10;
       console.log("No error in " + (useStrict ? "strict" : "non-strict") + " mode");
     } catch (error) {
       console.log("Error in strict mode:", error.message);
     }
   }

   strictModeDemo(false);
   strictModeDemo(true);
   ```

4. How does the 'this' keyword work in JavaScript?
   Answer: The value of 'this' depends on how a function is called. It can refer to the global object, the object that called the method, or a specific object if bound explicitly.

   Coding question: Write a function that demonstrates different behaviors of 'this' in various contexts.

   Example:
   ```javascript
   const obj = {
     name: "Object",
     regularFunction: function() {
       console.log("Regular function:", this.name);
     },
     arrowFunction: () => {
       console.log("Arrow function:", this.name);
     }
   };

   function demonstrateThis() {
     console.log("Global scope:", this.name);
     obj.regularFunction();
     obj.arrowFunction();
     const boundFunction = obj.regularFunction.bind({name: "Bound object"});
     boundFunction();
   }

   demonstrateThis();
   ```

5. Explain the concept of closures in JavaScript.
   Answer: A closure is a function that has access to variables in its outer (enclosing) lexical scope, even after the outer function has returned.

   Coding question: Write a function that creates a closure to maintain a private counter.

   Example:
   ```javascript
   function createCounter() {
     let count = 0;
     return {
       increment: function() {
         count++;
       },
       decrement: function() {
         count--;
       },
       getCount: function() {
         return count;
       }
     };
   }

   const counter = createCounter();
   counter.increment();
   counter.increment();
   console.log(counter.getCount()); // 2
   counter.decrement();
   console.log(counter.getCount()); // 1
   ```

6. What is the event loop in JavaScript?
   Answer: The event loop is a mechanism that allows JavaScript to perform non-blocking operations despite being single-threaded. It continuously checks the call stack and the callback queue, pushing callbacks to the stack when it's empty.

   Coding question: Write a function that demonstrates the asynchronous nature of JavaScript using setTimeout and Promise.

   Example:
   ```javascript
   function demonstrateEventLoop() {
     console.log("Start");

     setTimeout(() => {
       console.log("Timeout 1");
     }, 0);

     Promise.resolve().then(() => {
       console.log("Promise 1");
     });

     setTimeout(() => {
       console.log("Timeout 2");
     }, 0);

     Promise.resolve().then(() => {
       console.log("Promise 2");
     });

     console.log("End");
   }

   demonstrateEventLoop();
   ```

7. How does prototypal inheritance work in JavaScript?
   Answer: In JavaScript, objects can inherit properties and methods from other objects through their prototype chain.

   Coding question: Implement a simple inheritance hierarchy using prototypes.

   Example:
   ```javascript
   function Animal(name) {
     this.name = name;
   }

   Animal.prototype.speak = function() {
     console.log(`${this.name} makes a sound.`);
   };

   function Dog(name) {
     Animal.call(this, name);
   }

   Dog.prototype = Object.create(Animal.prototype);
   Dog.prototype.constructor = Dog;

   Dog.prototype.bark = function() {
     console.log(`${this.name} barks.`);
   };

   const dog = new Dog("Buddy");
   dog.speak(); // Buddy makes a sound.
   dog.bark(); // Buddy barks.
   ```

8. What are arrow functions and how do they differ from regular functions?
   Answer: Arrow functions are a concise way to write function expressions. They have a lexically bound 'this' and cannot be used as constructors.

   Coding question: Write a function that compares the behavior of 'this' in arrow functions and regular functions.

   Example:
   ```javascript
   const obj = {
     name: "Object",
     regularMethod: function() {
       console.log("Regular method:", this.name);
       return function() {
         console.log("Inner regular function:", this.name);
       };
     },
     arrowMethod: function() {
       console.log("Arrow method:", this.name);
       return () => {
         console.log("Inner arrow function:", this.name);
       };
     }
   };

   const regular = obj.regularMethod();
   const arrow = obj.arrowMethod();

   regular();
   arrow();
   ```

9. How do you handle asynchronous operations in JavaScript?
   Answer: Asynchronous operations can be handled using callbacks, Promises, or async/await syntax.

   Coding question: Implement a function that fetches data from an API using async/await.

   Example:
   ```javascript
   async function fetchUserData(userId) {
     try {
       const response = await fetch(`https://api.example.com/users/${userId}`);
       if (!response.ok) {
         throw new Error('Failed to fetch user data');
       }
       const userData = await response.json();
       return userData;
     } catch (error) {
       console.error('Error:', error.message);
       return null;
     }
   }

   // Usage
   fetchUserData(123).then(userData => {
     if (userData) {
       console.log('User data:', userData);
     }
   });
   ```

10. What are JavaScript modules and how do they work?
    Answer: Modules are a way to organize and encapsulate code in JavaScript. They use the import and export keywords to share functionality between files.

    Coding question: Create two modules, one exporting functions and another importing and using them.

    Example:
    ```javascript
    // mathOperations.js
    export function add(a, b) {
      return a + b;
    }

    export function subtract(a, b) {
      return a - b;
    }

    // main.js
    import { add, subtract } from './mathOperations.js';

    console.log(add(5, 3)); // 8
    console.log(subtract(10, 4)); // 6
    ```

11. How does the spread operator work in JavaScript?
    Answer: The spread operator (...) allows an iterable to be expanded in places where zero or more arguments or elements are expected.

    Coding question: Write a function that uses the spread operator to merge arrays and objects.

    Example:
    ```javascript
    function mergeArraysAndObjects() {
      const arr1 = [1, 2, 3];
      const arr2 = [4, 5, 6];
      const mergedArray = [...arr1, ...arr2];

      const obj1 = { a: 1, b: 2 };
      const obj2 = { c: 3, d: 4 };
      const mergedObject = { ...obj1, ...obj2 };

      console.log("Merged array:", mergedArray);
      console.log("Merged object:", mergedObject);
    }

    mergeArraysAndObjects();
    ```

12. What is destructuring in JavaScript?
    Answer: Destructuring is a way to extract values from arrays or properties from objects and assign them to variables.

    Coding question: Write a function that demonstrates array and object destructuring.

    Example:
    ```javascript
    function demonstrateDestructuring() {
      const person = { name: "Alice", age: 30, city: "New York" };
      const { name, age } = person;
      console.log(`${name} is ${age} years old`);

      const colors = ["red", "green", "blue"];
      const [firstColor, , thirdColor] = colors;
      console.log(`First color: ${firstColor}, Third color: ${thirdColor}`);
    }

    demonstrateDestructuring();
    ```

13. How do you handle errors in JavaScript?
    Answer: Errors in JavaScript can be handled using try-catch blocks, throwing custom errors, and using the Promise catch method for asynchronous operations.

    Coding question: Write a function that demonstrates error handling with try-catch and custom errors.

    Example:
    ```javascript
    class CustomError extends Error {
      constructor(message) {
        super(message);
        this.name = "CustomError";
      }
    }

    function divide(a, b) {
      if (b === 0) {
        throw new CustomError("Cannot divide by zero");
      }
      return a / b;
    }

    function demonstrateErrorHandling() {
      try {
        console.log(divide(10, 2));
        console.log(divide(10, 0));
      } catch (error) {
        if (error instanceof CustomError) {
          console.error("Custom error:", error.message);
        } else {
          console.error("Unexpected error:", error.message);
        }
      }
    }

    demonstrateErrorHandling();
    ```

14. What are JavaScript Promises and how do they work?
    Answer: Promises are objects representing the eventual completion or failure of an asynchronous operation. They provide a way to handle asynchronous operations more elegantly than callbacks.

    Coding question: Implement a function that returns a Promise and demonstrate chaining and error handling.

    Example:
    ```javascript
    function fetchData(id) {
      return new Promise((resolve, reject) => {
        setTimeout(() => {
          if (id > 0) {
            resolve(`Data for id ${id}`);
          } else {
            reject(new Error("Invalid ID"));
          }
        }, 1000);
      });
    }

    function demonstratePromises() {
      fetchData(5)
        .then(data => {
          console.log("Fetched data:", data);
          return fetchData(-1);
        })
        .then(data => {
          console.log("This won't be called");
        })
        .catch(error => {
          console.error("Error:", error.message);
        })
        .finally(() => {
          console.log("Promise chain completed");
        });
    }

    demonstratePromises();
    ```

15. How does the 'bind' method work in JavaScript?
    Answer: The 'bind' method creates a new function with a fixed 'this' value, regardless of how it's called.

    Coding question: Write a function that demonstrates the use of 'bind' to set the context of a function.

    Example:
    ```javascript
    const person = {
      name: "Alice",
      greet: function(greeting) {
        console.log(`${greeting}, ${this.name}!`);
      }
    };

    function demonstrateBind() {
      const greetFunction = person.greet;
      greetFunction("Hello"); // "Hello, undefined!"

      const boundGreet = person.greet.bind(person);
      boundGreet("Hi"); // "Hi, Alice!"

      const otherPerson = { name: "Bob" };
      const greetBob = person.greet.bind(otherPerson);
      greetBob("Hey"); // "Hey, Bob!"
    }

    demonstrateBind();
    ```

16. What is the purpose of the 'map' function in JavaScript?
    Answer: The 'map' function creates a new array with the results of calling a provided function on every element in the array.

    Coding question: Write a function that uses 'map' to transform an array of numbers.

    Example:
    ```javascript
    function squareNumbers(numbers) {
      return numbers.map(num => num * num);
    }

    const numbers = [1, 2, 3, 4, 5];
    console.log("Original numbers:", numbers);
    console.log("Squared numbers:", squareNumbers(numbers));
    ```

17. How does the 'reduce' function work in JavaScript?
    Answer: The 'reduce' function executes a reducer function on each element of the array, resulting in a single output value.

    Coding question: Implement a function that uses 'reduce' to calculate the sum and product of an array of numbers.

    Example:
    ```javascript
    function sumAndProduct(numbers) {
      return numbers.reduce((acc, num) => {
        return {
          sum: acc.sum + num,
          product: acc.product * num
        };
      }, { sum: 0, product: 1 });
    }

    const numbers = [1, 2, 3, 4, 5];
    console.log("Numbers:", numbers);
    console.log("Result:", sumAndProduct(numbers));
    ```

18. What are JavaScript generators and how do they work?
    Answer: Generators are functions that can be paused and resumed, allowing for the creation of iterators.

    Coding question: Implement a generator function that yields a Fibonacci sequence.

    Example:
    ```javascript
    function* fibonacciGenerator() {
      let a = 0, b = 1;
      while (true) {
        yield a;
        [a, b] = [b, a + b];
      }
    }

    function demonstrateGenerator() {
      const fib = fibonacciGenerator();
      for (let i = 0; i < 10; i++) {
        console.log(fib.next().value);
      }
    }

    demonstrateGenerator();
    ```

19. How do you use the 'fetch' API in JavaScript?
    Answer: The 'fetch' API is used to make network requests and returns a Promise that resolves to the Response object representing the response to the request.

    Coding question: Write a function that uses the 'fetch' API to get data from a REST API and handle errors.

    Example:
    ```javascript
    async function fetchUserData(userId) {
      try {
        const response = await fetch(`https://jsonplaceholder.typicode.com/users/${userId}`);
        if (!response.ok) {
          throw new Error(`HTTP error! status: ${response.status}`);
        }
        const userData = await response.json();
        console.log("User data:", userData);
      } catch (error) {
        console.error("Fetch error:", error.message);
      }
    }

    fetchUserData(1);
    ```

20. What is the purpose of the 'Set' object in JavaScript?
    Answer: The 'Set' object lets you store unique values of any type, whether primitive values or object references.

    Coding question: Implement a function that uses a Set to remove duplicates from an array.

    Example:
    ```javascript
    function removeDuplicates(array) {
      return [...new Set(array)];
    }

    const numbers = [1, 2, 2, 3, 4, 4, 5];

    console.log(removeDuplicates(numbers)); // Output: [1, 2, 3, 4, 5]
    ```

21. What is the purpose of the Map object in JavaScript?
    Answer: The Map object holds key-value pairs and remembers the original insertion order of the keys. Any value (both objects and primitive values) may be used as either a key or a value.

    Coding question: Implement a function that uses a Map to count the occurrences of each element in an array.

    Example:
    ```javascript
    function countOccurrences(array) {
      const occurrences = new Map();
      for (const item of array) {
        occurrences.set(item, (occurrences.get(item) || 0) + 1);
      }
      return occurrences;
    }

    const fruits = ['apple', 'banana', 'apple', 'orange', 'banana', 'apple'];
    console.log(countOccurrences(fruits));
    // Output: Map(3) { 'apple' => 3, 'banana' => 2, 'orange' => 1 }
    ```

22. What are Promises in JavaScript and how do they work?
    Answer: Promises are objects representing the eventual completion or failure of an asynchronous operation. They provide a way to handle asynchronous operations more elegantly than callbacks.

    Coding question: Implement a function that returns a Promise which resolves after a specified delay.

    Example:
    ```javascript
    function delay(ms) {
      return new Promise(resolve => setTimeout(resolve, ms));
    }

    async function example() {
      console.log('Start');
      await delay(2000);
      console.log('After 2 seconds');
    }

    example();
    ```

23. What is the purpose of the async/await syntax in JavaScript?
    Answer: async/await is syntactic sugar built on top of Promises, making asynchronous code easier to write and understand. It allows you to write asynchronous code that looks and behaves like synchronous code.

    Coding question: Rewrite the fetch example from question 19 using async/await syntax.

    Example:
    ```javascript
    async function fetchUserData(userId) {
      try {
        const response = await fetch(`https://jsonplaceholder.typicode.com/users/${userId}`);
        if (!response.ok) {
          throw new Error(`HTTP error! status: ${response.status}`);
        }
        const userData = await response.json();
        console.log("User data:", userData);
      } catch (error) {
        console.error("Fetch error:", error.message);
      }
    }

    fetchUserData(1);
    ```

24. What are JavaScript modules and how are they used?
    Answer: JavaScript modules are a way to organize code into separate files, making it easier to maintain and reuse. They use the `import` and `export` keywords to share functionality between files.

    Coding question: Create two modules: one that exports a function to calculate the area of a circle, and another that imports and uses this function.

    Example:
    ```javascript
    // circle.js
    export function calculateCircleArea(radius) {
      return Math.PI * radius * radius;
    }

    // main.js
    import { calculateCircleArea } from './circle.js';

    console.log(calculateCircleArea(5)); // Output: 78.53981633974483
    ```

25. What is the purpose of the `Symbol` data type in JavaScript?
    Answer: Symbols are a primitive data type in JavaScript that represent unique identifiers. They are often used as property keys in objects to avoid naming conflicts.

    Coding question: Implement a function that uses a Symbol as a key in an object to create a "hidden" property.

    Example:
    ```javascript
    const hiddenProperty = Symbol('hidden');

    function createObjectWithHiddenProperty(value) {
      return {
        visible: 'This is visible',
        [hiddenProperty]: value
      };
    }

    const obj = createObjectWithHiddenProperty('Secret');
    console.log(obj.visible); // Output: 'This is visible'
    console.log(obj[hiddenProperty]); // Output: 'Secret'
    console.log(Object.keys(obj)); // Output: ['visible']
    ```

These questions cover various advanced concepts of JavaScript and include coding questions to evaluate a candidate's understanding and practical skills.


Advanced Level

1. What are JavaScript design patterns and how are they used?
   Answer: Design patterns are reusable solutions to common programming problems. They provide templates for solving issues in a way that is efficient and maintainable. In JavaScript, design patterns help in organizing code, improving modularity, and promoting best practices.

   Coding question: Implement the Singleton pattern in JavaScript.

   Example:
   ```javascript
   class Singleton {
     constructor() {
       if (Singleton.instance) {
         return Singleton.instance;
       }
       Singleton.instance = this;
       this.data = [];
     }

     addItem(item) {
       this.data.push(item);
     }

     getItems() {
       return this.data;
     }
   }

   const instance1 = new Singleton();
   const instance2 = new Singleton();

   instance1.addItem('Item 1');
   instance2.addItem('Item 2');

   console.log(instance1.getItems()); // ['Item 1', 'Item 2']
   console.log(instance1 === instance2); // true
   ```

2. How do you use JavaScript to implement creational patterns?
   Answer: Creational patterns in JavaScript deal with object creation mechanisms. They include patterns like Factory, Abstract Factory, Builder, Prototype, and Singleton. These patterns provide flexibility in creating objects and help manage complexity.

   Coding question: Implement the Factory pattern to create different types of vehicles.

   Example:
   ```javascript
   class Car {
     constructor(make, model) {
       this.make = make;
       this.model = model;
       this.type = 'Car';
     }
   }

   class Truck {
     constructor(make, model) {
       this.make = make;
       this.model = model;
       this.type = 'Truck';
     }
   }

   class VehicleFactory {
     createVehicle(type, make, model) {
       switch(type) {
         case 'car':
           return new Car(make, model);
         case 'truck':
           return new Truck(make, model);
         default:
           throw new Error('Invalid vehicle type');
       }
     }
   }

   const factory = new VehicleFactory();
   const car = factory.createVehicle('car', 'Toyota', 'Corolla');
   const truck = factory.createVehicle('truck', 'Ford', 'F-150');

   console.log(car); // Car { make: 'Toyota', model: 'Corolla', type: 'Car' }
   console.log(truck); // Truck { make: 'Ford', model: 'F-150', type: 'Truck' }
   ```

3. What are JavaScript structural patterns and how are they used?
   Answer: Structural patterns in JavaScript deal with object composition. They help in creating relationships between objects to form larger structures. Examples include Adapter, Bridge, Composite, Decorator, Facade, Flyweight, and Proxy patterns.

   Coding question: Implement the Decorator pattern to add new functionality to an existing object.

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

   let coffee = new Coffee();
   console.log(coffee.cost()); // 5

   coffee = new MilkDecorator(coffee);
   console.log(coffee.cost()); // 7

   coffee = new SugarDecorator(coffee);
   console.log(coffee.cost()); // 8
   ```

4. How do you use JavaScript to implement behavioral patterns?
   Answer: Behavioral patterns in JavaScript focus on communication between objects, how objects interact, and how responsibilities are distributed. Examples include Observer, Strategy, Command, State, and Iterator patterns.

   Coding question: Implement the Observer pattern to create a simple event system.

   Example:
   ```javascript
   class EventEmitter {
     constructor() {
       this.listeners = {};
     }

     on(event, callback) {
       if (!this.listeners[event]) {
         this.listeners[event] = [];
       }
       this.listeners[event].push(callback);
     }

     emit(event, data) {
       if (this.listeners[event]) {
         this.listeners[event].forEach(callback => callback(data));
       }
     }
   }

   const emitter = new EventEmitter();

   emitter.on('userLoggedIn', user => console.log(`${user} logged in`));
   emitter.on('userLoggedOut', user => console.log(`${user} logged out`));

   emitter.emit('userLoggedIn', 'John'); // John logged in
   emitter.emit('userLoggedOut', 'Jane'); // Jane logged out
   ```

5. What are JavaScript architectural patterns and how are they used?
   Answer: Architectural patterns in JavaScript provide high-level structures for organizing code in large applications. They include patterns like MVC (Model-View-Controller), MVVM (Model-View-ViewModel), and Flux. These patterns help in separating concerns and managing complex application states.

   Coding question: Implement a simple MVC pattern for a todo list application.

   Example:
   ```javascript
   // Model
   class TodoModel {
     constructor() {
       this.todos = [];
     }

     addTodo(todo) {
       this.todos.push(todo);
     }

     getTodos() {
       return this.todos;
     }
   }

   // View
   class TodoView {
     constructor() {
       this.app = document.getElementById('app');
     }

     render(todos) {
       this.app.innerHTML = `
         <ul>
           ${todos.map(todo => `<li>${todo}</li>`).join('')}
         </ul>
       `;
     }
   }

   // Controller
   class TodoController {
     constructor(model, view) {
       this.model = model;
       this.view = view;
     }

     addTodo(todo) {
       this.model.addTodo(todo);
       this.updateView();
     }

     updateView() {
       this.view.render(this.model.getTodos());
     }
   }

   const app = new TodoController(new TodoModel(), new TodoView());
   app.addTodo('Learn MVC');
   app.addTodo('Build an app');
   ```

6. How do you use JavaScript to implement micro-frontends?
   Answer: Micro-frontends is an architectural style where a frontend app is decomposed into smaller, semi-independent "microapps" working loosely together. This can be implemented in JavaScript using various techniques such as iframes, JavaScript modules, or Web Components.

   Coding question: Create a simple micro-frontend setup using Web Components.

   Example:
   ```javascript
   // Micro-frontend 1: Header
   class HeaderComponent extends HTMLElement {
     connectedCallback() {
       this.innerHTML = `<header>
         <h1>My Micro-Frontend App</h1>
       </header>`;
     }
   }
   customElements.define('header-component', HeaderComponent);

   // Micro-frontend 2: Content
   class ContentComponent extends HTMLElement {
     connectedCallback() {
       this.innerHTML = `<main>
         <p>This is the main content area.</p>
       </main>`;
     }
   }
   customElements.define('content-component', ContentComponent);

   // Micro-frontend 3: Footer
   class FooterComponent extends HTMLElement {
     connectedCallback() {
       this.innerHTML = `<footer>
         <p>&copy; 2023 My Company</p>
       </footer>`;
     }
   }
   customElements.define('footer-component', FooterComponent);

   // Usage in HTML
   // <header-component></header-component>
   // <content-component></content-component>
   // <footer-component></footer-component>
   ```

7. What are JavaScript monorepos and how are they used?
   Answer: A monorepo is a version-controlled code repository that holds many projects. In JavaScript, monorepos are used to manage multiple related packages or applications within a single repository, sharing build processes, linting rules, and dependencies.

   Coding question: Set up a basic monorepo structure using Lerna.

   Example:
   ```javascript
   // First, install Lerna globally
   // npm install -g lerna

   // Initialize a new Lerna repo
   // lerna init

   // Create two packages
   // mkdir packages/package-a packages/package-b

   // package-a/index.js
   module.exports = function() {
     console.log('Hello from Package A');
   }

   // package-b/index.js
   const packageA = require('package-a');

   module.exports = function() {
     packageA();
     console.log('Hello from Package B');
   }

   // In the root package.json, add:
   // "workspaces": [
   //   "packages/*"
   // ]

   // Use Lerna to manage dependencies and run scripts across all packages
   // lerna bootstrap
   // lerna run test
   ```

8. How do you use JavaScript to implement serverless architecture?
   Answer: Serverless architecture in JavaScript typically involves writing functions that are deployed to cloud platforms like AWS Lambda, Azure Functions, or Google Cloud Functions. These functions respond to events and can be used to build scalable, event-driven applications.

   Coding question: Write a simple AWS Lambda function in JavaScript.

   Example:
   ```javascript
   // This would be deployed to AWS Lambda
   exports.handler = async (event) => {
     const name = event.queryStringParameters?.name || 'World';
     
     const response = {
       statusCode: 200,
       body: JSON.stringify(`Hello, ${name}!`),
     };
     
     return response;
   };

   // To test locally:
   const testEvent = {
     queryStringParameters: {
       name: 'Alice'
     }
   };

   exports.handler(testEvent)
     .then(response => console.log(response))
     .catch(error => console.error(error));
   ```

9. What is JavaScript WebAssembly and how is it used?
   Answer: WebAssembly (Wasm) is a binary instruction format for a stack-based virtual machine. It's designed to be fast to load and execute, and it complements JavaScript in web browsers. It's often used for performance-critical parts of web applications.

   Coding question: Use WebAssembly to create a simple function that adds two numbers.

   Example:
   ```javascript
   // First, you need to compile C or Rust code to WebAssembly
   // Here's a simple C function:
   // int add(int a, int b) {
   //   return a + b;
   // }

   // After compilation, you can use it in JavaScript like this:
   fetch('add.wasm')
     .then(response => response.arrayBuffer())
     .then(bytes => WebAssembly.instantiate(bytes))
     .then(results => {
       const add = results.instance.exports.add;
       console.log(add(5, 3)); // 8
     });
   ```

10. How do you use JavaScript to implement PWA's?
    Answer: Progressive Web Apps (PWAs) use modern web capabilities to deliver app-like experiences. They're implemented using service workers, manifests, and other web-platform features in JavaScript.

    Coding question: Create a simple service worker for caching assets in a PWA.

    Example:
    ```javascript
    // service-worker.js
    const CACHE_NAME = 'my-pwa-cache-v1';
    const urlsToCache = [
      '/',
      '/styles/main.css',
      '/script/main.js'
    ];

    self.addEventListener('install', event => {
      event.waitUntil(
        caches.open(CACHE_NAME)
          .then(cache => cache.addAll(urlsToCache))
      );
    });

    self.addEventListener('fetch', event => {
      event.respondWith(
        caches.match(event.request)
          .then(response => response || fetch(event.request))
      );
    });

    // In your main JavaScript file:
    if ('serviceWorker' in navigator) {
      window.addEventListener('load', () => {
        navigator.serviceWorker.register('/service-worker.js')
          .then(registration => {
            console.log('ServiceWorker registered: ', registration);
          })
          .catch(error => {
            console.log('ServiceWorker registration failed: ', error);
          });
      });
    }
    ```

Advanced Level

1. What is the Event Loop in JavaScript and how does it work?
   Answer: The Event Loop is a mechanism that allows JavaScript to perform non-blocking operations despite being single-threaded. It continuously checks the call stack and the callback queue, pushing callbacks to the stack when it's empty.

   Coding question: Demonstrate the asynchronous nature of JavaScript using setTimeout and explain the order of execution.

   Example:
   ```javascript
   console.log('Start');

   setTimeout(() => {
     console.log('Timeout 1');
   }, 0);

   Promise.resolve().then(() => {
     console.log('Promise 1');
   });

   setTimeout(() => {
     console.log('Timeout 2');
   }, 0);

   console.log('End');

   // Output:
   // Start
   // End
   // Promise 1
   // Timeout 1
   // Timeout 2
   ```

2. Explain closures in JavaScript and their practical uses.
   Answer: A closure is the combination of a function and the lexical environment within which that function was declared. Closures allow a function to access variables from an outer function even after the outer function has returned.

   Coding question: Implement a counter function using closures.

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
   console.log(counter()); // 3
   ```

3. What are Higher-Order Functions in JavaScript?
   Answer: Higher-Order Functions are functions that can take other functions as arguments or return functions as their results.

   Coding question: Implement a higher-order function that creates a multiplier function.

   Example:
   ```javascript
   function createMultiplier(factor) {
     return function(number) {
       return number * factor;
     };
   }

   const double = createMultiplier(2);
   const triple = createMultiplier(3);

   console.log(double(5)); // 10
   console.log(triple(5)); // 15
   ```

4. Explain the concept of currying in JavaScript.
   Answer: Currying is the technique of translating a function that takes multiple arguments into a sequence of functions, each with a single argument.

   Coding question: Implement a curried version of a function that adds three numbers.

   Example:
   ```javascript
   function curry(fn) {
     return function curried(...args) {
       if (args.length >= fn.length) {
         return fn.apply(this, args);
       } else {
         return function(...args2) {
           return curried.apply(this, args.concat(args2));
         }
       }
     };
   }

   function add(a, b, c) {
     return a + b + c;
   }

   const curriedAdd = curry(add);

   console.log(curriedAdd(1)(2)(3)); // 6
   console.log(curriedAdd(1, 2)(3)); // 6
   console.log(curriedAdd(1, 2, 3)); // 6
   ```

5. What is the purpose of the `bind`, `call`, and `apply` methods in JavaScript?
   Answer: These methods are used to set the `this` value in function calls. `bind` returns a new function with a fixed `this`, while `call` and `apply` immediately invoke the function with a given `this` and arguments.

   Coding question: Demonstrate the use of `bind`, `call`, and `apply`.

   Example:
   ```javascript
   const person = {
     name: 'John',
     greet: function(greeting) {
       console.log(`${greeting}, ${this.name}!`);
     }
   };

   const greetFunction = person.greet;
   const boundGreet = greetFunction.bind(person);

   boundGreet('Hello'); // "Hello, John!"
   greetFunction.call(person, 'Hi'); // "Hi, John!"
   greetFunction.apply(person, ['Hey']); // "Hey, John!"
   ```

6. Explain the concept of prototypal inheritance in JavaScript.
   Answer: Prototypal inheritance is a method by which an object can inherit properties and methods from another object.

   Coding question: Implement a simple example of prototypal inheritance.

   Example:
   ```javascript
   function Animal(name) {
     this.name = name;
   }

   Animal.prototype.speak = function() {
     console.log(`${this.name} makes a sound.`);
   };

   function Dog(name) {
     Animal.call(this, name);
   }

   Dog.prototype = Object.create(Animal.prototype);
   Dog.prototype.constructor = Dog;

   Dog.prototype.bark = function() {
     console.log(`${this.name} barks.`);
   };

   const dog = new Dog('Rex');
   dog.speak(); // "Rex makes a sound."
   dog.bark(); // "Rex barks."
   ```

7. What are JavaScript Proxies and how are they used?
   Answer: Proxies are used to define custom behavior for fundamental operations like property lookup, assignment, enumeration, function invocation, etc.

   Coding question: Implement a proxy to log property access on an object.

   Example:
   ```javascript
   const target = {
     name: 'John',
     age: 30
   };

   const handler = {
     get: function(obj, prop) {
       console.log(`Accessing property: ${prop}`);
       return obj[prop];
     }
   };

   const proxy = new Proxy(target, handler);

   console.log(proxy.name); // Logs: "Accessing property: name", then "John"
   console.log(proxy.age); // Logs: "Accessing property: age", then 30
   ```

8. Explain the concept of memoization in JavaScript.
   Answer: Memoization is an optimization technique that speeds up applications by storing the results of expensive function calls and returning the cached result when the same inputs occur again.

   Coding question: Implement a memoization function for calculating Fibonacci numbers.

   Example:
   ```javascript
   function memoize(fn) {
     const cache = {};
     return function(...args) {
       const key = JSON.stringify(args);
       if (key in cache) {
         return cache[key];
       }
       const result = fn.apply(this, args);
       cache[key] = result;
       return result;
     }
   }

   const fibonacci = memoize(function(n) {
     if (n < 2) return n;
     return fibonacci(n - 1) + fibonacci(n - 2);
   });

   console.log(fibonacci(100)); // Fast calculation even for large numbers
   ```

9. What are JavaScript Generators and how are they used?
   Answer: Generators are functions that can be paused and resumed, allowing for the creation of iterators in a more straightforward way.

   Coding question: Implement a generator function that yields a Fibonacci sequence.

   Example:
   ```javascript
   function* fibonacciGenerator() {
     let a = 0, b = 1;
     while (true) {
       yield a;
       [a, b] = [b, a + b];
     }
   }

   const fib = fibonacciGenerator();
   for (let i = 0; i < 10; i++) {
     console.log(fib.next().value);
   }
   ```

10. Explain the concept of debouncing in JavaScript.
    Answer: Debouncing is a programming practice used to ensure that time-consuming tasks do not fire so often, making them more efficient.

    Coding question: Implement a debounce function.

    Example:
    ```javascript
    function debounce(func, delay) {
      let timeoutId;
      return function(...args) {
        clearTimeout(timeoutId);
        timeoutId = setTimeout(() => {
          func.apply(this, args);
        }, delay);
      };
    }

    const expensiveOperation = () => console.log('Expensive operation');
    const debouncedOperation = debounce(expensiveOperation, 1000);

    // Rapid calls, but the function will only execute once after 1 second of inactivity
    debouncedOperation();
    debouncedOperation();
    debouncedOperation();
    ```

11. What is the purpose of the `Object.create()` method in JavaScript?
    Answer: `Object.create()` creates a new object with the specified prototype object and properties.

    Coding question: Use `Object.create()` to implement prototypal inheritance.

    Example:
    ```javascript
    const person = {
      isHuman: false,
      printIntroduction: function() {
        console.log(`My name is ${this.name}. Am I human? ${this.isHuman}`);
      }
    };

    const me = Object.create(person);
    me.name = 'Matthew';
    me.isHuman = true;

    me.printIntroduction(); // "My name is Matthew. Am I human? true"
    ```

12. Explain the concept of the Module pattern in JavaScript.
    Answer: The Module pattern is used to create private and public encapsulation in JavaScript, providing a way to create private and public methods and variables.

    Coding question: Implement a simple module with private and public methods.

    Example:
    ```javascript
    const counterModule = (function() {
      let count = 0;
      
      function incrementCounter() {
        count++;
      }
      
      return {
        increment: function() {
          incrementCounter();
        },
        getCount: function() {
          return count;
        }
      };
    })();

    counterModule.increment();
    counterModule.increment();
    console.log(counterModule.getCount()); // 2
    console.log(counterModule.count); // undefined (private variable)
    ```

13. What are JavaScript Symbols and how are they used?
    Answer: Symbols are a primitive data type in JavaScript, representing unique identifiers. They are often used as property keys to avoid naming conflicts.

    Coding question: Use a Symbol to create a unique property on an object.

    Example:
    ```javascript
    const uniqueKey = Symbol('description');

    const obj = {
      [uniqueKey]: 'This is a unique property'
    };

    console.log(obj[uniqueKey]); // "This is a unique property"
    console.log(Object.getOwnPropertySymbols(obj)); // [Symbol(description)]
    ```

14. Explain the concept of the Revealing Module Pattern in JavaScript.
    Answer: The Revealing Module Pattern is a design pattern that allows you to define all of your methods and variables in the private scope and return an anonymous object with pointers to the private functionality you want to reveal as public.

    Coding question: Implement a calculator module using the Revealing Module Pattern.

    Example:
    ```javascript
    const calculator = (function() {
      function add(a, b) { return a + b; }
      function subtract(a, b) { return a - b; }
      function multiply(a, b) { return a * b; }
      function divide(a, b) { return a / b; }

      return {
        add: add,
        sub: subtract,
        mul: multiply,
        div: divide
      };
    })();

    console.log(calculator.add(5, 3)); // 8
    console.log(calculator.mul(2, 4)); // 8
    ```

15. What is the purpose of the `Object.freeze()` method in JavaScript?
    Answer: `Object.freeze()` freezes an object, preventing new properties from being added to it and existing properties from being modified or deleted.

    Coding question: Demonstrate the use of `Object.freeze()`.

    Example:
    ```javascript
    const obj = {
      prop: 42
    };

    Object.freeze(obj);

    obj.prop = 33; // Throws an error in strict mode
    console.log(obj.prop); // 42

    // Attempt to add new property
    obj.newProp = 'test'; // Fails silently
    console.log(obj.newProp); // undefined
    ```

16. Explain the concept of the Observer pattern in JavaScript.
    Answer: The Observer pattern is a software design pattern in which an object, called the subject, maintains a list of its dependents, called observers, and notifies them automatically of any state changes.

    Coding question: Implement a simple Observer pattern.

    Example:
    ```javascript
    class Subject {
      constructor() {
        this.observers = [];
      }

      addObserver(observer) {
        this.observers.push(observer);
      }

      removeObserver(observer) {
        const index = this.observers.indexOf(observer);
        if (index > -1) {
          this.observers.splice(index, 1);
        }
      }

      notify(data) {
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

    subject.notify('Hello Observers!');
    ```

17. What is the purpose of the `Object.assign()` method in JavaScript?
    Answer: `Object.assign()` is used to copy the values of all enumerable own properties from one or more source objects to a target object.

    Coding question: Use `Object.assign()` to merge multiple objects.

    Example:
    ```javascript
    const target = { a: 1, b: 2 };
    const source1 = { b: 3, c: 4 };
    const source2 = { d: 5 };

    const result = Object.assign({}, target, source1, source2);

    console.log(result); // { a: 1, b: 3, c: 4, d: 5 }
    ```

18. Explain the concept of the Mediator pattern in JavaScript.
    Answer: The Mediator pattern defines an object that encapsulates how a set of objects interact. It promotes loose coupling by keeping objects from referring to each other explicitly.

    Coding question: Implement a simple chat room using the Mediator pattern.

    Example:
    ```javascript
    class ChatRoom {
      showMessage(user, message) {
        console.log(`[${user.name}]: ${message}`);
      }
    }

    class User {
      constructor(name, chatRoom) {
        this.name = name;
        this.chatRoom = chatRoom;
      }

      send(message) {
        this.chatRoom.showMessage(this, message);
      }
    }

    const chatRoom = new ChatRoom();

    const john = new User('John', chatRoom);
    const jane = new User('Jane', chatRoom);

    john.send('Hi there!');
    jane.send('Hey John!');
    ```

19. What is the purpose of the `Object.is()` method in JavaScript?
    Answer: `Object.is()` determines whether two values are the same value, addressing special cases where `===` might produce unexpected results.

    Coding question: Demonstrate the difference between `Object.is()` and `===`.

    Example:
    ```javascript
    console.log(Object.is(0, -0)); // false
    console.log(0 === -0); // true

    console.log(Object.is(NaN, NaN)); // true
    console.log(NaN === NaN); // false

    console.log(Object.is(null, null)); // true
    console.log(null === null); // true
    ```

20. Explain the concept of the Command pattern in JavaScript.
    Answer: The Command pattern encapsulates a request as an object, allowing you to parameterize clients with different requests, queue or log requests, and support undoable operations.

    Coding question: Implement a simple command pattern for a remote control.

    Example:
    ```javascript
    class Light {
      turnOn() {
        console.log('Light is on');
      }

      turnOff() {
        console.log('Light is off');
      }
    }

    class LightOnCommand {
      constructor(light) {
        this.light = light;
      }

      execute() {
        this.light.turnOn();
      }
    }

    class LightOffCommand {



Expert Level

Expert Level

1. What are JavaScript memory management and how is it used?
   Answer: JavaScript uses automatic memory management through garbage collection. The garbage collector identifies and removes objects that are no longer reachable, freeing up memory.

   Coding question: Implement a function that demonstrates memory leak and explain how to fix it.

   Example:
   ```javascript
   function createLeak() {
     let leakyArray = [];
     setInterval(() => {
       leakyArray.push(new Array(1000000).fill('leak'));
     }, 1000);
   }
   // Fix: Clear the interval and remove the reference to leakyArray
   ```

2. How do you use JavaScript to implement concurrent programming?
   Answer: JavaScript uses an event loop for concurrency. Asynchronous operations, Promises, and async/await are used to handle concurrent tasks without blocking the main thread.

   Coding question: Implement a function that performs multiple asynchronous operations concurrently.

   Example:
   ```javascript
   async function concurrentFetch(urls) {
     const promises = urls.map(url => fetch(url).then(res => res.json()));
     return await Promise.all(promises);
   }
   ```

3. What are JavaScript Web Workers and how are they used?
   Answer: Web Workers allow running scripts in background threads, enabling multi-threading in JavaScript for CPU-intensive tasks without affecting the main thread.

   Coding question: Create a Web Worker that calculates prime numbers.

   Example:
   ```javascript
   // worker.js
   self.onmessage = function(e) {
     const max = e.data;
     const primes = [];
     for (let i = 2; i <= max; i++) {
       if (isPrime(i)) primes.push(i);
     }
     self.postMessage(primes);
   };

   function isPrime(n) {
     for (let i = 2; i <= Math.sqrt(n); i++) {
       if (n % i === 0) return false;
     }
     return n > 1;
   }

   // main.js
   const worker = new Worker('worker.js');
   worker.onmessage = function(e) {
     console.log('Primes:', e.data);
   };
   worker.postMessage(1000000);
   ```

4. How do you use JavaScript to implement WebAssembly modules?
   Answer: WebAssembly (Wasm) allows running high-performance code written in languages like C++ in the browser. JavaScript can load and interact with Wasm modules.

   Coding question: Load a WebAssembly module and call a function from it.

   Example:
   ```javascript
   async function loadWasm() {
     const response = await fetch('module.wasm');
     const bytes = await response.arrayBuffer();
     const { instance } = await WebAssembly.instantiate(bytes);
     return instance.exports;
   }

   loadWasm().then(exports => {
     console.log(exports.add(5, 3));
   });
   ```

5. What are JavaScript async/await and how are they used?
   Answer: async/await is syntactic sugar for working with Promises, making asynchronous code look and behave more like synchronous code.

   Coding question: Implement a function that uses async/await to handle multiple API calls in sequence.

   Example:
   ```javascript
   async function fetchUserData(userId) {
     const user = await fetch(`/api/users/${userId}`).then(res => res.json());
     const posts = await fetch(`/api/posts?userId=${userId}`).then(res => res.json());
     return { user, posts };
   }
   ```

6. How do you use JavaScript to implement observable patterns?
   Answer: Observables represent a stream of values over time. Libraries like RxJS provide powerful tools for working with observables.

   Coding question: Implement a simple observable pattern for handling user input.

   Example:
   ```javascript
   class Observable {
     constructor() {
       this.observers = [];
     }
     subscribe(fn) {
       this.observers.push(fn);
     }
     notify(data) {
       this.observers.forEach(fn => fn(data));
     }
   }

   const input = document.getElementById('input');
   const inputObservable = new Observable();

   input.addEventListener('input', e => inputObservable.notify(e.target.value));
   inputObservable.subscribe(value => console.log('Input changed:', value));
   ```

7. What is JavaScript reactive programming and how is it used?
   Answer: Reactive programming is a paradigm focused on working with asynchronous data streams. It's often implemented using observables.

   Coding question: Use RxJS to create a simple autocomplete feature.

   Example:
   ```javascript
   import { fromEvent } from 'rxjs';
   import { debounceTime, map, switchMap } from 'rxjs/operators';

   const input = document.getElementById('search');
   const results = document.getElementById('results');

   fromEvent(input, 'input').pipe(
     debounceTime(300),
     map(e => e.target.value),
     switchMap(term => fetch(`/api/search?q=${term}`).then(res => res.json()))
   ).subscribe(data => {
     results.innerHTML = data.map(item => `<li>${item}</li>`).join('');
   });
   ```

8. How do you use JavaScript to implement functional programming?
   Answer: Functional programming in JavaScript involves using pure functions, avoiding side effects, and treating computation as the evaluation of mathematical functions.

   Coding question: Implement a function composition utility and use it to create a data processing pipeline.

   Example:
   ```javascript
   const compose = (...fns) => x => fns.reduceRight((y, f) => f(y), x);

   const double = x => x * 2;
   const square = x => x * x;
   const addOne = x => x + 1;

   const pipeline = compose(addOne, square, double);
   console.log(pipeline(3)); // 37
   ```

9. What are JavaScript type systems and how are they used?
   Answer: Type systems in JavaScript are typically implemented through tools like TypeScript or Flow, providing static typing to catch errors at compile-time.

   Coding question: Write a TypeScript function that demonstrates the use of generics.

   Example:
   ```typescript
   function identity<T>(arg: T): T {
     return arg;
   }

   let output = identity<string>("myString");
   console.log(output);
   ```

10. How do you use JavaScript to implement dependency injection?
    Answer: Dependency injection is a design pattern where objects receive their dependencies instead of creating them internally, promoting loose coupling and testability.

    Coding question: Implement a simple dependency injection container.

    Example:
    ```javascript
    class DIContainer {
      constructor() {
        this.dependencies = {};
      }

      register(name, dependency) {
        this.dependencies[name] = dependency;
      }

      resolve(name) {
        if (!this.dependencies[name]) {
          throw new Error(`Dependency ${name} not found`);
        }
        return this.dependencies[name];
      }
    }

    const container = new DIContainer();
    container.register('logger', console.log);
    const logger = container.resolve('logger');
    logger('Hello, DI!');
    ```

11. What are JavaScript design patterns and how are they used in large-scale applications?
    Answer: Design patterns are reusable solutions to common programming problems. In large-scale applications, they help in organizing code, improving maintainability, and promoting best practices.

    Coding question: Implement the Observer pattern for a publish-subscribe system.

    Example:
    ```javascript
    class EventEmitter {
      constructor() {
        this.listeners = {};
      }

      on(event, callback) {
        if (!this.listeners[event]) {
          this.listeners[event] = [];
        }
        this.listeners[event].push(callback);
      }

      emit(event, data) {
        if (this.listeners[event]) {
          this.listeners[event].forEach(callback => callback(data));
        }
      }
    }

    const emitter = new EventEmitter();
    emitter.on('userLoggedIn', user => console.log(`${user} logged in`));
    emitter.emit('userLoggedIn', 'John');
    ```

12. How do you optimize JavaScript performance in high-load applications?
    Answer: Performance optimization involves techniques like code splitting, lazy loading, memoization, and efficient DOM manipulation.

    Coding question: Implement a memoization function for expensive calculations.

    Example:
    ```javascript
    function memoize(fn) {
      const cache = new Map();
      return function(...args) {
        const key = JSON.stringify(args);
        if (cache.has(key)) {
          return cache.get(key);
        }
        const result = fn.apply(this, args);
        cache.set(key, result);
        return result;
      };
    }

    const expensiveFunction = memoize((n) => {
      console.log('Calculating...');
      return n * n;
    });

    console.log(expensiveFunction(4)); // Calculating... 16
    console.log(expensiveFunction(4)); // 16 (from cache)
    ```

13. What are JavaScript modules and how do they improve code organization?
    Answer: Modules in JavaScript allow you to split your code into separate files, making it easier to maintain and reuse. They use import and export statements to share functionality.

    Coding question: Create a module for a math utility and use it in another file.

    Example:
    ```javascript
    // math.js
    export function add(a, b) {
      return a + b;
    }

    export function multiply(a, b) {
      return a * b;
    }

    // main.js
    import { add, multiply } from './math.js';

    console.log(add(2, 3)); // 5
    console.log(multiply(2, 3)); // 6
    ```

14. How do you implement secure authentication in JavaScript applications?
    Answer: Secure authentication involves using HTTPS, hashing passwords, implementing JWT or session-based auth, and protecting against common vulnerabilities like XSS and CSRF.

    Coding question: Implement a function to securely hash a password using bcrypt.

    Example:
    ```javascript
    const bcrypt = require('bcrypt');

    async function hashPassword(password) {
      const saltRounds = 10;
      return await bcrypt.hash(password, saltRounds);
    }

    async function verifyPassword(password, hash) {
      return await bcrypt.compare(password, hash);
    }

    // Usage
    hashPassword('myPassword').then(hash => {
      console.log('Hashed:', hash);
      verifyPassword('myPassword', hash).then(result => {
        console.log('Password correct:', result);
      });
    });
    ```

15. What are JavaScript closures and how can they be used for data privacy?
    Answer: Closures are functions that have access to variables in their outer (enclosing) lexical scope, even after the outer function has returned.

    Coding question: Implement a counter function using closures to maintain private state.

    Example:
    ```javascript
    function createCounter() {
      let count = 0;
      return {
        increment: () => ++count,
        decrement: () => --count,
        getCount: () => count
      };
    }

    const counter = createCounter();
    console.log(counter.increment()); // 1
    console.log(counter.increment()); // 2
    console.log(counter.decrement()); // 1
    console.log(counter.getCount()); // 1
    ```

16. How do you implement error handling and logging in large-scale JavaScript applications?
    Answer: Error handling in large applications often involves using try-catch blocks, custom error classes, and centralized error logging services.

    Coding question: Implement a custom error class and a global error handler.

    Example:
    ```javascript
    class AppError extends Error {
      constructor(message, statusCode) {
        super(message);
        this.statusCode = statusCode;
        this.name = this.constructor.name;
      }
    }

    function globalErrorHandler(error) {
      console.error(`[${new Date().toISOString()}] ${error.name}: ${error.message}`);
      if (error instanceof AppError) {
        // Handle application-specific errors
        console.error(`Status Code: ${error.statusCode}`);
      } else {
        // Handle unexpected errors
        console.error('Unexpected error occurred');
      }
    }

    try {
      throw new AppError('Resource not found', 404);
    } catch (error) {
      globalErrorHandler(error);
    }
    ```

17. What are JavaScript generators and how can they be used for managing asynchronous flow?
    Answer: Generators are functions that can be paused and resumed, allowing for powerful asynchronous programming patterns.

    Coding question: Implement an asynchronous task runner using generators.

    Example:
    ```javascript
    function* taskRunner() {
      try {
        const result1 = yield fetch('https://api.example.com/data1');
        console.log('Result 1:', yield result1.json());
        
        const result2 = yield fetch('https://api.example.com/data2');
        console.log('Result 2:', yield result2.json());
      } catch (error) {
        console.error('Error:', error);
      }
    }

    function run(generator) {
      const iterator = generator();
      function iterate(iteration) {
        if (iteration.done) return Promise.resolve(iteration.value);
        return Promise.resolve(iteration.value)
          .then(x => iterate(iterator.next(x)))
          .catch(x => iterate(iterator.throw(x)));
      }
      return iterate(iterator.next());
    }

    run(taskRunner);
    ```

18. How do you implement code splitting and lazy loading in JavaScript applications?
    Answer: Code splitting involves breaking your app into smaller chunks and loading them on demand, improving initial load time and performance.

    Coding question: Implement dynamic import for a heavy computation module.

    Example:
    ```javascript
    // heavyComputation.js
    export function complexCalculation(n) {
      // Simulating a heavy computation
      return new Array(n).fill(0).reduce((a, _, i) => a + Math.sqrt(i), 0);
    }

    // main.js
    async function loadAndCalculate(n) {
      const module = await import('./heavyComputation.js');
      return module.complexCalculation(n);
    }

    document.getElementById('calculate').addEventListener('click', async () => {
      const result = await loadAndCalculate(1000000);
      console.log('Result:', result);
    });
    ```

19. What are JavaScript proxies and how can they be used for metaprogramming?
    Answer: Proxies allow you to intercept and customize operations performed on objects, enabling powerful metaprogramming techniques.

    Coding question: Implement a proxy to create a "safe" object that throws an error when accessing undefined properties.

    Example:
    ```javascript
    function createSafeObject(target) {
      return new Proxy(target, {
        get(target, property) {
          if (property in target) {
            return target[property];
          }
          throw new Error(`Property "${property}" does not exist`);
        }
      });
    }

    const user = createSafeObject({ name: 'John', age: 30 });
    console.log(user.name); // John
    console.log(user.age);  // 30
    console.log(user.email); // Error: Property "email" does not exist
    ```

20. How do you implement a virtual DOM in JavaScript?
    Answer: A virtual DOM is a lightweight copy of the actual DOM, used to improve performance in frameworks like React by minimizing direct DOM manipulation.

    Coding question: Implement a simple virtual DOM and rendering function.

    Example:
    ```javascript
    function createElement(type, props, ...children) {
      return { type, props: props || {}, children };
    }

    function render(vNode, container) {
      if (typeof vNode === 'string') {
        container.appendChild(document.createTextNode(vNode));
        return;
      }

      const element = document.createElement(vNode.type);
      
      Object.entries(vNode.props).forEach(([name, value]) => {
        element.setAttribute(name, value);

These questions cover a range of topics related to JavaScript and can be used to evaluate a candidate's knowledge and experience in this area.

21. How can you detect and prevent duplicate code in JavaScript?
    Answer: Duplicate code can be detected through code analysis tools and prevented by following DRY (Don't Repeat Yourself) principles, using functions, modules, and design patterns.

    Coding question: Refactor the following code to remove duplication:

    Example:
    ```javascript
    function calculateCircleArea(radius) {
      return Math.PI * radius * radius;
    }

    function calculateCircleCircumference(radius) {
      return 2 * Math.PI * radius;
    }

    // Refactored version
    const circle = {
      area: (radius) => Math.PI * radius * radius,
      circumference: (radius) => 2 * Math.PI * radius
    };

    console.log(circle.area(5));
    console.log(circle.circumference(5));
    ```