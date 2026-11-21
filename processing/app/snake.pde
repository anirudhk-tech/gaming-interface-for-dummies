int[] sx = new int[600];
int[] sy = new int[600];
int snakeLen, dir, foodX, foodY, snakeScore, lastMove;
boolean snakeOver;
int[] dx = {1, 0, -1, 0};
int[] dy = {0, 1, 0, -1};

void snakeStart() {
  snakeLen = 3;
  for (int i = 0; i < snakeLen; i++) {
    sx[i] = 10 - i;
    sy[i] = 10;
  }
  dir = 0;
  snakeScore = 0;
  snakeOver = false;
  foodX = int(random(30));
  foodY = int(random(20));
  lastMove = millis();
}

void snakeKey(char k) {
  if (snakeOver) {
    snakeStart();
    return;
  }
  if (k == 'a') dir = (dir + 3) % 4;
  if (k == 'd') dir = (dir + 1) % 4;
}

void snakeDraw() {
  if (!snakeOver && millis() - lastMove > 150) {
    lastMove = millis();
    int tailX = sx[snakeLen - 1];
    int tailY = sy[snakeLen - 1];
    for (int i = snakeLen - 1; i > 0; i--) {
      sx[i] = sx[i - 1];
      sy[i] = sy[i - 1];
    }
    sx[0] += dx[dir];
    sy[0] += dy[dir];

    if (sx[0] < 0 || sx[0] >= 30 || sy[0] < 0 || sy[0] >= 20) snakeOver = true;
    for (int i = 1; i < snakeLen; i++) {
      if (sx[0] == sx[i] && sy[0] == sy[i]) snakeOver = true;
    }
    if (sx[0] == foodX && sy[0] == foodY) {
      sx[snakeLen] = tailX;
      sy[snakeLen] = tailY;
      snakeLen++;
      snakeScore++;
      foodX = int(random(30));
      foodY = int(random(20));
    }
    if (snakeOver && snakeScore > best[0]) best[0] = snakeScore;
  }

  fill(255, 0, 0);
  noStroke();
  rect(foodX * 20, foodY * 20, 20, 20);
  fill(0, 150, 0);
  for (int i = 0; i < snakeLen; i++) {
    rect(sx[i] * 20, sy[i] * 20, 20, 20);
  }

  fill(0);
  textSize(16);
  text("Score: " + snakeScore, 10, 20);
  if (snakeOver) {
    textSize(30);
    text("Game over - press a or d", 150, 200);
  }
}
