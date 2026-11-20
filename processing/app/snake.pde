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
