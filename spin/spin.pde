color fg = color(120, 160, 60);
color bg = color(67, 32, 99);

float c = 0.0;
int canvasSize = 840;
float speed = 0.04;
float frameCount = 50;

int ringCount = 10;
int ringGap = 30;
int circSize = 20;
int circDiv = 30;

Ring[] rings = new Ring[ringCount];

int tick = 0;
int frames = 0;
int maxFrames = 52;

boolean record = true;
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

PShape circle(int x, int y, float radius) {

  PShape shape = createShape(ELLIPSE, x, y, radius, radius);
  shape.setFill(fg);
  return shape;
}

void keyPressed() {
  if (key == 0x41) {
  }
}
void setup() {
  noStroke();
  createRings(ringCount);
  fill(bg);
  smooth(2);
  size(840, 840);
  rectMode(CENTER);
}

void draw() {
  background(bg);
  for (int i = 0; i < ringCount; i++) {
    rings[i].display();
  }

  if (record) {
    saveFrame("######.png");
  }
  if (stop && frames == frameCount) {
    exit();
  }
  frames++;
  tick++;
}

void createRings(int count) {
  float dir = 1.0;
  for (int i = 0; i < count; i++) {
    rings[i] = new Ring(i+1);
  }
}

class Ring {
  float rot;
  float inc;
  Polygon circles;

  Ring(int index) {
    rot = 0.0;
    int circlesPerRing = int(TWO_PI * ringGap * index / circDiv);
    circles = builder(index, circlesPerRing);
    inc = TWO_PI / circlesPerRing;
  }

  Polygon builder(int index, int circlesPerRing) {
    int circles = int(TWO_PI * ringGap * index / circDiv);
    float a = TWO_PI / (circlesPerRing - 1);
    PShape g = createShape(GROUP);
    for(int i = 0; i < circlesPerRing; i++) {
      int x = int(sin(a * i) * ((index * ringGap) + 30));
      int y = int(cos(a * i) * ((index * ringGap) + 30));
      translate(x, y);
      rotate(a);
      PShape s = circle(x, y, circSize);
      g.addChild(s);
    }
    return new Polygon(g);
  }

  void display() {
    push();
    translate(canvasSize/2, canvasSize/2);
    rotate(rot);
    rot += inc / frameCount;
    circles.display();
    pop();
  }
}

