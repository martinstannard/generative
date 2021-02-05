color in = color(200, 200, 220);
float c = 0.0;
Sqr s1, s2, s3, s4, s5;

void setup() {
  size(400, 400);
  noStroke();
  rectMode(CENTER);
  fill(in);
  s1 = new Sqr(100, 100, 0.01);
  s2 = new Sqr(100, 300, 0.01);
  s3 = new Sqr(300, 100, 0.01);
  s4 = new Sqr(300, 300, 0.01);
  s5 = new Sqr(200, 200, -0.01);
}

void draw() {
  background(0);
  s1.display();
  s2.display();
  s3.display();
  s4.display();
  s5.display();
  s1.move();
  s2.move();
  s3.move();
  s4.move();
  s5.move();
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
    rect(0, 0, 100, 100);
    pop();
  }
}
