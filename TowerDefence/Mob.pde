//Mobs are the monsters that the towers defend against.
//Mobs spawn at the start and then move across the map,
//changing direction when they hit a node. If they get
//to the end of the map, they deal damage to the player.
//Once the player has no more health, it's game over!

class Mob {

  float x, y, vx, vy, d, speed;
  int hp, maxhp, value, damage;
  color fillcolor;

  Mob(float _x, float _y, float _vx, float _vy) {
    x = _x;
    y = _y;
    vx = _vx;
    vy = _vy;
    d = 40;
    hp = 4;
    maxhp = 4;
    speed = 1;
    fillcolor = blue;
    damage = 10;
    value = 10;

  }

  void show() {
    fill(fillcolor);
    strokeWeight(3);
    stroke(black);
    //image(bunnymob, x, y, d+80, d);
    circle(x, y, d);
  }

  void act() {
    x+= vx*speed;
    y+= vy*speed;
    
    int i = 0;
    while (i < bullets.size()) {
      Bullet myBullet = bullets.get(i);
      if (dist(myBullet.x, myBullet.y, x, y)<d/2+myBullet.d/2) {
        hp -= 1;
        myBullet.hp -= 1;
      }
      i++;
    }

     i = 0;
    while (i< nodes.length) {
      if (dist(nodes[i].x, nodes[i].y, x, y) < 3) {
        vx = nodes[i].dx;
        vy = nodes[i].dy;
      }
      i++;
    }

  }
  void healthbar() {
    rectMode(CORNER);
    noStroke();
    fill(black);
    rect(x-27, y-(d+10)-2, 54, 24);//background
    fill(red);
    rect(x-25, y-(d+10), 50, 20);
    fill(pink);
    rect(x-25, y-(d+10), hp*50/maxhp, 20);
    rectMode(CENTER);
  }
}
