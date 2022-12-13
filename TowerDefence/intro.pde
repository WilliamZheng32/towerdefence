//This function draws the INTRO screen.

void intro() {

  introGif.show();
  textFont(SuperMario);
  textSize(100);
  fill(darkblue);
  text("TOWER", x1, y1);
  text("DEFENCE", x2, y2);

  x1+=7;
  x2-=7;
  if (x1 >= 1200) {
    x1=-200;
  }
  if (x2 <= -200) {
    x2=1200;
  }

  start.show();

  if (start.clicked) {
    mode = MAPSELECTOR;
  }
}
