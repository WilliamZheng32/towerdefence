//Tower Defense Game
//William Zheng
//Programming 12

// ================ GLOBAL VARIABLES =================

final int INTRO    = 0;
final int PLAY     = 1;
final int BUILD    = 2;
final int GAMEOVER = 3;
final int MAPSELECTOR = 4;
int mode;

//Pallette
color white = #ffffff;
color black = #000000;
color lightblue = #ADD8E6;
color lightgreen = #00FF00;
color yellow = #FFE600;
color brown = #964B00;
color darkbrown = #4E3524;
color grey = #808080;
color darkblue = #00008B;
color cream = #fefae0;
color lightbrown = #C4A484;
color red = #ff0000;
color blue = #0000FF;
color green = #00FF00;
color orange = #FFA500;
color purple = #A020F0;
color pink = #FFC0CB;
color darkgreen = #023020;
color darkorange = #8B4000;

//Mouse & Keyboard interaction variables
boolean mouseReleased;
boolean wasPressed;

//Buttons
Button start, nextWave, build, play, gun, AoEgun, reset, snipergun, map1, map2, towerupgrade;

//Collections of objects
Node[] nodes;
Node[] map1nodes;
Node[] map2nodes;
ArrayList<Mob> mobs;
//ArrayList<BigMob> bigmobs;
//ArrayList<FastMob> fastmobs;
ArrayList<Tower> towers;
ArrayList<TowerSniper> snipers;
ArrayList<TowerAoE> AoE;
ArrayList<Bullet> bullets;


//Images and Gifs
Gif introGif;
PImage playbutton;
PImage grassbackground;
PImage spacebackground;
PImage bunnymob, pandamob, rabbitmob;
//Fonts
PFont SuperMario;

//other variables
int x1, y1, x2, y2, nextwaveNumber, waveNumber, money, lives, towermode;

boolean towerplacing;

// ===================== SETUP =========================

void setup() {
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  size(1000, 800);
  initializeModes();
  initializeVariables();
  makeButtons();
  makeNodes();
  //makeTowerUpgrades();
  reset();
}

void initializeModes() {
  //set up the default mode for things
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  mode = INTRO;
}

void initializeVariables() {
  //Load Images & Gifs
  introGif = new Gif("intro_gif/frame_", "_delay-0.04s.gif", 64, 1, 500, 400, width, height);
  playbutton = loadImage("playbutton.png");
  grassbackground = loadImage("grassbackground.png");
  spacebackground = loadImage("spacebackground.jpg");
  bunnymob = loadImage("bunnymob.png");
  pandamob = loadImage("pandamob.png");
  rabbitmob = loadImage("rabbitmob.png");
  //Load Fonts
  SuperMario = createFont("SuperMario.ttf", 100);
  //Create Collections of Objects
  mobs = new ArrayList<Mob>();
  towers = new ArrayList<Tower>();
  snipers = new ArrayList<TowerSniper>();
  AoE = new ArrayList<TowerAoE>();
  bullets = new ArrayList<Bullet>();

  //other variables
  nextwaveNumber = 1;
  waveNumber = 1;
  x1 = 500;
  y1 = 200;
  x2 = 500;
  y2 = 300;
  money = 100;
  lives = 100;
  towerplacing = false;
}

void makeButtons() {
  //INTRO - Start
  start = new Button("START", width/2, 3*height/4, 200, 100, white, black);
  //PLAY - Next Wave, To Build Mode
  nextWave = new Button(playbutton, 900, 100, 100, 100, black, green);
  build = new Button("BUILD", 900, 200, 150, 100, white, blue);
  //BUILD - To play mode, Buy Sniper, Buy Gun, Buy AoE
  play = new Button("PLAY", 900, 200, 150, 100, white, blue);
  gun = new Button("GUN", 900, 300, 150, 100, white, brown);
  snipergun = new Button("SNIPER", 900, 400, 150, 100, white, darkblue);
  AoEgun = new Button("AoE", 900, 500, 150, 100, white, pink);
  //GAMEOVER - Reset
  reset = new Button("RESET", width/2, 3*height/4, 200, 100, lightgreen, darkbrown);
  //mapbuttons
  map1 = new Button("forest map", 300, 300, 200, 200, darkgreen, lightgreen);
  map2 = new Button("space map", 700, 300, 200, 200, darkblue, lightblue);
}
//void makeTowerUpgrades() {
//  towerupgrade = new Button("", mouseX, mouseY, 40, 40, orange, darkorange);
//  towerupgrade.show();
//}

void makeNodes() {
  //  //Plot the nodes on the map
  map1nodes = new Node[8];

  map1nodes[0] = new Node(300, 400, 0, -3);
  map1nodes[1] = new Node(300, 100, -3, 0);
  map1nodes[2] = new Node(200, 100, 0, 3);
  map1nodes[3] = new Node(200, 200, 3, 0);
  map1nodes[4] = new Node(500, 200, 0, 3);
  map1nodes[5] = new Node(500, 600, 3, 0);
  map1nodes[6] = new Node(700, 600, 0, -3);
  map1nodes[7] = new Node(700, 300, 3, 0);

  map2nodes = new Node[8];

  map2nodes[0] = new Node(200, 400, 0, 3);
  map2nodes[1] = new Node(200, 600, 3, 0);
  map2nodes[2] = new Node(300, 600, 0, -3);
  map2nodes[3] = new Node(300, 400, 3, 0);
  map2nodes[4] = new Node(500, 400, 0, -3);
  map2nodes[5] = new Node(500, 200, 3, 0);
  map2nodes[6] = new Node(600, 200, 0, 3);
  map2nodes[7] = new Node(600, 400, 3, 0);
}

// ===================== DRAW ===========================

void draw() {
  click();
  if (mode == INTRO) {
    intro();
  } else if (mode == PLAY) {
    play();
  } else if (mode == BUILD) {
    build();
  } else if (mode == GAMEOVER) {
    gameover();
  } else if (mode == MAPSELECTOR) {
    mapselector();
  }
  //textSize(20);
  //text(mouseX + ", " + mouseY, mouseX, mouseY-20);
}
