void setup()
{
  size(1920, 1080, P3D);
  Player player = new Player(width / 2, height / 2, 0, 50, 255);
  gameObjects.add(player);
  camera();
}

ArrayList<GameObject>gameObjects = new ArrayList<GameObject>();
boolean[] keys = new boolean[1000];
float timeDelta = 1.0f / 60.0f;

void draw()
{
  background(0);
  
  line(0-1000000,0,100000,0);
  line(0-1000000,height,1000000,height);
  for(int i = 0 - 1000000; i < 1000000; i +=100)
  {
    stroke(255);
    line(i,0,i,height);
  }
  if(frameCount % 120 == 0)
  {
    Enemy m = new Enemy(random(0,width), random(0,height), 0, 50, 255);
    gameObjects.add(m);
  }
  for (int i = gameObjects.size() -1 ; i >= 0  ; i --)
  {
    GameObject go = gameObjects.get(i); 
    go.update();
    go.render();    
  }
}