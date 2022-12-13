//This function draws the BUILD screen

void build() {
  drawThings();
  animateThings();
  
  if(towerplacing == false){
   buttonclicks();
  }
}

void buttonclicks() {
  if (play.clicked) {
    mode = PLAY;
  }

  if (gun.clicked && money >= 50 && mode == BUILD) {
    //makeTowerUpgrades();
    towers.add(new Tower(mouseX, mouseY, 0, 40));
  }

  if (snipergun.clicked && money >= 100 && mode == BUILD) {
    snipers.add(new TowerSniper(mouseX, mouseY, 0, 70));
  }

  if (AoEgun.clicked && money >= 50 && mode == BUILD) {
    AoE.add(new TowerAoE(mouseX, mouseY, 0, 50));
  }
}
