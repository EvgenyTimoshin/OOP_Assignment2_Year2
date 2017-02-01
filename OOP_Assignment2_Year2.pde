import ddf.minim.*;

void setup()
{
  //size(1920, 1080, P3D);
  fullScreen(P3D);
  camera();
  frameRate(60);
  //noCursor();
  minim = new Minim(this);
  audio = new Audio();
  /////////////////////
  //Spawn Game Objects on launch
  ///////////////////////
  ui = new GUI();
  player = new Player(width / 2, height / 2, 0, 50, color(0,0,255));
  gameObjects.add(player);
  Clock clock = new Clock();
  gameObjects.add(clock);
  Gun gun = new Gun();
  gameObjects.add(gun);
  bow = new Bow();
  torch = new Torch();
  trader = new Trader(200, 300);
  
  /*for(int i = 0; i < 1080; i += 350)
  {
    createBuilding(i , 300, 300, 10);
  }*/
  
  Wall wall = new Wall(-width*2,-height*2,width*4, 20);
  gameObjects.add(wall);
  Wall wall2 = new Wall(width*2,-height*2,20, height*4);
  gameObjects.add(wall2);
  Wall wall3 =new Wall(-width*2, height*2, width*4, 20);
  gameObjects.add(wall3);
  Wall wall4 = new Wall(-width*2, -height*2, 20, height*4);
  gameObjects.add(wall4);
  
  font = loadFont("Zombie-Noize-48.vlw");
  ///////////
  //Sounds
  ////////
  audio.forestAmbience.play();
  background = loadImage("grass.jpg");
  background.resize(500, 500);
}

Player player;
Trader trader;
Minim minim;
Audio audio;
Bow bow;
Torch torch;
GUI ui;
PFont font;
PImage background;
ArrayList<GameObject>gameObjects = new ArrayList<GameObject>();
boolean[] keys = new boolean[1000];
float timeDelta = 1.0f / 60.0f;

void draw()
{
  //println(frameRate);
  background(255);
  stroke(255,0,0);
   mapTextures();
  noFill();
  //println(frameRate);
  println(gameObjects.size());
  pushMatrix();
  translate(0,0,+5);
  rect(-width*2,-height*2,width*4,height*4);
  popMatrix();
  fill(255);
  
   //gunEnemySpawn();
   zombieSpawn();
   //ammoSpawn();
  //text(dist(player.pos.x,player.pos.y,width,height),width/2,height/2 + 100);
  trader.render();
  trader.update();
 //drawBuildingFloor();
  
  for (int i = gameObjects.size() - 1 ; i >= 0  ; i --)
  {
    GameObject go = gameObjects.get(i); 
    go.update();
    go.render();    
  }  
  globalInput();
}