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
