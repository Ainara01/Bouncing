int squaresIndex = 0;
int numberOfSquares = 5;
color backgroundColor;
int maxSquareSize = 100;
Square[] squares = new Square[numberOfSquares];

void setup() {
  size (600,600);
  backgroundColor = color((int)random(256),(int)random(256),(int)random(256),(int)random(256));
  for (int i = 0; i < numberOfSquares; i++) {
    Square square;
    do {
      int size = (int)random(maxSquareSize);
      int x = (int)random(width - maxSquareSize);
      int y = (int)random(height - maxSquareSize);
      square = new Square(size,x,y);
    } while (!canPlace(square));
    
    squares[i] = square;
  }
}
void draw() {
  background(backgroundColor);
  for (Square square : squares) {
    square.update();
  }
}
void mousePressed(){
  if (!squareInPoint(mouseX,mouseY)) {
    squares[squaresIndex % numberOfSquares] = new Square((int)random(100),mouseX,mouseY);
    squaresIndex++;
  }
}
boolean canPlace(Square square) {
  return (square.isWithinBoundaries() && !square.touchesOther());
}
boolean squareWithin(int x, int y) {
  for (Square square : squares) {
    if (square == null) continue;
    if ((x >= (square.xPosition) && x <= (square.xPosition + square.size)) && (y >= (square.yPosition) && y <= (square.yPosition + square.size))) {
      return true;
    }
  }
    return false;
}
boolean squareInPoint(int x, int y) {
  for (Square square : squares) {
    if (square == null) continue;
    if ((x >= (square.xPosition) && x <= (square.xPosition + square.size)) && (y >= (square.yPosition) && y <= (square.yPosition + square.size))) {
      return true;
    }
  }
    return false;
}
class Square {
  int size;
  int xPosition;
  int yPosition;
  int xMovement;
  int yMovement;
 
  Square(){
  }
  
  Square(int size, int x, int y){
    this.size = size;
    this.xPosition = x;
    this.yPosition = y;
    this.xMovement = int(random(4)) + 1;
    this.yMovement = int(random(4)) + 1;
    
    if ((int)(random(2)) == 1) {
      this.xMovement = -this.xMovement;
    }
    
    if ((int)(random(2)) == 1) {
      this.yMovement = -this.yMovement;
    }
  }
  void draw() {
    square(xPosition,yPosition,size);
  }
  
  void update() {
    this.bounceOthers();
    this.boundaryCorrection();
    this.move();
    this.draw();
  }
  void move() {
    xPosition += xMovement;
    yPosition += yMovement;
  }
  
  void bounceOthers() {
    for (Square square : squares) {
      if (square != this) {
        bounce(square);
      }
    }
  }
  
  void bounce(Square square) {
    if (touchesX(square) && isWithinY(square)) {
      xMovement = -xMovement;
    }
    if (touchesY(square) && isWithinX(square)) {
      yMovement = -yMovement;
    }
  }
  
  boolean touchesOther() {
    for (Square square : squares) {
      if (square == null ||square == this) continue;
      if(touchesX(square) || touchesY(square)) {
        return true;
      }
    }
    return false;
  }
  int distanceX(Square square) {
    int distance1 = abs(square.xPosition - (this.xPosition + this.size));
    int distance2 = abs(square.xPosition + square.size - this.xPosition);
    return (min(distance1,distance2));
  }
  int distanceY(Square square) {
    int distance1 = abs(square.yPosition - (this.yPosition + this.size));
    int distance2 = abs(square.yPosition + square.size - this.yPosition);
    return (min(distance1,distance2));
  }
  boolean touchesX(Square square) {
    return (distanceX(square) < this.xMovement);
  }
  boolean touchesY(Square square) {
    return (distanceY(square) < this.yMovement);
  }
  boolean isWithinX(Square square) {
    return (
      (square.xPosition >= this.xPosition && square.xPosition <= this.xPosition + this.size) 
      ||
      (square.xPosition + square.size >= this.xPosition && square.xPosition + square.size <= this.xPosition + this.size)
    );
  }
  boolean isWithinY(Square square) {
    return (
      (square.yPosition >= this.yPosition && square.yPosition <= this.yPosition + this.size)
      ||
      (square.yPosition + square.size >= this.yPosition && square.yPosition + square.size <= this.yPosition + this.size)
    );
  }
  
  
  boolean isWithinBoundaries() {
    return (
    this.xPosition >= 0 && 
    this.xPosition + this.size < width &&
    this.yPosition >= 0 && 
    this.yPosition + this.size < height);
  }
  void boundaryCorrection() {
    
    if (this.xPosition > (width - size)) {
      this.xPosition = (width - size);
      if (this.xMovement > 0) {
        this.xMovement = -xMovement;
      }
    } else if (this.xPosition < (0)) {
      this.xPosition = (0);
      if (this.xMovement < 0) {
        this.xMovement = -xMovement;
      }
    }
    if (this.yPosition > (height - size)) {
      this.yPosition = (height - size);
      if (this.yMovement > 0) {
        this.yMovement = -yMovement;
      }
    } else if (this.yPosition < (0)) {
      this.yPosition = (0);
      if (this.yMovement < 0) {
        this.yMovement = -yMovement;
      }
    }
  }
}
