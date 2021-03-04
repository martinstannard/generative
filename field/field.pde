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

class Polygon {
  PShape s;

  Polygon(PShape _s) {
    s = _s;
  }
  void display() {
    shape(s);
  }
}
Polygon poly;                   // An object of type Polygon

PShape createStar() {

  PShape star = createShape();  // First we make the PShape
  star.beginShape();
  star.noStroke();
  star.fill(0, 127);
  star.vertex(0, -50);
  star.vertex(14, -20);
  star.vertex(47, -15);
  star.vertex(23, 7);
  star.vertex(29, 40);
  star.vertex(0, 25);
  star.vertex(-29, 40);
  star.vertex(-23, 7);
  star.vertex(-47, -15);
  star.vertex(-14, -20);
  star.endShape(CLOSE);

  // Make the Polygon object by passing in the reference to the PShape
  //poly = new Polygon(star);
  return star;
}

void setup() {
  fill(black);
  fillGrid(50, 45);
  size(400, 400);
  noStroke();
  rectMode(CENTER);
  //createStar();
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
      grid[i][j] = new Cell(0 + (i * spacing), 0 + (j * spacing), dir, length);
    }
  }
}

class Cell {
  int x;
  int y;
  float rot;
  float ang;
  float side;
  Polygon p;

  Cell(int ix, int iy, float irot, float iside) {
    x = ix;
    y = iy;
    rot = irot;
    side = iside;
    ang = 0.0;
    //p = createStar();
    p = new Polygon(createStar());
  }

  void move() {
    ang += rot;
  }

  void display() {
    push();
    translate(x, y);
    //translate(0, tick * rot);
    //rotate(ang*4.0);
    //scale(sin(ang));
    // rect(0, 0, side, side);
    p.display();
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
