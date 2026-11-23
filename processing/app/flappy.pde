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

void flappyDraw() {
  if (!flapOver) {
    birdV += 0.5;
    birdY += birdV;
    pipeX -= 3;
    if (pipeX < -40) {
      pipeX = 600;
      gapY = int(random(100, 300));
      flapScore++;
    }

    if (birdY < 0 || birdY > mh) flapOver = true;
  }

  fill(0, 150, 0);
  noStroke();
  rect(pipeX, 0, 40, gapY - 60);
  rect(pipeX, gapY + 60, 40, mh - gapY - 60);
  fill(255, 200, 0);
  ellipse(100, birdY, 20, 20);
}
