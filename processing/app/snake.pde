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
    for (int i = snakeLen - 1; i > 0; i--) {
      sx[i] = sx[i - 1];
      sy[i] = sy[i - 1];
    }
    sx[0] += dx[dir];
    sy[0] += dy[dir];

    if (sx[0] < 0 || sx[0] >= 30 || sy[0] < 0 || sy[0] >= 20) snakeOver = true;
  }

  fill(0, 150, 0);
  noStroke();
  for (int i = 0; i < snakeLen; i++) {
    rect(sx[i] * 20, sy[i] * 20, 20, 20);
  }
}
