import ddf.minim.*;

void setup()
{
  //size(1920, 1080, P3D);
  fullScreen(P3D);
  
  /////////////////////
  //Spawn Game Objects on launch
  ///////////////////////
  Player player = new Player(width / 2, height / 2, 0, 50, color(0,0,255));
  gameObjects.add(player);
  Clock clock = new Clock();
  gameObjects.add(clock);
  Gun gun = new Gun();
  gameObjects.add(gun);
  for(int i = 0; i < 1080; i += 350)
  {
    createBuilding(i , 300, 300, 10);
  }
  camera();
  frameRate(120);
  
  font = loadFont("Zombie-Noize-48.vlw");
  ///////////
  //Sounds
  ////////
  minim = new Minim(this);
  gunShot = minim.loadSnippet("gunShot.mp3");
  death = minim.loadSnippet("death.mp3");
  levelUp = minim.loadSnippet("levelUp.mp3");
  playerShot = minim.loadSnippet("playerShot.mp3");
  forestAmbience = minim.loadFile("forestAmbience.mp3");
  nightSong = minim.loadFile("nightSong.mp3");
  heartBeat = minim.loadSnippet("heartBeat.mp3");
  bowFired = minim.loadSnippet("bow.mp3");
  forestAmbience.play();
  bow = new Bow();
  torch = new Torch();
  background = loadImage("grass.jpg");
  background.resize(width,height);
}

AudioSnippet gunShot;
AudioSnippet death;
AudioSnippet levelUp;
AudioSnippet playerShot;
AudioPlayer forestAmbience;
AudioPlayer nightSong;
AudioSnippet heartBeat;
AudioSnippet bowFired;
Minim minim;
PFont font;
PImage background;
ArrayList<GameObject>gameObjects = new ArrayList<GameObject>();
Bow bow;
Torch torch;
boolean[] keys = new boolean[1000];
float timeDelta = 1.0f / 60.0f;
Boolean enemies = true;

void draw()
{
  //println(frameRate);
  //background(#0D6F01);
  for(int j = -height*3; j < height*4; j+= height)
  {
    for(int i = -width*3; i < width*4; i +=width)
    {
    image(background,i,j);
  }
  }
  
  noFill();
  //println(frameRate);
  println(gameObjects.size());
  rect(0,0,width,height);
  fill(255);
  if(keyPressed && key == 'e')
  {
    
    Player p = (Player) gameObjects.get(0);
    
    if(p.gunEquipped == true)
    {
      p.gunEquipped = false;
    }
    else
    {
      p.gunEquipped = true;
    }
  }
  if(enemies == true)
  {
  enemiesSpawn();
  bow.render();
  bow.update();
  }
  //ammoSpawn();
  
  drawBuildingFloor();
  
  for (int i = gameObjects.size() - 1 ; i >= 0  ; i --)
  {
    GameObject go = gameObjects.get(i); 
    go.update();
    go.render();    
  }
  
  torch.update();
  torch.render();
  
  stroke(255, 0, 0);
  line(mouseX , mouseY , mouseX + 15, mouseY);
  line(mouseX, mouseY , mouseX, mouseY - 15);
  line(mouseX, mouseY, mouseX - 15, mouseY);
  line(mouseX, mouseY, mouseX, mouseY+ 15);
  noFill();
  ellipse(mouseX, mouseY, 30, 30);
  
  globalInput();
}

void gameOver()
{
  
}