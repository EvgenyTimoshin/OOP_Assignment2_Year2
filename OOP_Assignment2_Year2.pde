import ddf.minim.*;
import java.*;

void setup()
{
  //size(1920, 1080, P3D);
  fullScreen(P3D);
  camera();
  frameRate(80);
  //noCursor();
  minim = new Minim(this);
  audio = new Audio();
  /////////////////////
  //Spawn Game Objects on launch
  ///////////////////////
  ui = new GUI();
  player = new Player(width / 2, height / 2, 0, 50, color(0,0,255));
  gameObjects.add(player);
  clock = new Clock();
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
  highscore = loadStrings("data/highscore.txt");
}

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
  }
}

void gameRunning()
{
  frameRate(80);
  background(255);
  stroke(255,0,0);
  mapTextures();
  noFill();
  pushMatrix();
  translate(0,0,+5);
  rect(-width*2,-height*2,width*4,height*4);
  popMatrix();
  fill(255);
  
  zombieSpawn();
  //gunEnemySpawn();
  //ammoSpawn();
  //text(dist(player.pos.x,player.pos.y,width,height),width/2,height/2 + 100);
  //trader.render();
  //trader.update();
 //drawBuildingFloor();
  for (int i = gameObjects.size() - 1 ; i >= 0  ; i --)
  {
    GameObject go = gameObjects.get(i); 
    go.update();
    go.render();    
  }  
  globalInput();
}

void mainMenu()
{
  background(0);
  stroke(255, 0 , 0);
  rect(width/2-200, height/2 , 400, 250);
  fill(0, 255, 0 );
  textSize(40);
  text("SURVIVE",width/2 - 80,height/2 + 140);
  
  fill(255, 0, 0);
  textSize(70);
  text("HIGHSCORE", width/2 - 195, height/2 - 400);
  fill(#53D322);
  text(highscore[0], width/2 - 35, height/2 - 300);
  textSize(20);
  text("Date : " + highscore[1] + " / " + highscore[2] + " / " + highscore[3], width/2 - 80, height/2 - 250);
  text("Time : "  + highscore[4] + " : " + highscore[5], width/2 - 60, height/2 - 220);
  
  fill(#D3D322);
  textSize(30);
  text(" W, A, S, D to move \n R to swtich Weapon \n T to toggle torch \n Mouse to Aim + Shoot",30, 900);
  
  if(mouseX < width/2 + 200 && mouseX > width/2 - 200
     && mouseY > height/2 && mouseY < height/2  + 250)
  {
       fill(255, 0 , 0);
       
       if(mousePressed)
       {
         gameState = 2;
       }
  }
  else
  {
    fill(0);
  }
  
}