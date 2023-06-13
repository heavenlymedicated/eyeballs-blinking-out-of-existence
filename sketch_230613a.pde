float y, h, scale;

Eye[] eyeballs;

void setup() {
  size(1000, 1000);
  
  eyeballs = new Eye[100];
  scale = height / eyeballs.length;
  y = scale / 2;
  h = 0;
  
  for (int i = 0; i < eyeballs.length; i++) {
    eyeballs[i] = new Eye(y, h, random(0.002, 0.1), scale);
    y += scale;
    h += 360 / eyeballs.length;
  }
}

void draw() {
  background(0);
  
  for (Eye e : eyeballs) {
    e.display();
    e.drift();
    e.blink();
  }
}

class Eye {
  float x, y, r, s, a;
  float blinkInterval, blinkTimer;
  
  Eye(float y, float h, float speed, float scale) {
    x = width / 2;
    this.y = y;
    r = scale * 0.6; // Increase the eyeball radius
    s = speed;
    a = h;
    blinkInterval = random(3, 6);
    blinkTimer = 0;
  }
  
  void display() {
    push();
    translate(x, y);
    rotate(radians(a));
    
    // Eyeball
    fill(255);
    ellipse(0, 0, r * 2, r * 2);
    
    // Iris
    fill(0);
    ellipse(r * 0.3, 0, r * 0.6, r * 0.6);
    
    pop();
  }
  
  void drift() {
    a += s;
  }
  
  void blink() {
    blinkTimer++;
    
    if (blinkTimer > blinkInterval * 60) { // Convert blinkInterval to frames (assuming 60 FPS)
      r *= random(0.3, 0.7);
      blinkTimer = 0;
      blinkInterval = random(3, 6);
    }
  }
}
