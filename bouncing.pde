Square square;
color backgroundColor;

void setup() {
  size (600,600);
  square = new Square((int)random(50), (int)random(600), (int)random(600));
  backgroundColor = color((int)random(256),(int)random(256),(int)random(256),(int)random(256));
}
void draw() {
  background(backgroundColor);
  square.draw();
}


class Square {
  int size;
  int xPosition;
  int yPosition;
  int xMovement;
  int yMovement;
  
  Square(int size, int x, int y){
    this.size = size;
    this.xPosition = x;
    this.yPosition = y;
    this.xMovement = 2;
    this.yMovement = 2;
  }
  void draw() {
    update();
    square(xPosition,yPosition,size);
    xPosition += xMovement;
    yPosition += yMovement;
  }
  
  void update() {
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
