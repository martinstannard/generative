color red = color(255, 0, 0);
color blue = color(0, 0, 255);
float c = 0.0;
Sqr s1, s2, s3, s4, s5;
int rows = 5;
int cols = 5;
Sqr[][] grid = new Sqr[rows][cols];

int frames = 0;
int maxFrames = 70;

void setup() {
  fillGrid();
  size(400, 400);
  noStroke();
  rectMode(CENTER);
  fill(blue);
  s1 = new Sqr(100, 100, 0.01);
  s2 = new Sqr(100, 300, 0.01);
  s3 = new Sqr(300, 100, 0.01);
  s4 = new Sqr(300, 300, 0.01);
  s5 = new Sqr(200, 200, -0.01);
}

void draw() {
  background(red);
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      grid[i][j].display();
      grid[i][j].move();
    }
  }
  saveFrame("#####.png");
  frames++;
  if (frames > maxFrames) {
    exit();
  }
}

void fillGrid() {
  float dir = 1.0;
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      grid[i][j] = new Sqr(0 + (i * 100), 0 + (j * 100), 0.03 * dir);
      dir = dir * -1.0;
    }
  }
}

class Sqr {
  int x;
  int y;
  float rot;
  float ang;

  Sqr(int ix, int iy, float irot) {
    x = ix;
    y = iy;
    rot = irot;
    ang = 0.0;
  }

  void move() {
    ang += rot;
  }

  void display() {
    push();
    translate(x, y);
    rotate(ang);
    rect(0, 0, 90, 90);
    pop();
  }
}
