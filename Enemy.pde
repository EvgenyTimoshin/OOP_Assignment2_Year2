class Enemy extends GameObject
{
  Boolean stuck;
  Boolean spotted;
  float distanceFromPlayer;
  PVector accel;
  PVector velocity;
  PVector force;
  int health;
  color c;
  float mass;
  float power = 200;
  
  void render(){};
  
  void update(){};
}