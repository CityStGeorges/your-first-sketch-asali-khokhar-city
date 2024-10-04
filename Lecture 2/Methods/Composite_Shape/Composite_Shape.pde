void setup()
{
  size(400,400);
  textAlign(CENTER);
}

void draw()
{
  background(255);
  drawFace(width/2,height/2, 5);
}

void drawFace(float xCenter, float yCenter, float scale)
{
  strokeWeight(2*scale);
  fill(255);
  circle(xCenter,yCenter,60*scale);
  fill(0);
  circle(xCenter-(20*scale),yCenter,15*scale);
  circle(xCenter+(20*scale),yCenter,15*scale);
  textSize(20*scale);
  text("w",xCenter,yCenter+20*scale);
}
