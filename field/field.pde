color bg;

float c = 0.0;
int canvasSize = 400;
int spacing = 80;
int gap = 5;
int rows = (canvasSize / spacing) + 1;
int cols = (canvasSize / spacing) + 1;
int cellSize = spacing - gap;
int groupCount = 3;

Cell[][] grid = new Cell[rows][cols];

int tick = 0;
int frames = 0;
int maxFrames = 4;

boolean record = true;
boolean stop = true;

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

PShape circle(float radius) {

  PShape shape = createShape(ELLIPSE, 0, 0, radius, radius);
  shape.setFill(randColor());
  return shape;
}

PShape halfCircle(float radius) {

  PShape g = createShape(GROUP);
  PShape c = createShape(ELLIPSE, 0, 0, radius, radius);
  g.addChild(c);
  c.setFill(randColor());
  PShape r = createShape(RECT, -radius/2-1, -radius/2-1, radius+1, radius/2+1);
  g.addChild(r);
  r.setFill(bg);
  return g;
}

PShape twoQrtrCircle(float radius) {

  PShape g = createShape(GROUP);
  PShape c = createShape(ELLIPSE, 0, 0, radius, radius);
  g.addChild(c);
  c.setFill(randColor());
  PShape b1 = createShape(RECT, -radius/2-1, -radius/2-1, radius/2+1, radius/2+1);
  g.addChild(b1);
  b1.setFill(bg);
  PShape b2 = createShape(RECT, 0, 0, radius/2+1, radius/2+1);
  g.addChild(b2);
  b2.setFill(bg);
  return g;
}

PShape qrtrCircle(float radius) {

  PShape g = createShape(GROUP);
  PShape c = createShape(ELLIPSE, 0, 0, radius, radius);
  g.addChild(c);
  c.setFill(randColor());
  PShape b1 = createShape(RECT, -radius/2-1, -radius/2-1, radius+1, radius/2+1);
  g.addChild(b1);
  b1.setFill(bg);
  PShape b2 = createShape(RECT, 0, 0, radius/2+1, radius/2+1);
  g.addChild(b2);
  b2.setFill(bg);
  return g;
}

PShape createSmallCircle(float radius) {

  PShape shape = createShape(ELLIPSE, -radius/4, -radius/4, radius/2, radius/2);
  shape.setFill(randColor());
  return shape;
}

PShape createTwoSmallCircle(float radius) {

  color c = randColor();
  PShape g = createShape(GROUP);
  PShape one = createShape(ELLIPSE, -radius/4, -radius/4, radius/2, radius/2);
  g.addChild(one);
  one.setFill(c);
  PShape two = createShape(ELLIPSE, -radius/4, +radius/4, radius/2, radius/2);
  g.addChild(two);
  two.setFill(c);
  return g;
}

PShape twoOpCircs(float radius) {

  color c = randColor();
  PShape g = createShape(GROUP);
  PShape one = createShape(ELLIPSE, -radius/4, -radius/4, radius/2, radius/2);
  g.addChild(one);
  one.setFill(c);
  PShape two = createShape(ELLIPSE, +radius/4, +radius/4, radius/2, radius/2);
  g.addChild(two);
  two.setFill(c);
  return g;
}

PShape createThreeSmallCircle(float radius) {

  color c = randColor();
  PShape g = createShape(GROUP);
  PShape one = createShape(ELLIPSE, -radius/4, -radius/4, radius/2, radius/2);
  g.addChild(one);
  one.setFill(c);
  PShape two = createShape(ELLIPSE, -radius/4, +radius/4, radius/2, radius/2);
  g.addChild(two);
  two.setFill(c);
  PShape three = createShape(ELLIPSE, +radius/4, -radius/4, radius/2, radius/2);
  g.addChild(three);
  three.setFill(c);
  return g;
}

PShape createRect(float size) {

  PShape shape = createShape(RECT, -size/2, -size/2, size, size);
  shape.setFill(randColor());
  return shape;
}

PShape createHalfRect(float height) {

  PShape shape = createShape(RECT, -height/2, -height/2, height, height/2);
  shape.setFill(randColor());
  return shape;
}

PShape createQrtrRect(float height) {

  PShape shape = createShape(RECT, -height/2, -height/2, height/2, height/2);
  shape.setFill(randColor());
  return shape;
}

PShape createTwoQrtrRect(float height) {

  color c = randColor();
  PShape g = createShape(GROUP);
  PShape one = createShape(RECT, -height/2, -height/2, height/2, height/2);
  g.addChild(one);
  one.setFill(c);
  PShape two = createShape(RECT, 0, 0, height/2, height/2);
  g.addChild(two);
  two.setFill(c);
  return g;
}

void populateColors() {
  colorMode(HSB, 100, 100, 100, 100);
  colors[0] =  color(random(100), random(0, 50), random(0, 30));
  float h = random(100);
  float jump = random(3, 20);
  for (int i = 1; i < colorCount; i++) {
    float s = random(30, 90);
    float v = random(50, 80);
    colors[i] =  color(h, s, v);
    h = (h + jump) % 100.0;
  };
}

color randColor() {
  return colors[int(random(colorCount - 1)) + 1];
}

void keyPressed() {
  if (key == 0x41) {
    populateColors();
    fillGrid(spacing, cellSize);
  }
}
void setup() {
  populateColors();
  bg = colors[0];
  noStroke();
  fill(bg);
  smooth(2);
  fillGrid(spacing, cellSize);
  size(400, 400);
  rectMode(CENTER);
}

void draw() {
  background(bg);
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      grid[i][j].display();
    }
  }
  if (record) {
    saveFrame("######.png");
  }
  if (stop && frames == maxFrames - 1) {
    exit();
  }
  frames++;
  tick++;
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
  int dir;
  float rot;
  float side;
  Polygon p;

  Cell(int ix, int iy, float iside) {
    x = ix;
    y = iy;
    rot = int(random(4)) * HALF_PI;
    dir = int(random(3)) - 1;
    side = iside;
    p = new Polygon(grouper());
  }

  PShape grouper() {
    color c = randColor();
    PShape g = createShape(GROUP);
    for(int i = 0; i < groupCount; i++) {
      PShape s = selectShape();
      g.addChild(s);
    }
    return g;
  }

  PShape selectShape() {
    int r = int(random(13));
    switch (r) {
      case 0:
        return circle(side);
      case 1:
        return halfCircle(side);
      case 2:
        return createSmallCircle(side);
      case 3:
        return createTwoSmallCircle(side);
      case 4:
        return createThreeSmallCircle(side);
      case 5:
        return twoOpCircs(side);
      case 6:
        return qrtrCircle(side);
      case 7:
        return createRect(side);
      case 8:
        return createHalfRect(side);
      case 9:
        return createTwoQrtrRect(side);
      case 10:
        return createQrtrRect(side);
      case 11:
        return twoQrtrCircle(side);
      case 12:
        return qrtrCircle(side);
      default:
        return circle(side);
    }
  }

  void display() {
    push();
    translate(x, y);
    rotate(rot * dir);
    rot += HALF_PI;
    // if (tick % 10 == 0) {
    // }
    //translate(0, tick * rot);
    //rotate(ang*4.0);
    //scale(sin(ang));
    // rect(0, 0, side, side);
    p.display();
    pop();
  }
}

