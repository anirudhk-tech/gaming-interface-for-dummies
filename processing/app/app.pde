int game = 0;
String[] names = {"Snake", "Catch", "Flappy"};
String[] hints = {"a / d  turn", "a / d  move", "w  flap"};
int[] best = new int[3];

int mx = 100, my = 100, mw = 600, mh = 400;

void setup() {
  size(800, 600);
}

void draw() {
  background(255);
  drawMain();
}

void drawMain() {
  fill(0);
  textSize(30);
  text("Gaming Interface", 40, 60);

  for (int i = 0; i < 3; i++) {
    int x = 40 + i * 250;
    int y = 150;
    fill(240);
    stroke(0);
    rect(x, y, 220, 300);

    fill(0);
    textSize(28);
    text(names[i], x + 20, y + 50);
    textSize(16);
    text("press " + (i + 1) + " to play", x + 20, y + 100);
    text("keys: " + hints[i], x + 20, y + 130);
    text("best: " + best[i], x + 20, y + 260);
  }
}
