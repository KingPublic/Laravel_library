import 'dart:io';
import 'Color.dart' as color;
import 'dart:async';

class Node {
  String? data;
  Node? next;

  Node(this.data);
}

Future<void> waitFor(int milliseconds) async {
  await Future.delayed(Duration(milliseconds: milliseconds));
}

void moveCursorTo(int row, int col) {
  stdout.write('\x1B[${row};${col}H');
}

getTerminalSize() {
  return [stdout.terminalColumns, stdout.terminalLines];
}

void resetScreen() {
  print("\x1B[2J\x1B[0;0H");
}

Node addNodeAtPosition(Node head, Node newNode, int position) {
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

Node createLoop(Node head) {
  Node? currentNode = head;
  while (currentNode!.next != null) {
    currentNode = currentNode.next;
  }
  currentNode.next = head;
  return head;
}

Node buildNodeChain(String userInput) {
  if (userInput.isEmpty) {
    userInput = "Andrey"; // Default text if user input is empty
  }

  Node head = Node(userInput[0]);
  for (int i = 1; i < userInput.length; i++) {
    addNodeAtPosition(head, Node(userInput[i]), 0);
  }
  createLoop(head);
  return head;
}

Node? fetchNextNode(Node node) {
  return node.next;
}

Future<void> displayAnimatedText(Node head) async {
  String selectedColor = color.RESET;
  while (true) {
    Node? node = null;
    stdout.write(selectedColor);
    for (int row = 1; row <= getTerminalSize()[1]; row++) {
      if (node == null) {
        node = head;
      }
      if (row % 2 != 0) {
        for (int col = 1; col <= getTerminalSize()[0]; col++) {
          moveCursorTo(row, col);
          stdout.write(node!.data);
          node = fetchNextNode(node)!;
          await waitFor(10);
        }
      } else {
        for (int col = getTerminalSize()[0]; col > 0; col--) {
          moveCursorTo(row, col);
          stdout.write(node!.data);
          node = fetchNextNode(node)!;
          await waitFor(10);
        }
      }
    }
    selectedColor = color.getRandomColor(selectedColor);
  }
}

void main() async {
  while (true) {
    resetScreen();
    stdout.write("Enter the text you want to animate (or 'exit' to quit): ");
    String? userInput = stdin.readLineSync()?.toUpperCase();

    if (userInput == null || userInput.toLowerCase() == 'exit') {
      resetScreen();
      print("Goodbye!");
      break;
    }

    Node head = buildNodeChain(userInput);
    resetScreen();

    try {
      await displayAnimatedText(head);
    } catch (e) {
      // Handle any potential errors during animation
      print("Animation interrupted. Press Enter to continue...");
      stdin.readLineSync();
    }
  }
}
