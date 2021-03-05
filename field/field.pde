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

PShape createCircle(float radius) {

  PShape shape = createShape(ELLIPSE, 0, 0, radius, radius);  // First we make the PShape
  return shape;
}

PShape createRect(float height) {

  PShape shape = createShape(RECT, -height/2, -height/2, height, height);  // First we make the PShape
  return shape;
}

PShape createHalfRect(float height) {

  PShape shape = createShape(RECT, -height/2, -height/2, height, height/2);  // First we make the PShape
  return shape;
}

color randColor() {
  color[] colors = new color[6];
  colors[0] =  color(255, 0, 0);
  colors[1] =  color(0, 255, 0);
  colors[2] =  color(0, 0, 255);
  colors[3] =  color(255, 255, 0);
  colors[4] =  color(255, 0, 255);
  colors[5] =  color(0, 255, 255);
  return colors[int(random(6))];
}

void setup() {
  fill(black);
  fillGrid(50, 90);
  size(400, 400);
  noStroke();
  rectMode(CENTER);
}

void draw() {
  tick++;
  background(black);
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
    p = new Polygon(selectShape());
  }

  PShape selectShape() {
    fill(randColor());
    float r = random(3);
    if (r < 1) {
      return createCircle(side / 2);
    }
    if (r < 2) {
      return createRect(side / 2);
    }
    return createHalfRect(side / 2);
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
