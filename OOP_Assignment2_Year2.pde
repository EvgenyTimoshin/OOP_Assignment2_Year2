import ddf.minim.*;
import java.*;

void setup()
{
  //size(1920, 1080, P3D);
  fullScreen(P3D);
  camera();
  frameRate(60);
  smooth(4);
  minim = new Minim(this);
  audio = new Audio();
  /////////////////////
  //Spawn Game Objects on launch
  ///////////////////////
  ui = new GUI();
  player = new Player(width / 2, height / 2, 0, 50, color(0,0,255));
  gameObjects.add(player);
  clock = new Clock();
  bow = new Bow();
  torch = new Torch();
  trader = new Trader(200, 300);
   
  Wall wall = new Wall(-width*2,-height*2,width*4, 20);
  gameObjects.add(wall);
  Wall wall2 = new Wall(width*2,-height*2,20, height*4);
  gameObjects.add(wall2);
  Wall wall3 =new Wall(-width*2, height*2, width*4, 20);
  gameObjects.add(wall3);
  Wall wall4 = new Wall(-width*2, -height*2, 20, height*4);
  gameObjects.add(wall4);
  
  font = loadFont("Zombie-Noize-48.vlw");
  audio.forestAmbience.play();
  background = loadImage("grass.jpg");
  background.resize(500, 500);
  highscore = loadStrings("data/highscore.txt");
  gameState = 3;
  spawn = new Spawn();
}

Spawn spawn;
Clock clock;
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
Boolean paused = false;
int gameState = 1;
String[] highscore;

void draw()
{
  switch(gameState)
  {
    case 1: mainMenu();
            break;
    
    case 2: gameRunning();
            break;
            
    case 3: gameOver();
            break;
  
  }         
}