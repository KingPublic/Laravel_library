import 'dart:io';

class Animal {
  String name;

  Animal({required this.name});

  void sound() {
    print('$name makes a sound.');
  }

  void eat() {
    print('$name is eating.');
  }
}

class Dog extends Animal {
  Dog({required String name}) : super(name: name);

  @override
  void sound() {
    print('$name barks.');
  }

  void fetch() {
    print('$name is fetching.');
  }
}

class Cat extends Animal {
  Cat({required String name}) : super(name: name);

  @override
  void sound() {
    print('$name meows.');
  }

  void scratch() {
    print('$name is scratching.');
  }
}

