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
  for (int i = gameObjects.size() -1 ; i >= 0  ; i --)
  {
    GameObject go = gameObjects.get(i); 
    go.update();
    go.render();    
  }
}