void setup()
{
  //size(1920, 1080, P3D);
  fullScreen(P3D);
  Player player = new Player(width / 2, height / 2, 0, 50, color(0,0,255));
  gameObjects.add(player);
  for(int i = 0; i < 1080; i += 350)
  {
    createBuilding(i , 300, 300, 10);
  }
  camera();
  frameRate(120);
}

ArrayList<GameObject>gameObjects = new ArrayList<GameObject>();
boolean[] keys = new boolean[1000];
float timeDelta = 1.0f / 60.0f;
Boolean enemies = false;

void draw()
{
  background(#0D6F01);
  noFill();
  println(frameRate);
  rect(0,0,width,height);
  fill(255);
  if(keyPressed && key == 'e')
  {
    enemies = true;
  }
  if(enemies == true)
  {
  enemiesSpawn();
  }
  //ammoSpawn();
  
  drawBuildingFloor();
  
  for (int i = gameObjects.size() - 1 ; i >= 0  ; i --)
  {
    GameObject go = gameObjects.get(i); 
    go.update();
    go.render();    
  }
}

void gameOver()
{
  
}