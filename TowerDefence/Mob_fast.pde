//Mobs are the monsters that the towers defend against.
//Mobs spawn at the start and then move across the map,
//changing direction when they hit a node. If they get
//to the end of the map, they deal damage to the player.
//Once the player has no more health, it's game over!

class FastMob extends Mob {

  FastMob(float _x, float _y, float _vx, float _vy) {
    super(_x, _y, _vx, _vy);
    d = 40;
    hp = 4;
    maxhp = 4;
    speed = 2;
    fillcolor = yellow;
    value = 10;
    damage = 10;
  }
  
  //  void show() {
  //  fill(fillcolor);
  //  strokeWeight(3);
  //  stroke(black);
  //  image(rabbitmob, x, y, d+80, d);
  //  //circle(x, y, d);
  //}
}
