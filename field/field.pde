color black = color(0, 0, 0);

float c = 0.0;
int canvasSize = 400;
int spacing = 50;
int gap = 0;
int rows = (canvasSize / spacing) + 1;
int cols = (canvasSize / spacing) + 1;
int cellSize = spacing - gap;

Cell[][] grid = new Cell[rows][cols];

int tick = 0;
int frames = 0;
int maxFrames = 180;

boolean record = false;
boolean stop = false;

int colorCount = 8;
color[] colors = new color[colorCount];

class Polygon {
  PShape s;

  Polygon(PShape _s) {
    s = _s;
  }
  void display() {
    shape(s);
  }
}

PShape createCircle(float radius) {

  PShape shape = createShape(ELLIPSE, 0, 0, radius, radius);
  return shape;
}

PShape createSmallCircle(float radius) {

  PShape shape = createShape(ELLIPSE, -radius/4, -radius/4, radius/2, radius/2);
  return shape;
}

PShape createTwoSmallCircle(float radius) {

  PShape g = createShape(GROUP);
  PShape one = createShape(ELLIPSE, -radius/4, -radius/4, radius/2, radius/2);
  g.addChild(one);
  PShape two = createShape(ELLIPSE, -radius/4, +radius/4, radius/2, radius/2);
  g.addChild(two);
  return g;
}

PShape createThreeSmallCircle(float radius) {

  PShape g = createShape(GROUP);
  PShape one = createShape(ELLIPSE, -radius/4, -radius/4, radius/2, radius/2);
  g.addChild(one);
  PShape two = createShape(ELLIPSE, -radius/4, +radius/4, radius/2, radius/2);
  g.addChild(two);
  PShape three = createShape(ELLIPSE, +radius/4, -radius/4, radius/2, radius/2);
  g.addChild(three);
  return g;
}

PShape createRect(float height) {

  PShape shape = createShape(RECT, -height/2, -height/2, height, height);
  return shape;
}

PShape createHalfRect(float height) {

  PShape shape = createShape(RECT, -height/2, -height/2, height, height/2);
  return shape;
}

PShape createQrtrRect(float height) {

  PShape shape = createShape(RECT, -height/2, -height/2, height/2, height/2);
  return shape;
}

PShape createTwoQrtrRect(float height) {

  PShape g = createShape(GROUP);
  PShape one = createShape(RECT, -height/2, -height/2, height/2, height/2);
  g.addChild(one);
  PShape two = createShape(RECT, 0, 0, height/2, height/2);
  g.addChild(two);
  return g;
}

void populateColors() {
  colorMode(HSB, 100, 100, 100, 100);
  float s = random(100);
  float v = random(100);

  for (int i = 0; i < colorCount; i++) {
    colors[i] =  color(random(100), s, v);
  };
}

color randColor() {
  return colors[int(random(colorCount))];
}

void setup() {
  populateColors();
  fill(black);
  fillGrid(spacing, cellSize);
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
      grid[i][j] = new Cell(0 + (i * spacing), 0 + (j * spacing), length);
    }
  }
}

class Cell {
  int x;
  int y;
  float rot;
  float side;
  Polygon p;

  Cell(int ix, int iy, float iside) {
    x = ix;
    y = iy;
    rot = int(random(4)) * HALF_PI;
    side = iside;
    p = new Polygon(selectShape());
  }

  PShape selectShape() {
    fill(randColor());
    int r = int(random(8));
    switch (r) {
      case 0:
        return createCircle(side);
      case 1:
        return createRect(side);
      case 2:
        return createHalfRect(side);
      case 3:
        return createQrtrRect(side);
      case 4:
        return createSmallCircle(side);
      case 5:
        return createTwoSmallCircle(side);
      case 6:
        return createThreeSmallCircle(side);
      case 7:
        return createTwoQrtrRect(side);
      default:
        return createCircle(side/2);
    }
  }

  void display() {
    push();
    translate(x, y);
    rotate(rot);
    //translate(0, tick * rot);
    //rotate(ang*4.0);
    //scale(sin(ang));
    // rect(0, 0, side, side);
    p.display();
    pop();
  }
}

