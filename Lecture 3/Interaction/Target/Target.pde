float circleX;
float circleY;
float radius;
boolean shotFired = false;

void setup()
{
  size(500,500);
  background(0);
  circleX = width/2;
  circleY = height/2;
  radius = 25;
}

void draw()
{
// -- check on distance from mouse to circle centre:
if (dist(circleX,circleY,mouseX,mouseY) < radius) {
  // -- within circle - do something
  fill(255,128,64);
  if (shotFired)
  {
    background(0);
    radius = random(15,30);
    circleX = random(radius,width-radius);
    circleY = random(radius,height-radius);
    shotFired = false;
  }
} else {
  // -- outside circle - do something else
  fill(255);
}
 
  // -- draw the circle
  circle(circleX,circleY,radius*2);
}

void mouseClicked()
{
  shotFired = true;
}
