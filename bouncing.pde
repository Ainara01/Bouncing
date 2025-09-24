Square square;
color backgroundColor;

void setup() {
  size (600,600);
  square = new Square((int)random(50));
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
  
  Square(int size){
    this.size = size;
    this.xPosition = width/2;
    this.yPosition = 0;
  }
  void draw() {
    square(xPosition,yPosition,size);
    yPosition++;
  }
}
