import 'dart:io';
import 'dart:math';

// Terminal dimensions
int width = stdout.terminalColumns;
int height = stdout.terminalLines - 2;  // Subtract 2 for top/bottom border

// Lizard position and food position
int lizardX = width ~/ 2;
int lizardY = height ~/ 2;
int foodX = (width > 6) ? Random().nextInt(width - 6) + 3 : 3;
int foodY = (height > 6) ? Random().nextInt(height - 6) + 3 : 3;


// Current direction: "up", "down", "left", "right"
String direction = "right";

// Lizard body length
int bodyLength = 4;  // Start with a body length of 4

// Function to draw the game board with a full-terminal box
void drawBoard() {
  // Top border
  stdout.write('+' + '-' * (width - 2) + '+\n');

  for (int y = 0; y < height; y++) {
    stdout.write('|'); // Left border
    for (int x = 0; x < width - 2; x++) {
      // Lizard head
      if (y == lizardY && x == lizardX) {
        stdout.write("0");
      }
      // Lizard body (wide horizontal)
      else if ((y == lizardY + 1 || y == lizardY + 4) && (x >= lizardX - (bodyLength ~/ 2) && x <= lizardX + (bodyLength ~/ 2))) {
        stdout.write("*");
      }
      // Lizard vertical parts
      else if ((y == lizardY + 2 || y == lizardY + 3 || y == lizardY + 5) && x == lizardX) {
        stdout.write("*");
      }
      // Legs of the lizard
      // else if ((y == lizardY + 1 || y == lizardY + 2) && (x == lizardX - (bodyLength ~/ 2) || x == lizardX + (bodyLength ~/ 2))) {
      //   stdout.write("▣");
      // }
      // Food
      else if (x == foodX && y == foodY) {
        stdout.write('🍎');
      }
      // Empty space
      else {
        stdout.write(' ');
      }
    }
    stdout.write('|\n'); // Right border
  }

  // Bottom border
  stdout.write('+' + '-' * (width - 2) + '+\n');
}

// Function to update the lizard's direction based on the food's location
void updateDirection() {
  if (foodX > lizardX) {
    direction = "right";
  } else if (foodX < lizardX) {
    direction = "left";
  } else if (foodY < lizardY) {
    direction = "up";
  } else if (foodY > lizardY) {
    direction = "down";
  }
}

// Move lizard closer to food
void moveLizard() {
  if (direction == "right") {
    lizardX++;
  } else if (direction == "left") {
    lizardX--;
  } else if (direction == "up") {
    lizardY--;
  } else if (direction == "down") {
    lizardY++;
  }

  // Ensure the lizard stays within the borders
  if (lizardX >= width - 2) lizardX = width - 3;
  if (lizardX < 1) lizardX = 1;
  if (lizardY >= height - 1) lizardY = height - 2;
  if (lizardY < 0) lizardY = 0;
}

// Check if the lizard has reached the food
bool isFoodEaten() {
  return lizardX == foodX && lizardY == foodY;
}

// Generate new food position
void spawnFood() {
  if (width > 6 && height > 6) {
    // Jika ukuran terminal cukup besar, generate posisi makanan
    foodX = Random().nextInt(width - 6) + 3;
    foodY = Random().nextInt(height - 6) + 3;
  } else {
    // Jika ukuran terminal terlalu kecil, tempatkan makanan di posisi default
    foodX = 3;
    foodY = 3;
  }
}


// Main function
void main() {
  while (true) {
    // Update the lizard's direction
    updateDirection();

    // Move the lizard
    moveLizard();

    // Check if the lizard has eaten the food
    if (isFoodEaten()) {
      spawnFood();
      bodyLength++; // Increase body length when food is eaten
    }

    // Clear terminal and draw game board
    stdout.write("\x1B[2J\x1B[H"); // Clear screen and move cursor to top-left corner

    // Draw the game board
    drawBoard();

    // Wait a bit
    sleep(Duration(milliseconds: 300)); // Control speed
  }
}
