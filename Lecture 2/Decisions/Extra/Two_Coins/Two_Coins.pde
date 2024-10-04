float randomNumber;
float randomNumber2;
 
void setup()
{
  size(200, 200);
  fill(0);
  textSize(48);
  textAlign(CENTER);
 
  randomNumber = random(2.0);
  randomNumber2 = random(2.0);
}
 
void draw()
{
  background(230, 255, 230);
 
  String message;
  if (randomNumber < 1.0 && randomNumber2 < 1.0)
  {
    message = "TWO TAILS";
  }
  else if (randomNumber > 1.0 && randomNumber > 1.0 )
  {
    message = "TWO HEADS";
  }
  else
  {
    message = "MIXED";
  }
  text(message, width/2, height/2);
}
