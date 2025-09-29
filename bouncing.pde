ArrayList<Square> squares = new ArrayList<Square>();
color backgroundColor;
int maxSquareSize;

void setup() {
  size (600,600);
  squares.add(new Square((int)random(50), (int)random(600), (int)random(600)));
  backgroundColor = color((int)random(256),(int)random(256),(int)random(256),(int)random(256));
}
void draw() {
  background(backgroundColor);
  for (Square square : squares) {
    square.update();
  }
}
void mousePressed(){
  if (!squareInPoint(mouseX,mouseY)) {
  squares.add(new Square((int)random(50),mouseX,mouseY));
  }
}

boolean squareInPoint(int x, int y) {
  for (Square square : squares) {
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
    this.xMovement = 2;
    this.yMovement = 2;
  }
  void draw() {
    square(xPosition,yPosition,size);
  }
  
  void update() {
    this.boundaryCorrection();
    this.move();
    this.draw();
  }
  void move() {
    xPosition += xMovement;
    yPosition += yMovement;
  }
  
  void boundaryCorrection() {
    if (this.xPosition > (600 - size)) {
      this.xPosition = (600 - size);
      if (this.xMovement > 0) {
        this.xMovement = -xMovement;
      }
    } else if (this.xPosition < (0)) {
      this.xPosition = (0);
      if (this.xMovement < 0) {
        this.xMovement = -xMovement;
      }
    }
    if (this.yPosition > (600 - size)) {
      this.yPosition = (600 - size);
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
