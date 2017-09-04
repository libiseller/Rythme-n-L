/*

 Stefan Libiseller
 Studentnumber: 1853988
 
 Final Assignment "Rythme n°L"
 Creative Technology, Programming for We Create Identity (P4WCI)
 
 Version: Final 1.0
 09/2016 - 10/2016
 
 */

import processing.sound.*;    //import sound library

SoundFile tycho;    //declaration SoundFile

PFont font30;       //declaration PFont

static final int CONSTdiameterRingA = 800;      //Outer diameter of the outer circles (rotor, "blue" & "green")
static final int CONSTdiameterRingB = 570;      //Inner diameter of the outer circles (rotor, "blue" & "green")
static final int CONSTdiameterRingC = 300;      //Diameter of the grey circles in the middle
float diameterRingA;     //influenced outer diameter of the outer circles (rotor, "blue" & "green") by keypressed, calculated in 
float diameterRingB;     //influenced inner diameter of the outer circles (rotor, "blue" & "green") by keypressed
float diameterRingC;     //influenced diameter of the grey circles in the middle by keypressed

float popRingA = 0;      //this value will be increased on key press; it is added to diameterRingA in function calcRingDiameters
float popRingB = 0;      //this value will be increased on key press; it is added to diameterRingB in function calcRingDiameters
float popRingC = 0;      //this value will be increased on key press; it is added to diameterRingC in function calcRingDiameters

float rotorAxis;         //current angle of rotor axis
float mainAxis;          //current angle of main axis (red-blue border)
float planetAxis;        //current angle of axis which all plants are attatched to

float rotorVelocity = 0;       //current speed of rotor axis (degrees per frame)
float mainVelocity = 0;        //current speed of main axis  (degrees per frame)
float planetVelocity = -0.3;   //current speed of planet axis (degrees per frame)

boolean musicPlaying = false;    //true when music is playing
boolean isSunShinig = false;     //true when the sun should be/is "shinig" (moved outwards to be visible)
boolean arePlanetsOrbiting = false;  //true when the moving circles should be/are visible

int stage = 0;            /*counter for the stages of the introduction animation
                          0: welcomeScreen, 1: redBlue, 2: rotor, 3: grey, 4: planets and sun (everything potentially visible and influenceable)*/

Artwork rythmeL;          //declare object rythmeL of class Artwork

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

void setup() {

  size(700, 638);     //set the screen size
  noCursor();         //do not display the cursor, it distracts from the artwork
  smooth(4);          //use anti-aliasing
  frameRate(60);      //set the famerate

  font30 = loadFont("AvenirNext-UltraLight-30.vlw");   //load font for welcome screen
  setColourPalettes();  //assign all colours
  tycho = new SoundFile(this, "L.mp3");   //mp3 song is loaded
  rythmeL = new Artwork();
}  

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

void draw() {

  calcRingDiameters();      //calculate current RingDiameters depending popRing values

  rotorAxis = (rotorAxis + rotorVelocity)%360;   //rotate the axis of the artwork every frame py adding the speed to current position; modulo 360 to subtract full turns
  mainAxis = (mainAxis + mainVelocity)%360;
  planetAxis = (planetAxis + planetVelocity)%360;

  switch(stage) {    //stage is influenced by class artwork, and by the user when pressing space at the beginning
  case 0:
    rythmeL.welcomeScreen();   //draw text and two lines
    break;
  case 1:
    rythmeL.redBlue();         //expand the lines to red and blue backgound
    break;
  case 2:                      
    rythmeL.rotor();           //reveals the rotor and draws the outer circle
    rotorVelocity = -0.15;     //start rotor to turn, span velocity of the artwork should be same value for good effect
    break;
  case 3:
    rythmeL.grey();            //gray circles in the middle exmand
    mainVelocity = -0.05;      //the blue-red border begins to turn
    break;
  case 4:
    rythmeL.planetsAndSun();   //method of fully functional dynamic artwork, last stage
    break;
  }
}

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

void keyPressed()
{

  if (key == 'b') {             //press "b" for effect for the base drum
    popRingA = 50;              //load popRingA with value 50; gets decreased over time to 0 for animation
  } else if (key == ' ') {      //press "s" for effect of the snare drum
    popRingC = 20;              //load popRingC with value 50; gets decreased over time to 0 for animation
    if (stage == 0) {           //if stage is zero start playing music and go to next stage
      tycho.play();
      stage++;
    }
  } else if (key == 's' && stage == 4) {   //if "s" is pressed in the 4th stage isSunShinig is toggled, which triggers the animation for the sun to be revealed
    isSunShinig = !isSunShinig;
  } else if (key == 'p' && stage == 4) {   //if "p" is pressed in the 4th stage arePlanetsOrbiting is toggled, which triggers the animation for the planets to be revealed
    arePlanetsOrbiting = !arePlanetsOrbiting;
  } else if (key == CODED) {
    if (keyCode == UP) {
      planetVelocity = planetVelocity + 0.1;    //press up arrow key to increase planet velocity
    } else if (keyCode == DOWN) {
      planetVelocity = planetVelocity - 0.1;    //press down arrow key to decrease planet velocity
    } else if (keyCode == LEFT) {
      rotorVelocity = rotorVelocity - 0.1;      //press left arrow key to decrease rotor velocity
    } else if (keyCode == RIGHT) {
      rotorVelocity = rotorVelocity + 0.1;      //press right arrow key to increase rotor velocity
    }
  }

  /*
    If Number 1 - 6 are pressed, rings of the inner grey circle change colour to one of the rainbow palette colours
   
   Index 8: grey Influenced by Numberkeys
   Index 3: Rainbow 
   
   This structure is ONLY IF and not IF ELSE because two keys could be pressed at the same time
   */
  if (key == '1') {
    colourPalette[8][5] = colourPalette[3][0];
  }
  if (key == '2') {
    colourPalette[8][4] = colourPalette[3][1];
  }
  if (key == '3') {
    colourPalette[8][3] = colourPalette[3][2];
  }
  if (key == '4') {
    colourPalette[8][2] = colourPalette[3][3];
  }
  if (key == '5') {
    colourPalette[8][1] = colourPalette[3][4];
  }
  if (key == '6') {
    colourPalette[8][0] = colourPalette[3][5];
  }
}

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
/*
   If Number 1 - 6 are released, they change colour back to grey, which is loaded from the grey constant palette
 
 Index 8: grey Influenced by Numberkeys
 Index 4: grey Constant
 
 This structure is ONLY IF and not IF ELSE because two keys could be released at the same time
 */
void keyReleased() {

  if (key == '1') {
    colourPalette[8][5] = colourPalette[4][5];
  }
  if (key == '2') {
    colourPalette[8][4] = colourPalette[4][4];
  }
  if (key == '3') {
    colourPalette[8][3] = colourPalette[4][3];
  }
  if (key == '4') {
    colourPalette[8][2] = colourPalette[4][2];
  }
  if (key == '5') {
    colourPalette[8][1] = colourPalette[4][1];
  }
  if (key == '6') {
    colourPalette[8][0] = colourPalette[4][0];
  }
}

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
/* This function calculates the current ring diameters for animation
   It is called by the draw method and therefore executed every frame
*/

void calcRingDiameters() {

  diameterRingA = CONSTdiameterRingA + popRingA;
  if (popRingA > 0)
  {
    popRingA = popRingA - 2;    //decrease (faster) for smooth return to initial position
  }


  diameterRingB = CONSTdiameterRingB + popRingB;
  if (popRingB > 0)
  {
    popRingB--;     //decrease for smooth return to initial position
  }

  diameterRingC = CONSTdiameterRingC + popRingC;
  if (popRingC > 0)
  {
    popRingC--;    //decrease for smooth return to initial position
  }
}