//This function draws the GAMEOVER screen.

void gameover() {
  background(red);
  fill(black);
  stroke(orange);
  textSize(200);
  textFont(SuperMario);

  text("GAME", 500, 200);
  text("OVER", 500, 300);
  textSize(30);
  text("You got to wave:",500,400);
  text(waveNumber,680,400);
  
  reset.show();
  
  if(reset.clicked){
    mode = INTRO;
    reset();
  }
}
