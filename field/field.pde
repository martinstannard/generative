import nice.palettes.*;

ColorPalette palette;

color bg;

float c = 0.0;
int pixels = 5040;
int canvasSize = 5040;

int[] sides = {2, 3, 4, 5, 6, 7, 8, 9, 10, 12};
int side = sides[int(random(sides.length))];

int[] gaps = {0, 0, 0, 0, 20, 30, 40, 60};
int gap = gaps[int(random(gaps.length))];

int[] groups = {1, 1, 2, 2, 3, 4, 5, 20};
int groupCount = groups[int(random(groups.length))];

int[] colorCounts = {2, 3, 3, 4, 4, 4, 5, 5, 5, 5};
int colorCount = colorCounts[int(random(colorCounts.length))];
color[] colors = new color[colorCount];

int spacing = cellSpacing(side, canvasSize);
int cellSize = spacing - gap;

int rows = (canvasSize / spacing) + 1;
int cols = (canvasSize / spacing) + 1;

Cell[][] grid = new Cell[rows][cols];

int tick = 0;
int frames = 0;
int maxFrames = 1;

boolean record = true;
boolean stop = true;

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
  for (int i = 0; i < colors.length; i++) {
    colors[i] = palette.colors[i];
  };
  shuffle(colors);
}

color randColor() {
  return colors[int(random(colors.length - 1)) + 1];
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

  noStroke();
  fill(bg);
  smooth(2);
  fillGrid(spacing, cellSize);
  size(5040, 5040);
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
