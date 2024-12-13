class Mood
{
  private int day;
  private String[][] allMoods;
  private String[][] music;
  private String[][] art;
  private PVector pos;
  private int radius = 100;
  
  private color[] moodColours = {#001BFF,#7340E3,#A140E3,#E340AD,#E3406C};
  private color moodColour, musicColour, artColour = 0;
  private color textColour = 255;
  
  private color[] musicColours = {#E36340, #E38940};
  private color[] artColours = {#E2E340, #78E340};
  
  private int hour;
  
  Mood (int d, String[][] moods, String[][] m, String[][] a, float x, float y) 
  {
    this.day = d;
    this.allMoods = moods;
    this.music = m;
    this.art = a;
    pos = new PVector (x, y);
  }
  
  Mood (int d, String[][] moods, String[][] m, String[][] a) 
  {
    this.day = d;
    this.allMoods = moods;
    this.music = m;
    this.art = a;
  }
  
  // Getters
  Integer getDay()
  {
    return this.day;
  }

  String[][] getAllMoods()
  {
    return this.allMoods;
  }
  
  String[][] getMusic()
  {
    return this.music;
  }
  
  String[][] getArt()
  {
    return this.art;
  }
  
  float getX()
  {
    return this.pos.x;
  }
  
  float getY()
  {
    return this.pos.y;
  }
  
  int getRadius()
  {
    return this.radius;
  }
  
  // Setters
  void setDay( int d )
  {
    this.day = d;
  }

  void setAllMoods( String[][] moods )
  {
    this.allMoods = moods;
  }

  void setMusic( String[][] m )
  {
    this.music = m;
  }
  
  void setArt( String[][] a )
  {
    this.art = a;
  }
  
  void setX( float x )
  {
    this.pos.x = x;
  }
  
  void setY( float y )
  {
    this.pos.y = y;
  }
  
  void setup()
  {
    //textAlign(CENTER);
    //ellipseMode(CENTER);
    strokeWeight(1);
  }
  
  void draw()
  {
    String dayStr = "Day " + this.getDay();
    fill(textColour);
    text(dayStr, pos.x-textWidth(dayStr)/2, pos.y-(radius/2+10));
    hour = frameCount % 48;
    
    
    drawMood();
    fill(moodColour);
    ellipse(pos.x, pos.y, radius, radius);
    drawMusic();
    fill(musicColour);
    ellipse(pos.x-radius/2, pos.y+radius/2, radius/3, radius/3);
    drawArt();
    fill(artColour);
    ellipse(pos.x+radius/2, pos.y+radius/2, radius/3, radius/3);
  }
  
  void drawMood()
  {
    for (String[] mood : allMoods)
    {
      if (mood[0] != null && mood[1] != null)
      {
        if (Integer.parseInt(mood[0]) == hour)
        {
          if (mood[1].equals("VerySad"))
          {
            moodColour = moodColours[0];
          }
          else if (mood[1].equals("Sad"))
          {
            moodColour = moodColours[1];
          }
          else if (mood[1].equals("Neutral"))
          {
            moodColour = moodColours[2];
          }
          else if (mood[1].equals("Happy"))
          {
            moodColour = moodColours[3];
          }
          else if (mood[1].equals("VeryHappy"))
          {
            moodColour = moodColours[4];
          }
          
          println("Mood of day " + this.getDay() + " is " + mood[1]);
        }
      }
    }
  }
  
  void drawMusic()
  {
    for (String[] m : music)
    {
      if (m[0] != null && m[1] != null)
      {
        if (Integer.parseInt(m[0]) == hour)
        {
          if (m[1].equals("Start"))
          {
            musicColour = musicColours[0];
          }
          else if (m[1].equals("End"))
          {
            musicColour = musicColours[1];
          }
        }
      }
    }
  }
  
  void drawArt()
  {
    for (String[] a : art)
    {
      if (a[0] != null && a[1] != null)
      {
        if (Integer.parseInt(a[0]) == hour)
        {
          if (a[1].equals("Start"))
          {
            artColour = artColours[0];
          }
          else if (a[1].equals("End"))
          {
            artColour = artColours[1];
          }
        }
      }
    }
  }
}
