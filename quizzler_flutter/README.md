# Quizzler

A simple quiz app with the goal of learning the basics of Object Oriented Programming

## Object Oriented Programing

- Abstraction
- Encapsulation
- Inheritance
- Polymorphism

### Abstraction
Break something complex into smaller pieces

The idea is break full tasks into simpler and single task functions.

(Instead of a single person doing everything in a restaurant, divide the task with multiple people that will only do that specific task. Eg: cleaner, waiter, chef, host and etc.)

### Encapsulation
Prevent one object from interfering with another's task by making its properties private within a class and providing access to its values via functions that only return its value.

(Instead of allowing the waiters into the kitchen and interfering on how the chef prepares the meals, separate them in different areas and make them comunicate with each other via restricted ways.)

### Inherirance
Gives a class the hability to inherit properties and methods from a parent class using the keyword ***'extends'*** when declaring a class.

(A Chef must know how to cook, so a Chef class should 'extend' a Cook class)

### Polymorphism
Gives a class the hability to not only inherit but also modify the inherited properties and methods from its parent class.

The keyword ***@override*** allows the child class to rewrite a property or method from its parent class.

The keyword ***super.*** allows the child class to reuse its parent property or method even after *overriding* it.

## Class Organization Pattern
Some common patterns for organizing private and public parameters and methods within a Dart class:

- Public methods should be placed at the top of the class, followed by private methods. This makes it easy for users of the class to find and use the public methods, which are typically the most important methods for interacting with the class.

- Public variables should also be placed at the top of the class, followed by private variables. This helps users of the class quickly understand the properties of the class and how they can interact with them.

- Private variables and methods should be marked with an underscore (_) prefix. This indicates to other developers that these variables and methods are intended for internal use only and should not be accessed from outside the class.

- Related methods and variables should be grouped together. For example, all methods related to input validation or data manipulation should be grouped together.

- Finally, the constructor should be placed at the top of the class, followed by any other public methods and variables. This makes it clear to users of the class how to create and use instances of the class.

The main goal is to make the class interface as easy to use and understand as possible, while also ensuring that the implementation details of the class are hidden from users of the class.

Example:

publicMethod ()=> 'this is public';
_privateMethod ()=> 'this is private;
publicVariable = 0;
_privateVariable = 0;


