class TowerSniper {
  float x, y;
  int cooldown, threshold, cost, towermode;

  final int PLACING = 0;
  final int PLACED = 1;

  TowerSniper(float _x, float _y, int c, int th) {
    x = _x;
    y = _y;
    cooldown = c;
    threshold = th;
    cost = 100;
    towermode = PLACING;
  }

  void show() {
    fill(darkblue);
    stroke(black);
    strokeWeight(4);

    if (towermode == PLACED) {
      square(x, y, 40);
    }

    if (towermode == PLACING && mode == BUILD) {
      square(mouseX, mouseY, 40);
      towerplacing = true;
      if (mousePressed && mouseX < 770) {
        towermode = PLACED;
        towerplacing = false;
        money -=100;
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

        Mob myMobs = mobs.get(0);
        myMobs.hp -= 2;

        stroke(red);
        strokeWeight(10);
        line(myMobs.x, myMobs.y, x, y);
      }
    }
  }
}
