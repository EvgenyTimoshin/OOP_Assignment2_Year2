import ddf.minim.*;

void setup()
{
  //size(1920, 1080, P3D);
  fullScreen(P3D);
  camera();
  frameRate(60);
  minim = new Minim(this);
  audio = new Audio();
  /////////////////////
  //Spawn Game Objects on launch
  ///////////////////////
  player = new Player(width / 2, height / 2, 0, 50, color(0,0,255));
  gameObjects.add(player);
  Clock clock = new Clock();
  gameObjects.add(clock);
  Gun gun = new Gun();
  gameObjects.add(gun);
  bow = new Bow();
  torch = new Torch();
  
  for(int i = 0; i < 1080; i += 350)
  {
    createBuilding(i , 300, 300, 10);
  }
  
  font = loadFont("Zombie-Noize-48.vlw");
  ///////////
  //Sounds
  ////////
  audio.forestAmbience.play();
  background = loadImage("grass.jpg");
  background.resize(width,height);
}

Player player;
Minim minim;
Audio audio;
Bow bow;
Torch torch;
PFont font;
PImage background;
ArrayList<GameObject>gameObjects = new ArrayList<GameObject>();
boolean[] keys = new boolean[1000];
float timeDelta = 1.0f / 60.0f;
Boolean enemies = true;

void draw()
{
  //println(frameRate);
  background(0);
  stroke(255,0,0);
  mapTextures();
  noFill();
  //println(frameRate);
  println(gameObjects.size());
  pushMatrix();
  translate(0,0,+5);
    rect(0,0,width,height);
  popMatrix();
  fill(255);
  
   gunEnemySpawn();
   zombieSpawn();
   ammoSpawn();
  
 //drawBuildingFloor();
  
  for (int i = gameObjects.size() - 1 ; i >= 0  ; i --)
  {
    GameObject go = gameObjects.get(i); 
    go.update();
    go.render();    
  }
  
  bow.render();
  bow.update();
    
  stroke(255, 0, 0);
  line(mouseX , mouseY , mouseX + 15, mouseY);
  line(mouseX, mouseY , mouseX, mouseY - 15);
  line(mouseX, mouseY, mouseX - 15, mouseY);
  line(mouseX, mouseY, mouseX, mouseY+ 15);
  noFill();
  ellipse(mouseX, mouseY, 30, 30);
  
  globalInput();
}