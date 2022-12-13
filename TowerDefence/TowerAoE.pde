class TowerAoE {
  float x, y;
  int cooldown, threshold, cost, towermode, AoEd;

  final int PLACING = 0;
  final int PLACED = 1;

  TowerAoE(float _x, float _y, int c, int th) {
    x = _x;
    y = _y;
    cooldown = c;
    threshold = th;
    cost = 50;
    towermode = PLACING;
    AoEd = 190;
  }

  void show() {
    fill(pink);
    stroke(black);
    strokeWeight(4);

    if (towermode == PLACED) {
      circle(x, y, 40);
    }

    if (towermode == PLACING && mode == BUILD) {
      circle(mouseX, mouseY, 40);
      towerplacing = true;
      if (mousePressed  && mouseX < 770) {
        towermode = PLACED;
        towerplacing = false;
        money -=50;
        x = mouseX;
        y = mouseY;
      }
    }
  }

  void act() {
    cooldown++;
    if (towermode == PLACED) {
      if (cooldown >= threshold) {
        cooldown = 0;
        int i = 0;
        while (i < mobs.size()) {
          Mob myMob = mobs.get(i);
          if (dist(myMob.x, myMob.y, x, y)<AoEd/2+myMob.d/2) {
            fill(white, 60);
            stroke(white);
            circle(x, y, AoEd);
            myMob.hp -= 1;
          }
          i++;
        }
      }
    }
  }
}
