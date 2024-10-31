import 'dart:io';
import 'dart:math';

// Terminal width and height
int width = stdout.terminalColumns;  // Adjust width based on terminal size
int height = stdout.terminalLines; // Adjust height based on terminal size

// Lizard starting position and food position
int lizardX = width ~/ 2;
int lizardY = height ~/ 2;
int foodX = Random().nextInt(width - 6) + 3; // Food constrained within lizard movement area
int foodY = Random().nextInt(height - 6) + 3; 

// Function to draw the game board with a large lizard and food
void drawBoard() {
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      // Lizard structure
      if (y == lizardY && x == lizardX) {
        stdout.write("0"); // Lizard head
      } else if ((y == lizardY + 1 || y == lizardY + 4) && (x >= lizardX - 3 && x <= lizardX + 3)) {
        stdout.write("*"); // Lizard body (horizontal line)
      } else if ((y == lizardY + 2 || y == lizardY + 3 || y == lizardY + 5) && x == lizardX) {
        stdout.write("*"); // Lizard vertical part (legs and body)
      } else if (x == foodX && y == foodY) {
        stdout.write("!"); // Food symbol
      } else {
        stdout.write(' '); // Empty space for filling the terminal
      }
    }
    stdout.writeln();
  }
}

// Move lizard closer to food
void moveLizard() {
  if (lizardX < foodX) {
    lizardX++;
  } else if (lizardX > foodX) {
    lizardX--;
  }
  if (lizardY < foodY) {
    lizardY++;
  } else if (lizardY > foodY) {
    lizardY--;
  }
}

// Check if the lizard has reached the food
bool isFoodEaten() {
  return lizardX == foodX && lizardY == foodY;
}

// Generate new food position
void spawnFood() {
  foodX = Random().nextInt(width - 6) + 3;
  foodY = Random().nextInt(height - 6) + 3;
}

void main() {
  while (true) {
    // Don't clear terminal, just redraw
    stdout.write("\x1B[H"); // ANSI escape code to move cursor to top-left corner

    // Draw the game board
    drawBoard();

    // Move the lizard
    moveLizard();

    // Check if the lizard has eaten the food
    if (isFoodEaten()) {
      spawnFood();
    }

    // Wait a bit
    sleep(Duration(milliseconds: 500));
  }
}
