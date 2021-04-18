float angle = 0;

void setup() {
  size(440, 280);
  colorMode(RGB, 1);
}

void draw() {
  float ca = map(mouseX, 0, width, -1, 1);
  float cb = map(mouseY, 0, height, -1, 1);
  
  //float ca = cos(angle * 3.213);
  //float cb = sin(angle);
  
  angle += 0.01;

  background(255);

  float w = 5;
  float h = (w * height) / width;

  float xmin = -w/2;
  float ymin = -h/2;

  loadPixels();

  int maxiterations = 100;

  float xmax = xmin + w;
  float ymax = ymin + h;

  float dx = (xmax - xmin) / (width);
  float dy = (ymax - ymin) / (height);

  float y = ymin;
  for (int j = 0; j < height; j++) {
    float x = xmin;
    for (int i = 0; i < width; i++) {

      float a = x;
      float b = y;
      int n = 0;
      while (n < maxiterations) {
        float aa = a * a;
        float bb = b * b;
        if (a*a + b*b > 4.0) {
          break;
        }
        float twoab = 2.0 * a * b;
        a = aa - bb + ca;
        b = twoab + cb;
        n++;
      }

      if (n == maxiterations) {
        pixels[i+j*width] = color(0);
      } else {
        pixels[i+j*width] = color(sqrt(float(n) / maxiterations));
      }
      x += dx;
    }
    y += dy;
  }
  updatePixels();
  println(frameRate);
}
