int padX, itemX, itemY, catchScore, lives;

void catchStart() {
  padX = 260;
  itemX = int(random(20, 580));
  itemY = 0;
  catchScore = 0;
  lives = 3;
}

void catchKey(char k) {
  if (lives == 0) {
    catchStart();
    return;
  }
  if (k == 'a') padX = max(0, padX - 40);
  if (k == 'd') padX = min(mw - 80, padX + 40);
}

void catchDraw() {
  if (lives > 0) {
    itemY += 3 + catchScore / 5;
    if (itemY >= mh - 20) {
      if (itemX > padX && itemX < padX + 80) catchScore++;
      else lives--;
      itemX = int(random(20, 580));
      itemY = 0;
      if (lives == 0 && catchScore > best[1]) best[1] = catchScore;
    }
  }

  fill(255, 150, 0);
  noStroke();
  ellipse(itemX, itemY, 20, 20);
  fill(0);
  rect(padX, mh - 20, 80, 10);

  textSize(16);
  text("Score: " + catchScore + "   Lives: " + lives, 10, 20);
  if (lives == 0) {
    textSize(30);
    text("Game over - press a or d", 150, 200);
  }
}
