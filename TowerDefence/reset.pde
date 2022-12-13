void reset(){
 lives = 100;
 money = 100;
  nextwaveNumber = 1;
  waveNumber = nextwaveNumber -1;
if(mobs.size() != 0){
  mobs.remove(0);
}
}
