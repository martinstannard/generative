import nice.palettes.*;

ColorPalette palette;

color bg;

float c = 0.0;
int pixels = 5000;
int canvasSize = 5000;
int count = int(random(12)) + 1;
// int[] spacings = {200, 100, 50, 80, 40, 25};
int[] sides = {2, 3, 4, 5, 8, 10, 20, 25};
//int[] spacings = {50, 100, 200, 400, 500, 1000, 1250, 2500, 5000};
//int[] spacings = {56, 60, 70, 84, 105, 120,140, 168, 210, 280, 420};
//int[] spacings = {20, 21, 24, 28, 30, 35, 40, 42, 56, 60, 70, 84, 105, 120, 140, 168, 210, 280, 420};
// int spacing = spacings[int(random(9))];
int side = sides[int(random(sides.length))];
int gap = int(random(8)) + 2;
int spacing = cellSpacing(side, canvasSize);
int rows = (canvasSize / spacing) + 1;
int cols = (canvasSize / spacing) + 1;
int cellSize = spacing - gap;
int groupCount = int(random(3)) + 1;

Cell[][] grid = new Cell[rows][cols];
int tick = 0;
int frames = 0;
int maxFrames = 1;

boolean record = true;
boolean stop = true;

int colorCount = 5;
color[] colors = new color[colorCount];

int cellSpacing(int sides, int canvasSize) {
  return (canvasSize /  sides);
}

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
  PShape r = createShape(RECT, -radius/2-2, -radius/2-2, radius/2+2, radius/2+2);
  g.addChild(r);
  r.setFill(bg);
  return g;
}

PShape twoQrtrCircle(float radius) {

  PShape g = createShape(GROUP);
  PShape c = createShape(ELLIPSE, 0, 0, radius, radius);
  g.addChild(c);
  c.setFill(randColor());
  PShape b1 = createShape(RECT, -radius/2-2, -radius/2-2, radius/2+2, radius/2+2);
  g.addChild(b1);
  b1.setFill(bg);
  PShape b2 = createShape(RECT, 0, 0, radius/2+2, radius/2+2);
  g.addChild(b2);
  b2.setFill(bg);
  return g;
}

PShape qrtrCircle(float radius) {

  PShape g = createShape(GROUP);
  PShape c = createShape(ELLIPSE, 0, 0, radius, radius);
  g.addChild(c);
  c.setFill(randColor());
  PShape b1 = createShape(RECT, -radius/2-2, -radius/2-2, radius/2+2, radius/2+2);
  g.addChild(b1);
  b1.setFill(bg);
  PShape b2 = createShape(RECT, 0, 0, radius/2+2, radius/2+2);
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

PShape halfTriangle(float size) {
  PShape shape = createShape(TRIANGLE, -size/2, -size/2, size/2, size/2, size/2, -size/2);
  shape.setFill(randColor());
  return shape;
}

PShape qtrTriangle(float size) {
  PShape shape = createShape(TRIANGLE, -size/2, -size/2, 0, 0, size/2, -size/2);
  shape.setFill(randColor());
  return shape;
}

PShape empty(float size) {

  PShape g = createShape(GROUP);
  return g;
}
/// END OF SHAPES

void populateColors() {
  //colorMode(HSB, 100, 100, 100, 100);
  //colors[0] =  color(random(100), random(20, 50), random(0, 100));
  //colorMode(RGB, 100 ,100, 100);
  //colors[0] =  color(100, 100, 100);
  // float h = random(100);
  // float jump = random(3, 20);
  // for (int i = 1; i < colorCount; i++) {
  //   float s = random(30, 90);
  //   float v = random(50, 80);
  //   colors[i] =  color(h, s, v);
  //   h = (h + jump) % 100.0;
  // };
  for (int i = 0; i < palette.colors.length; i++) {
    colors[i] = palette.colors[i];
  };
  shuffle(colors);
}

color randColor() {
  return colors[int(random(palette.colors.length - 1)) + 1];
}

void keyPressed() {
  if (key == 0x41) {
    populateColors();
    fillGrid(spacing, cellSize);
  }
}

int[] possibleShapes = new int[100];

void setupShapes(int count, int nulls) {
  for (int i = 0; i < count; i++) {
    possibleShapes[i] = int(random(15));
  }
  for (int i = 0; i < nulls; i++) {
    possibleShapes[i + count] = 1000;
  }
}

int shapeCount = int(random(16))+1;
int nullCount = int(random(5));

void setup() {
  palette = new ColorPalette(this);
  palette.getPalette();
  populateColors();
  setupShapes(shapeCount, nullCount);
  bg = colors[0];

  // bg = color(0, 0, 100);

  noStroke();
  fill(bg);
  smooth(2);
  fillGrid(spacing, cellSize);
  size(5000, 5000);
  rectMode(CENTER);
}

void draw() {
  background(bg);
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      grid[i][j].display();
    }
  }
  if (record) {saveFrame("######.png");
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
    int r = possibleShapes[int(random(shapeCount + nullCount))];
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
      case 13:
        return halfTriangle(side);
      case 14:
        return qtrTriangle(side);
      case 15:
        return circle(side);
      default:
        return empty(side);
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

void shuffle(int[] array) { // mix-up the array
  for (int i = array.length - 1; i > 0; --i) {
    int j = int(random(array.length));
    int temp = array[i];
    array[i] = array[j];
    array[j] = temp;
  }
}
