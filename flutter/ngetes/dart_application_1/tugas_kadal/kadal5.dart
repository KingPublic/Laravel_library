import 'dart:io';
import 'dart:math';

// Terminal dimensions
int width = stdout.terminalColumns;
int height = stdout.terminalLines - 2;  // Subtract 2 for top/bottom border

// Initial lizard body structure (centered)
List<List<int>> lizard = [
  [width ~/ 2, height ~/ 2],            // Head (0)
  [width ~/ 2 - 4, height ~/ 2 + 1],    // Horizontal body part (left side)
  [width ~/ 2 - 3, height ~/ 2 + 1],
  [width ~/ 2 - 2, height ~/ 2 + 1],
  [width ~/ 2 - 1, height ~/ 2 + 1],
  [width ~/ 2, height ~/ 2 + 1],        // Center horizontal (under head)
  [width ~/ 2 + 1, height ~/ 2 + 1],
  [width ~/ 2 + 2, height ~/ 2 + 1],
  [width ~/ 2 + 3, height ~/ 2 + 1],
  [width ~/ 2 + 4, height ~/ 2 + 1],    // End of horizontal body part
];
int foodX = Random().nextInt(width - 6) + 3;
int foodY = Random().nextInt(height - 6) + 3;

// Current direction: "up", "down", "left", "right"
String direction = "right";

// Function to draw the game board with a full-terminal box
void drawBoard() {
  // Top border
  stdout.write('+' + '-' * (width - 2) + '+\n');

  for (int y = 0; y < height; y++) {
    stdout.write('|'); // Left border
    for (int x = 0; x < width - 2; x++) {
      // Check if the lizard is at this position
      bool isLizard = false;
      bool isLeg = false;
      
      for (int i = 0; i < lizard.length; i++) {
        if (lizard[i][0] == x && lizard[i][1] == y) {
          // Lizard head
          if (i == 0) {
            stdout.write("0");
          } else {
            // Lizard body
            stdout.write("*");
          }
          isLizard = true;
          break;
        }
        // Check for legs
        // Legs should be on both sides of the body (x-1 for left, x+1 for right) at every alternate body segment
        if (y == lizard[i][1] && (x == lizard[i][0] - 1 || x == lizard[i][0] + 1) && i % 3 == 0 && i < 5) {
          stdout.write("L");
          isLeg = true;
          break;
        }
      }
      if (!isLizard && !isLeg) {
        // Check for food
        if (x == foodX && y == foodY) {
          stdout.write('🍎');
        } else {
          // Empty space
          stdout.write(' ');
        }
      }
    }
    stdout.write('|\n'); // Right border
  }

  // Bottom border
  stdout.write('+' + '-' * (width - 2) + '+\n');
}

// Function to update the lizard's direction based on the food's location
void updateDirection() {
  if (foodX > lizard[0][0]) {
    direction = "right";
  } else if (foodX < lizard[0][0]) {
    direction = "left";
  } else if (foodY < lizard[0][1]) {
    direction = "up";
  } else if (foodY > lizard[0][1]) {
    direction = "down";
  }
}

// Move lizard closer to food
void moveLizard() {
  // Get current head position
  int newHeadX = lizard[0][0];
  int newHeadY = lizard[0][1];

  if (direction == "right") {
    newHeadX++;
  } else if (direction == "left") {
    newHeadX--;
  } else if (direction == "up") {
    newHeadY--;
  } else if (direction == "down") {
    newHeadY++;
 }

  // Ensure the lizard stays within the borders
  if (newHeadX >= width - 2) newHeadX = width - 3;
  if (newHeadX < 1) newHeadX = 1;
  if (newHeadY >= height - 1) newHeadY = height - 2;
  if (newHeadY < 0) newHeadY = 0;

  // Check for collision with itself (game over condition)
  for (int i = 1; i < lizard.length; i++) {
    if (lizard[i][0] == newHeadX && lizard[i][1] == newHeadY) {
      print("Game Over! You ran into yourself.");
      exit(0);  // Exit the game
    }
  }

  // Move lizard's head to the new position
  lizard.insert(0, [newHeadX, newHeadY]);

  // If food is not eaten, remove the last part (tail)
  if (!isFoodEaten()) {
    lizard.removeLast();
  }
}

// Check if the lizard has reached the food
bool isFoodEaten() {
  return lizard[0][0] == foodX && lizard[0][1] == foodY;
}

// Generate new food position
void spawnFood() {
  foodX = Random().nextInt(width - 6) + 3;
  foodY = Random().nextInt(height - 6) + 3;
}

// Add new part to the tail of the lizard body
void addTailPart() {
  List<int> lastPart = lizard.last;
  lizard.add([lastPart[0], lastPart[1]]);
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
      // Add a new part to the tail of the lizard's body
      addTailPart(); 
    }

    // Clear terminal and draw game board
    stdout.write("\x1B[2J\x1B[H"); // Clear screen and move cursor to top-left corner

    // Draw the game board
    drawBoard();

    // Wait a bit
    sleep(Duration(milliseconds: 300)); // Control speed
  }
}