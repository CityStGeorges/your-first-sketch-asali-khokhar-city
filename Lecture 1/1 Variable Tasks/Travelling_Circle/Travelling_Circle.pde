// Travelling Circle

float x;
float y;

void setup()
{
  size(1000, 1000);
  x = 10;
  y = 990;
  fill(0);
}

void draw()
{
  x += 1;
  y -= 1;
  background(255);
  ellipse(x, y, 60, 60);
}
