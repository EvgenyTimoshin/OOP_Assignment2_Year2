void keyPressed()
{ 
  keys[keyCode] = true;
}
 
void keyReleased()
{
  keys[keyCode] = false; 
  //player.velocity.x = player.velocity.x * 0.96;
  //player.velocity.y = player.velocity.y * 0.96;
}

boolean checkKey(int k)
{
  if (keys.length >= k) 
  {
    return keys[k] || keys[Character.toUpperCase(k)];  
  }
  return false;
}

void globalInput()
{
  if(checkKey('t'))
  {
    if(torch.state == false)
    {
      torch.state = true;
    }
    else
    {
      torch.state = false;
    }
  }
}