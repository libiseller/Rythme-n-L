 
  /*
   
  Fundamental drawing functions for this program
  
  */
  
  void drawStripes(int quantity, float positionX, float positionY, float diameter, float angle_degrees_begin, float angle_degrees_end, String colourPaletteName)
  {
    noStroke();
    ellipseMode(CENTER); 

    int palette_index = getColourPaletteIndexFromName(colourPaletteName);   //get colour index

    float angle_temp_end;
    float angle_temp_begin;
    for (int n = 0; n <= quantity; n++) {     //loop for rings
      angle_temp_begin = ((angle_degrees_begin)+(n*(angle_degrees_end - angle_degrees_begin)/(2*quantity)))*PI/180;  //calc begin angle
      angle_temp_end = ((angle_degrees_end)-(n*(angle_degrees_end - angle_degrees_begin)/(2*quantity)))*PI/180;   //calc end angle
      fill(color(colourPalette[palette_index][(n%6)]));    //fill with colour from palette
      arc(positionX, positionY, diameter, diameter, angle_temp_begin, angle_temp_end);  //draw arc
    }
  }

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

  void drawCircles(int quantity, float positionX, float positionY, float diameter_min, float diameter_max, String colourPaletteName)
  {
    noStroke();
    ellipseMode(CENTER); 

    float diameter = diameter_max;   //begin with biggest
    int palette_index = getColourPaletteIndexFromName(colourPaletteName);  //get colour index

    for (int n = 1; n <= quantity; n++) {  //loop for rings
      fill(color(colourPalette[palette_index][(n-1)%6]));   //assign colour
      ellipse(positionX, positionY, diameter, diameter);   //draw circle
      diameter = diameter - ((diameter_max - diameter_min)/quantity) ;  //calculate next diameter
    }
  }

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

  void drawCircleSegments(int quantity, float positionX, float positionY, float diameter_min, float diameter_max, float angle_degrees_begin, float angle_degrees_end, String colourPaletteName)
  {
    noStroke();
    ellipseMode(CENTER); 

    float diameter = diameter_max;    //begin with biggest
    int palette_index = getColourPaletteIndexFromName(colourPaletteName);   //get colour index

    for (int n = 1; n <= quantity; n++) {    //loop for rings
      fill(color(colourPalette[palette_index][(n-1)%6]));    //assign colour
      arc(positionX, positionY, diameter, diameter, (angle_degrees_begin*PI/180), (angle_degrees_end*PI/180));  //draw arc
      diameter = diameter - ((diameter_max - diameter_min)/quantity);   //calculate next diameter
    }
  }

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

  void drawLightenSegment(float diameter, float angle_degrees_begin, float angle_degrees_end)
  {
    noStroke();
    ellipseMode(CENTER); 

    fill(#FFFFFF, 140);   //white, transparent 
    arc(width/2, height/2, diameter, diameter, angle_degrees_begin*PI/180, angle_degrees_end*PI/180);   //draw segment
  }

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

  void drawLightenCircles(float positionX, float positionY, float diameter)
  {
    noStroke();
    ellipseMode(CENTER);
    fill(#FFFFFF, 140);  //white, transparent 
    ellipse(positionX, positionY, diameter, diameter);  //draw circle
  }