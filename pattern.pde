int[] colors;
float angleRotate = 0.0;
int x = 0;
int direction = 1;

void setup() {
  size(1500, 1500);
  background(0);
  noStroke();
  smooth();
  
  colors = new color[360];
  for(int i = 0; i < colors.length; i++)
    colors[i] = color(random(255), random(255), i * 3);
}

void draw() {
  x += 2 * direction;
  background(0);
  for(int i = 0; i < 50; i++) {
    for(int j = 0; j < colors.length; j++) {
      pushMatrix();
      rotate(radians(angleRotate));
      fill(colors[j]);
      rect(x, 0 + i * 15 * (noise((frameCount+j)*0.01)), 15, 15);
      popMatrix();  
      
      angleRotate += 1;
      if ( x >= width+200 && direction == 1) {
        direction = -1;
        for(int c = 0; c < colors.length; c++){
                colors[c] = color(random(255), random(255), c * 3);
        }
      } else if ( x <= 0 && direction == -1) {
        direction = 1;
        for(int c = 0; c < colors.length; c++){
                colors[c] = color(random(255), random(255), c * 3);
        }
      }
      if (angleRotate > 36000) {
        angleRotate = 0;
      }
    }
  }
}
