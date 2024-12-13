String[] rawData;
String[][][][] data;
Mood[] allDays;
int hour;
int x = 100;
int y = 100;

/*
{
{ { {0, Very Sad}, {25, Sad} }, {{...}}, {{...}} } ,
{ { {5, Sad}, {35, Neutral} }, {{...}}, {{...}} } ,
{ ... }
{ ... }
}

*/

/*
{{Mood}, {Music}, {Art}}
{{{0, Very Sad}, {25, Sad}}, {{40, Start, 48: End}}, {{40: Start, 42: End}}}
*/

void setup() {
  
  frameRate(1);
  
  size(1250,200);
  background(0);
  
  rawData = loadStrings("moodData.txt");
  
  data = new String [rawData.length][3][20][2];
  
  allDays = new Mood[rawData.length];
  
  loadData();
  
}

void draw() {  
  background(0);
  for (int i = 0; i < data.length; i++)
  {
    allDays[i].draw();
  }
  
  fill(255);
  text("Hour: " + frameCount%48, 20, 20);
}

void loadData() {

  // Video Data
  for (int i=0; i< rawData.length; i++)
  {
  
    String [] dataItems = split(rawData[i], ".");
    
    for (int j = 0; j < dataItems.length; j++)
    {
      //println(dataItems[j]);
      
      String [] dataItemsItems = split(dataItems[j], ",");
      
      for (int k = 0; k < dataItemsItems.length; k++)
      {
        //println(dataItemsItems[k]);
        String [] dataItemsItemsItems = split(dataItemsItems[k], ":");
        
        for (int m = 0; m < dataItemsItemsItems.length; m++)
        { 
          //println(dataItemsItemsItems[m]);
          data[i][j][k][m] = dataItemsItemsItems[m];
        }
      }
    }
  }
  // USED TO CHECK IF DATA IMPORTED CORRECTLY
  /*
  for (int i = 0; i < data.length; i++)
  {
    println("Day " + i);
    for (int j = 0; j < data[i].length; j++)
    {
      if (j == 0) { println("Mood:"); }
      else if (j == 1) { println("Music:"); }
      else if (j == 2) { println("Art:"); }
      for (int k = 0; k < data[i][j].length; k++)
      {
        if (data[i][j][k][1] != null)
        {
          printArray(data[i][j][k]);
        }
      }
    }
  }
  */
  
  for (int i = 0; i < data.length; i++)
  {
    allDays[i] = new Mood(i, data[i][0], data[i][1], data[i][2], x, y);
    x += 150;
  }

  
  
}
