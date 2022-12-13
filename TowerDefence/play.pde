//This function draws the PLAY screen

void play() {

  drawThings();
  handlebuttonclicks();
  animateThings();
}

void drawThings() {
  //map1
  if (map1.clicked) {
    image(grassbackground, 400, 400, width, height);
    //draw path
    strokeWeight(40);
    stroke(brown);
    line(0, 400, 300, 400);
    line(300, 400, 300, 100);
    line(300, 100, 200, 100);
    line(200, 100, 200, 200);
    line(200, 200, 500, 200);
    line(500, 200, 500, 600);
    line(500, 600, 700, 600);
    line(700, 600, 700, 300);
    line(700, 300, 1000, 300);
  } else if (map2.clicked) {
    image(spacebackground, 400, 400, width, height);

    strokeWeight(40);
    stroke(white);
    line(0, 400, 200, 400);
    line(200, 400, 200, 600);
    line(200, 600, 300, 600);
    line(300, 600, 300, 400);
    line(300, 400, 500, 400);
    line(500, 400, 500, 200);
    line(500, 200, 600, 200);
    line(600, 200, 600, 400);
    line(600, 400, 800, 400);
  }
  //lives
  fill(red);
  stroke(red);
  textSize(40);
  text("lives:", 630, 20);
  text(lives, 740, 20);

  //money
  fill(yellow);
  fill(yellow);
  text("coins:", 630, 50);
  text(money, 740, 50);

  //build
  if (mode == PLAY) {
    fill(darkblue);
    noStroke();
    rect(900, 400, 200, 800);
    fill(green);
    textSize(20);
    text("next wave: ", 890, 30);
    text(nextwaveNumber, 970, 30);
    nextWave.show();
    build.show();
  } else if (mode == BUILD) {
    fill(black);
    noStroke();
    rect(900, 400, 200, 800);
    fill(purple);
    textSize(100);
    text("BUILD MODE", 400, 300);

    play.show();
    gun.show();
    snipergun.show();
    AoEgun.show();
  }
}

void animateThings() {
  int i = 0;

  while (i<mobs.size()) {
    Mob myMob = mobs.get(i);
    myMob.act();
    myMob.show();
    myMob.healthbar();
    if (myMob.hp <= 0) {
      mobs.remove(i);
      money+=myMob.value;
    }
    if (myMob.x > 800) {
      lives-=myMob.damage;
      mobs.remove(i);
    } else i++;
  }

  i = 0;
  while (i<towers.size()) {
    Tower myTower = towers.get(i);
    if (mobs.size() > 0) {
      myTower.act();
    }
    myTower.show();
    i++;
  }

  i = 0;
  while (i<snipers.size()) {
    TowerSniper mySniper = snipers.get(i);
    if (mobs.size() > 0) {
      mySniper.act();
    }
    mySniper.show();
    i++;
  }

  i = 0;
  while (i<AoE.size()) {
    TowerAoE myAoE = AoE.get(i);
    if (mobs.size() > 0) {
      myAoE.act();
    }
    myAoE.show();
    i++;
  }

  i = 0;
  while (i<bullets.size()) {
    Bullet myBullet = bullets.get(i);
    myBullet.act();
    myBullet.show();
    if (myBullet.hp <= 0 || myBullet.y > height || myBullet.y < 0 || myBullet.x > 800 || myBullet.x < 0) {
      bullets.remove(i);
    } else i++;
  }

  if (lives <= 0) mode = GAMEOVER;
}

void handlebuttonclicks() {
  int x = 0;
  int i = 0;
  if (nextWave.clicked && mobs.size() == 0) {
    waveNumber += 1;
    if (waveNumber % 3 == 0) {
      i = 0;
      x = 0;
      while (i < waveNumber/3) {
        mobs.add(new FastMob(x, 400, 3, 0));
        x -=100;
        i++;
      }
    }

    if (waveNumber % 4 == 0) {
      x = 0;
      i = 0;
      while (i < waveNumber/4) {
        mobs.add(new BigMob(x, 400, 3, 0));
        x -= 200;
        i++;
      }
    }

    while (mobs.size() < nextwaveNumber) {
      //println(mobs.size());
      mobs.add(new Mob(x, 400, 3, 0));
      x -= 50;
    }

    nextwaveNumber += 1;
    //println(waveNumber);
  }

  if (build.clicked) {
    mode = BUILD;
  }
}
