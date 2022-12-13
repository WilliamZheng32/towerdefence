void mapselector(){
  //whatmap = true;
  textSize(100);
  text("MAP SELECTOR",500,100);
  background(pink);
  map1.show();
  map2.show();
  
  if(map1.clicked){
    mode = PLAY;
    nodes = map1nodes;
  }
  else if(map2.clicked){
   mode = PLAY;
   nodes = map2nodes;
  }
}
