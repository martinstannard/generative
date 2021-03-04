color red = color(255, 0, 0);
color blue = color(0, 0, 255);
color black = color(0, 0, 0);
color white = color(255, 255, 255);

float c = 0.0;
int rows = 10;
int cols = 10;
int side = 400;
Cell[][] grid = new Cell[rows][cols];

int tick = 0;
int frames = 0;
int maxFrames = 180;

boolean record = false;
boolean stop = true;

void setup() {
  fill(black);
  fillGrid(50, 45);
  size(400, 400);
  noStroke();
  rectMode(CENTER);
}

void draw() {
  tick++;
  background(white);
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      grid[i][j].display();
//      grid[i][j].move();
    }
  }
  if (record) {
    saveFrame("#####.png");
  }
  frames++;
  if (stop && frames > maxFrames) {
    exit();
  }
}

void fillGrid(int spacing, int length) {
  float dir = 1.0;
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      if (j % 2 == 0) {
        dir = dir * -1.0;
      }
      grid[i][j] = new Sqr(0 + (i * spacing), 0 + (j * spacing), dir, length);
    }
  }
}

class Cell {
  int x;
  int y;
  float rot;
  float ang;
  float side;

  Sqr(int ix, int iy, float irot, float iside) {
    x = ix;
    y = iy;
    rot = irot;
    side = iside;
    ang = 0.0;
  }

  void move() {
    ang += rot;
  }

  void display() {
    push();
    translate(x, y);
    log(tick);
    translate(0, tick * rot);
    //rotate(ang*4.0);
    //scale(sin(ang));
    rect(0, 0, side, side);
    pop();
  }
}

class Circle {

}

class Triangle {

}

class Rectangle {

}

class Colourer {

}
