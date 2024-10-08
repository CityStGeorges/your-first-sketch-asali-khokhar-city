float x;
float y;
float rectLength = 60;
float speed = 1;
float red = 128;

void setup()
{
  size(400, 400);
  rectMode(CENTER);
  x = width/2;
  y = height/2;
  fill(0);
}

void draw()
{
  background(100);
  fill(red, 128, 128);
  rect(x, y, rectLength, rectLength);
}

void keyPressed()
{
  if (keyCode == UP || key == 'w')
  {
    y -= speed;
  }
  
  else if (keyCode == DOWN || key == 's')
  {
    y += speed;
  }
  
  if (keyCode == LEFT || key == 'a')
  {
    x -= speed;
  }
  
  else if (keyCode == RIGHT || key == 'd')
  {
    x += speed;
  }
  
  if (key == 'R')
  {
    red += 10;
  }
  
  if (key == 'r')
  {
    red -= 10;
  }
}
