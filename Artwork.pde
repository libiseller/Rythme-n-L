class Artwork {

  int palette_index_justblue;     //store of index for colourPalette call
  int palette_index_justred; 
  
  float span_redBlue = 20;            //span of rectangles for welcomeScreen
  float span_velocity_redBlue = 0.325; //velocity of rectangles for redBlue

  float span_rotor = 0;               //if 0 rotor is not visible, if 25 rotor is fully deployed
  float span_velocity_rotor = 0.15;   //speed of which the rotor is revealed, for good effect keep in sync with rotorVelocity
  
  float build_ring_C = 0;    //variable for diameter when animating intro of gray circles in center
  
  float sun_rise = 0;        // percent of the sun + span of rainbow; 0 = not in orbit, 100 = sun is in max orbit, depends on isSunShinig
  float planet_orbit = 0;    // percent of the max height of the panets orbiting; 0 = not in orbit, 100 = planets are in max orbit, depends on arePlanetsOrbiting
  

  Artwork() {
    palette_index_justblue = getColourPaletteIndexFromName("justblue");   //get index for colourPalette
    palette_index_justred = getColourPaletteIndexFromName("justred");     //get index for colourPalette
  } 
  
  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  
  /* A text and two bars - one red, one blue - are displayed
  */

  void welcomeScreen() {

    noStroke();
    fill(color(#FFFFFF));
    rect(0, 0, width, height);              //white background

    fill(20);                               //dark gray font colour
    textFont(font30, 30);                   //use loaded font, size 30
    text("Plug in your earphones & press space to start", 50, 200);    //display text

    fill(color(colourPalette[palette_index_justblue][1]));  //blue
    rect(0, height/2, width, 20);                           //rect over whole width; 20px high
    fill(color(colourPalette[palette_index_justred][1]));   //red
    rect(0, height/2, width, -20);                          //rect over whole width; -20px high
  }
  
  
  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  
  /* The two bars extend to cover the whole screen size at the end
  */

  void redBlue() {
    
    noStroke();
    fill(color(#FFFFFF));
    rect(0, 0, width, height);    //white background

    fill(color(colourPalette[palette_index_justblue][1]));  //blue  
    rect(0, height/2, width, span_redBlue);                 //rectangle whole width, height of span
    fill(color(colourPalette[palette_index_justred][1]));   //red
    rect(0, height/2, width, -span_redBlue);                //rectangle whole width, height of -span

    if (span_redBlue < height/2)                            
    {
      span_redBlue = span_redBlue + span_velocity_redBlue;   //animate until screen is covered (1/2 each)
    } else {
      stage++;                                               //if finished go to next stage
    }
  }


  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  
  /* The rainbow rotor appears and draws the outer circles, it passes 180 degrees before switching to next stage
  */


  void rotor() {

    if (span_rotor < 25)     //animation for rotor reveal
    {
      span_rotor = span_rotor + span_velocity_rotor;
    }

    noStroke();
    fill(color(colourPalette[palette_index_justblue][1]));   //blue
    rect(0, height/2, width, height/2);                      //half the screen
    fill(color(colourPalette[palette_index_justred][1]));    //red
    rect(0, height/2, width, -height/2);                     //other half

    drawCircleSegments(10, width/2, height/2, diameterRingB, diameterRingA, rotorAxis, mainAxis, "blue");             //rotor "draws" these outer circles, blue palette
    drawCircleSegments(10, width/2, height/2, diameterRingB, diameterRingA, rotorAxis+180, mainAxis+180, "green");    //rotor "draws" these outer circles, green palette

    drawCircleSegments(6, width/2, height/2, diameterRingB, diameterRingA, rotorAxis, rotorAxis+span_rotor, "rainbow");    //outers part of rotor
    drawCircleSegments(6, width/2, height/2, diameterRingB, diameterRingA, rotorAxis+180, rotorAxis+span_rotor+180, "rainbow");  

    drawCircleSegments(1, width/2, height/2, 0, diameterRingB, mainAxis, mainAxis+180, "justblue");          //cover rotor ink
    drawCircleSegments(1, width/2, height/2, 0, diameterRingB, mainAxis-180, mainAxis, "justred");           

    drawLightenSegment(diameterRingB, rotorAxis, rotorAxis+span_rotor);                  //lighten segment from center to rotor
    drawLightenSegment(diameterRingB, rotorAxis+180, rotorAxis+span_rotor+180);          

    if (rotorAxis < -180 && stage == 2)      //when rotor has passed 180 degrees skip to next stage
    {
      stage++;
    }
  }


  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

  /* The grey circle segments in the middle are animated to appear
  */

  void grey() {
    
    noStroke();
    fill(color(colourPalette[palette_index_justblue][1]));    //blue
    rect(0, height/2, width, height/2);                       //half screen size
    fill(color(colourPalette[palette_index_justred][1]));     //red
    rect(0, height/2, width, -height/2);                      //half screen size

    drawCircleSegments(10, width/2, height/2, diameterRingB, diameterRingA, mainAxis-180, mainAxis, "blue");    //outer circles, colour palette blue
    drawCircleSegments(10, width/2, height/2, diameterRingB, diameterRingA, mainAxis, mainAxis+180, "green");   //outer circles, colour palette green

    drawCircleSegments(6, width/2, height/2, diameterRingB, diameterRingA, rotorAxis, rotorAxis+span_rotor, "rainbow");      //rainbow parts of rotor
    drawCircleSegments(6, width/2, height/2, diameterRingB, diameterRingA, rotorAxis+180, rotorAxis+span_rotor+180, "rainbow");  

    drawCircleSegments(1, width/2, height/2, 0, diameterRingB, mainAxis-180, mainAxis, "justred");   //cover up ink from center to beginning of outer rings
    drawCircleSegments(1, width/2, height/2, 0, diameterRingB, mainAxis, mainAxis+180, "justblue");  

    drawLightenSegment(diameterRingB, rotorAxis, rotorAxis+span_rotor);               //lighten from center to rotor
    drawLightenSegment(diameterRingB, rotorAxis+180, rotorAxis+span_rotor+180);

    drawCircleSegments(1, width/2, height/2, 0, build_ring_C, mainAxis, mainAxis+180, "grey");         //draw gray ring 
    drawCircleSegments(1, width/2, height/2, 0, build_ring_C-20, mainAxis, mainAxis+180, "justblue");  
    
    drawLightenSegment(build_ring_C-20, rotorAxis, rotorAxis+span_rotor);              //draw the lighen segment of the rotor which is under the blue part of gray ring
    drawLightenSegment(build_ring_C-20, rotorAxis+180, rotorAxis+span_rotor+180);      //also for other side
    
    drawCircleSegments(12, width/2, height/2, 0, build_ring_C, mainAxis-180, mainAxis, "greyInfluendByNumbers");   //draw circle segments in the center that can be influenced by 1-6 keys
    
    if (build_ring_C < CONSTdiameterRingC)    //animation of the grey circle segments
    {
      build_ring_C++;
    } else {                  //go to next stage when finished
      stage++;
    }
    
  }  

  //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

  /*This is the last stage of the painting; Planets and sun can be toggled now
  */

  void planetsAndSun() {
     
    noStroke();
    fill(color(colourPalette[palette_index_justblue][1]));   //blue
    rect(0, height/2, width, height/2);                      //half of the screen
    fill(color(colourPalette[palette_index_justred][1]));    //red
    rect(0, height/2, width, -height/2);                     //other half

    drawCircleSegments(10, width/2, height/2, diameterRingB, diameterRingA, mainAxis-180, mainAxis, "blue");  //outer circles, colour palette blue
    drawCircleSegments(10, width/2, height/2, diameterRingB, diameterRingA, mainAxis, mainAxis+180, "green"); //outer circles, colour palette green
    
    drawCircleSegments(6, width/2, height/2, diameterRingB, diameterRingA, rotorAxis, rotorAxis+span_rotor, "rainbow");   //rainbow parts of rotor
    drawCircleSegments(6, width/2, height/2, diameterRingB, diameterRingA, rotorAxis+180, rotorAxis+span_rotor+180, "rainbow");

    drawCircleSegments(1, width/2, height/2, 0, diameterRingB, mainAxis, mainAxis+180, "justblue");  //cover up ink from center to beginning of outer rings
    
    drawCircles(5, width/2 + cos((planetAxis)/180*PI)*1.6*planet_orbit, height/2 + sin((planetAxis)/180*PI)*1.6*planet_orbit, 0, 220, "orange");      //draw orange planet, 1.6*100 = 160 px off center
    drawCircles(5, width/2 + cos((planetAxis-180)/180*PI)*1.9*planet_orbit, height/2 + sin((planetAxis-180)/180*PI)*1.9*planet_orbit, 0, 160, "blue");  //draw blue planet, 1.9*100 = 190 px off center
    
    drawCircleSegments(1, width/2, height/2, 0, diameterRingB, mainAxis-180, mainAxis, "justred");  //cover up ink from center to beginning of outer rings, will cover two planets
    
    drawCircles(5, width/2 + cos((planetAxis+90)/180*PI)*1.9*planet_orbit, height/2 + sin((planetAxis+90)/180*PI)*1.9*planet_orbit, 0, 160, "green");  //draw green planet, 1.9*100 = 190 px off center
    drawCircles(7, width/2 + cos((planetAxis-90)/180*PI)*1.9*planet_orbit, height/2 + sin((planetAxis-90)/180*PI)*1.9*planet_orbit, 0, 160, "grey");  //draw grey planet, 1.9*100 = 190 px off center

    drawLightenSegment(diameterRingB, rotorAxis, rotorAxis+span_rotor);            //lighten segment from center to rotor
    drawLightenSegment(diameterRingB, rotorAxis+180, rotorAxis+span_rotor+180);
    
    //remember: sun_rise is in percent; "(100-sun_rise)*4" becomes 0 if 100% deployed - moves sun under the border of gray circles and not in center as planets
    //divison by 4 because of average (/2) and diameters (/2)
    //draw sunshine
    drawLightenCircles(width/2 + cos((mainAxis-180)/180*PI)*(diameterRingB+diameterRingC - (100-sun_rise)*4)/4, height/2 + sin((mainAxis-180)/180*PI)*(diameterRingB+diameterRingC - (100-sun_rise)*4)/4, 40+sun_rise/10*6); 
    //draw sun
    drawCircles(1, width/2 + cos((mainAxis-180)/180*PI)*(diameterRingB+diameterRingC - (100-sun_rise)*4)/4, height/2 + sin((mainAxis-180)/180*PI)*(diameterRingB+diameterRingC - (100-sun_rise)*4)/4, 0, 40, "justyellow");

    drawCircleSegments(1, width/2, height/2, 0, diameterRingC, mainAxis, mainAxis+180, "grey");        //draw grey ring opposite of the rings influenced by colour
    drawCircleSegments(1, width/2, height/2, 0, diameterRingC-20, mainAxis-180, mainAxis+180, "justblue"); //cover the grey that is to much
    
    drawLightenSegment(diameterRingC-20, rotorAxis, rotorAxis+25);            //draw rotor lighten segment again that has also been covered
    drawLightenSegment(diameterRingC-20, rotorAxis+180, rotorAxis+25+180);    
    
    drawCircleSegments(12, width/2, height/2, 0, diameterRingC, mainAxis-180, mainAxis, "greyInfluendByNumbers");   //circle segments grey that can change color
    
    drawCircleSegments(10, width/2, height/2, diameterRingB, diameterRingA, mainAxis-Math.abs(22.5*sun_rise/100), mainAxis+Math.abs(22.5*sun_rise/100), "grey");  //gray part of outer circles, opposite of sun
    drawStripes(6, width/2, height/2, diameterRingB, mainAxis-Math.abs(22.5*sun_rise/100), mainAxis+Math.abs(22.5*sun_rise/100), "rainbow");   //rainbow produced by sun, therefore dependent on sun_Rise
    
    if (isSunShinig && sun_rise < 100){    //animate sun rise
      sun_rise ++;
    } 
    else if (!isSunShinig && sun_rise > 0){
      sun_rise --;
    } 
    
    if (arePlanetsOrbiting && planet_orbit < 100){   //animate planets
      planet_orbit ++;
    } 
    else if (!arePlanetsOrbiting && planet_orbit > 0){
      planet_orbit --;
    } 
    
  }
}