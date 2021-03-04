color red = color(255, 0, 0);
color blue = color(0, 0, 255);
color black = color(0, 0, 0);
color white = color(255, 255, 255);

float c = 0.0;
int rows = 10;
int cols = 10;
int side = 400;
Sqr[][] grid = new Sqr[rows][cols];

int frames = 0;
int maxFrames = 90;

boolean record = false;
boolean stop = false;

void setup() {
  fillGrid(50, 55);
  size(400, 400);
  noStroke();
  rectMode(CENTER);
  fill(black);
}

void draw() {
  background(white);
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      grid[i][j].display();
      grid[i][j].move();
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
      if ((i * j) % 2 == 0) {
        dir = dir * -1.0;
      }
      grid[i][j] = new Sqr(0 + (i * spacing), 0 + (j * spacing), 0.01 * dir, length);
    }
    // if (i % 2 == 0) {
    //   dir = dir * -1.0;
    // }
  }
}

class Sqr {
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
    rotate(ang*4.0);
    scale(sin(ang));
    rect(0, 0, side, side);
    pop();
  }
}
