import 'dart:io';
import 'Color.dart' as color;
import 'dart:async';

class Node {
  String? data;
  Node? next;

  Node(this.data);
}

Future<void> delay(int milliseconds) async {
  await Future.delayed(Duration(milliseconds: milliseconds));
}

void moveTo(int row, int col) {
  stdout.write('\x1B[${row};${col}H');
}

getScreenSize() {
  return [stdout.terminalColumns, stdout.terminalLines];
}

void clearScreen() {
  print("\x1B[2J\x1B[0;0H");
}

Node insertNodeAtPosition(Node head, Node newNode, int position) {
  if (position == 1) {
    newNode.next = head;
    return newNode;
  }

  Node? currentNode = head;
  int i = 1;
  if (position != 0) {
    while (currentNode!.next != null && i < position - 1) {
      currentNode = currentNode.next;
      i++;
    }
  } else {
    while (currentNode!.next != null) {
      currentNode = currentNode.next;
      i++;
    }
  }

  newNode.next = currentNode.next;
  currentNode.next = newNode;

  return head;
}

Node activateLoop(Node head) {
  Node? currentNode = head;
  while (currentNode!.next != null) {
    currentNode = currentNode.next;
  }
  currentNode.next = head;
  return head;
}

Node craft(String userInput) {
  if (userInput.isEmpty) {
    userInput = "Andrey"; // Default text if user input is empty
  }
  
  Node head = Node(userInput[0]);
  for (int i = 1; i < userInput.length; i++) {
    insertNodeAtPosition(head, Node(userInput[i]), 0);
  }
  activateLoop(head);
  return head;
}

Node? getNext(Node node) {
  return node.next;
}

Future<void> animateText(Node head) async {
  String selectedColor = color.RESET;
  while (true) {
    Node? node = null;
    stdout.write(selectedColor);
    for (int j = 1; j <= getScreenSize()[1]; j++) {
      if (node == null) {
        node = head;
      }
      if (j % 2 != 0) {
        for (int i = 1; i <= getScreenSize()[0]; i++) {
          moveTo(j, i);
          stdout.write(node!.data);
          node = getNext(node)!;
          await delay(10);
        }
      } else {
        for (int i = getScreenSize()[0]; i > 0; i--) {
          moveTo(j, i);
          stdout.write(node!.data);
          node = getNext(node)!;
          await delay(10);
        }
      }
    }
    selectedColor = color.getRandomColor(selectedColor);
  }
}

void main() async {
  while (true) {
    clearScreen();
    stdout.write("Enter the text you want to animate (or 'exit' to quit): ");
    String? userInput = stdin.readLineSync()?.toUpperCase();
    
    if (userInput == null || userInput.toLowerCase() == 'exit') {
      clearScreen();
      print("Goodbye!");
      break;
    }

    Node head = craft(userInput);
    clearScreen();
    
    try {
      await animateText(head);
    } catch (e) {
      // Handle any potential errors during animation
      print("Animation interrupted. Press Enter to continue...");
      stdin.readLineSync();
    }
  }
}