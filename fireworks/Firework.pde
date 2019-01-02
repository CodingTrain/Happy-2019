class Firework {
  PVector pos;
  PVector vel;

  float size;

  float hue;
  float alpha;

  int level;

  Firework(PVector p, PVector v, float h, int l) {
    pos = p;
    vel = v;

    size = random(3, 10);

    hue = h;
    alpha = 255;

    level = l;
  }

  void display() {
    strokeWeight(size);
    stroke(hue, 255, 255, alpha);
    
    point(pos.x, pos.y);
  }

  void update(int i) {
    pos.add(vel);
    vel.mult(0.975);

    alpha = lerp(alpha, 0, 0.025);
    hue+= 0.1;

    if (alpha < 10) {
      if (level > 0)
        recreate();
      
      fireworks.remove(i);
    }
  }

  void recreate() {
    int children = round(random(10, 50));
    float childrenHue = random(255);

    for (int i = 0; i < children; i++)
      fireworks.add(new Firework(new PVector(pos.x, pos.y), new PVector(cos(TWO_PI*i/float(children))*size*1.5, sin(TWO_PI*i/float(children))*size*1.5), childrenHue, random(2) < 0.5 ? level-1 : 0));
  }
}
