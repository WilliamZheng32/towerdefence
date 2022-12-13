//Mobs are the monsters that the towers defend against.
//Mobs spawn at the start and then move across the map,
//changing direction when they hit a node. If they get
//to the end of the map, they deal damage to the player.
//Once the player has no more health, it's game over!

class BigMob extends Mob {

  BigMob(float _x, float _y, float _vx, float _vy) {
    super(_x, _y, _vx, _vy);
    d = 80;
    hp = 10;
    maxhp = 10;
    speed = 0.5;
    fillcolor = lightbrown;
    value = 15;
    damage = 20;
  }
}
