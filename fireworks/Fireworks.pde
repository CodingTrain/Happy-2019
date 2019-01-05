/* @pjs font="data/Product Sans.ttf"; */

ArrayList<Firework> fireworks;
PFont font;

void setup() {
  size(constrain(window.innerWidth*0.75, 0, 720), constrain(window.innerWidth*0.4, 0, 384));

  colorMode(HSB);

  fireworks = new ArrayList();
  font = createFont("data/Product Sans.ttf", 12);
}

void draw() {
  background(0);
  textFont(font);
  textAlign(CENTER, CENTER);

  autoTextSize("Happy "+year()+"!", width*5/8.0, height/2.0, 1);
  text("Happy "+year()+"!", width/2.0, height/2.0);

  for (int i = 0; i < fireworks.size(); i++) {
    if (fireworks.get(i) != null) {
      fireworks.get(i).display();
      fireworks.get(i).update(i);
    }
  }

  if (frameCount%30 == 0 || random(1) < 0.01)
    fireworks.add(new Firework(new PVector(random(width), height), new PVector(0, random(-height/120.0, -height/30.0)), random(255), round(random(1, 2.5))));
}

float autoTextSize(String str, float w, float h, int l) {
  textSize(1);
  float minW = w/textWidth(str);
  float minH = h/float(l);
  textSize(min(minW, minH));
  
  return min(minW, minH);
}
