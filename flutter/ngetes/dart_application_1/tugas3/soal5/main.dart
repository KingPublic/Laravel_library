import 'dart:io';
import 'soal5.dart';

void main() {
  print("input your dog name : ");
  String? namalu = stdin.readLineSync();
  print("Input your cat name : ");
  String? namalujuga = stdin.readLineSync();

  Dog dog = Dog(name: '$namalu');
  dog.sound();
  dog.eat();
  dog.fetch();

  Cat cat = Cat(name: '$namalujuga');
  cat.sound();
  cat.eat();
  cat.scratch();
}