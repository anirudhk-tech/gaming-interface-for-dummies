int game = 0;
String[] names = {"Snake", "Catch", "Flappy"};
String[] hints = {"a / d  turn", "a / d  move", "w  flap"};
int[] best = new int[3];

int mx = 100, my = 100, mw = 600, mh = 400;

void setup() {
  size(800, 600);
}

void keyPressed() {
  char k = Character.toLowerCase(key);

  if (game == 0) {
    if (k == '1') { game = 1; snakeStart(); }
    if (k == '2') { game = 2; catchStart(); }
    if (k == '3') { game = 3; flappyStart(); }
  } else {
    if (k == 'q') game = 0;
    else if (game == 1) snakeKey(k);
    else if (game == 2) catchKey(k);
    else if (game == 3) flappyKey(k);
  }
}

void draw() {
  background(255);
  drawMain();

  if (game > 0) {
    fill(0, 150);
    noStroke();
    rect(0, 0, width, height);

    fill(255);
    stroke(0);
    rect(mx, my, mw, mh);
    fill(255);
    textSize(16);
    text(names[game - 1] + "   (q = close)", mx, my - 10);

    pushMatrix();
    translate(mx, my);
    if (game == 1) snakeDraw();
    if (game == 2) catchDraw();
    if (game == 3) flappyDraw();
    popMatrix();
  }
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
