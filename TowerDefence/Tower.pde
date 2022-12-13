//A Tower is the player's main defense against the mobs.
//Towers are placed on the maps and then automatically
//act. There are 3 kinds of towers (but you can make more!)

//Gun Tower: These towers shoot bullets that fly across
//           the screen and do damage to mobs.

//AoE Tower: These towers place AoE_Rings that deal damage
//           to all mobs in the ring.

//Sniper Tower: These towers automatically target the first
//              mob no matter where they are on the scren.

class Tower {
  float x, y;
  int cooldown, threshold, cost, towermode;

  final int PLACING = 0;
  final int PLACED = 1;

  Tower(float _x, float _y, int c, int th) {
    x = _x;
    y = _y;
    cooldown = c;
    threshold = th;
    cost = 50;
    towermode = PLACING;
  }

  void show() {
    fill(orange);
    stroke(black);
    strokeWeight(4);

    if (towermode == PLACED) {
      square(x, y, 40);
     //makeTowerUpgrades();
     
      towerplacing = false;
    }
    if (towermode == PLACING && mode == BUILD) {
      towerplacing = true;
       //towerupgrade.show();
      square(mouseX, mouseY, 40);
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
        bullets.add(new Bullet(x, y, 0, -15));//up
        bullets.add(new Bullet(x, y, 0, 15));//down
        bullets.add(new Bullet(x, y, 15, 0));//right
        bullets.add(new Bullet(x, y, -15, 0));//left
      }
    }
  }
}
