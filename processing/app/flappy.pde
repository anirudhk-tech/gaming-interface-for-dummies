float birdY, birdV;
int pipeX, gapY, flapScore;
boolean flapOver;

void flappyStart() {
  birdY = 200;
  birdV = 0;
  pipeX = 600;
  gapY = int(random(100, 300));
  flapScore = 0;
  flapOver = false;
}

void flappyKey(char k) {
  if (flapOver) {
    flappyStart();
    return;
  }
  if (k == 'w') birdV = -7;
}
