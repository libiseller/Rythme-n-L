/*
  
  All colours are decared here.
  There are 9 palettes, each containing 6 colours.

*/




color[][] colourPalette = new color[9][6];  //number of Palettes, number of colors per palette


void setColourPalettes(){ 
  
  colourPalette[0][0] = #AE8660;    //blue
  colourPalette[0][1] = #8FABD4;
  colourPalette[0][2] = #9A4E2D;
  colourPalette[0][3] = #9CA9AD;
  colourPalette[0][4] = #4064AD;
  colourPalette[0][5] = #AF1F1C;
  
  colourPalette[1][0] = #C6AE25;    //green
  colourPalette[1][1] = #3C8642;
  colourPalette[1][2] = #8B9999;
  colourPalette[1][3] = #8AB05D;
  colourPalette[1][4] = #5B808A;
  colourPalette[1][5] = #2A616D;
  
  for(int i = 0; i<= 5; i++){       //justred
    colourPalette[2][i] = #BA2727;
  }
 
  colourPalette[3][5] = #e74c3c;    //rainbow
  colourPalette[3][4] = #e67e22;
  colourPalette[3][3] = #f1c40f;
  colourPalette[3][2] = #2ecc71;   
  colourPalette[3][1] = #3498db;  
  colourPalette[3][0] = #9b59b6;
  
  colourPalette[4][0] = #A7B5B6;    //grey
  colourPalette[4][1] = #CFDCE2; 
  colourPalette[4][2] = #60666E; 
  colourPalette[4][3] = #7A8588; 
  colourPalette[4][4] = #363840; 
  colourPalette[4][5] = #99A4A9; 
  
  for(int i = 0; i<= 5; i++){       //justblue
    colourPalette[5][i] = #0B2277;
  }
  
    for(int i = 0; i<= 5; i++){     //justyellow
    colourPalette[6][i] = #E4E942;
  }

  colourPalette[7][0] = #D0450A;    //orange
  colourPalette[7][1] = #9DB5C1; 
  colourPalette[7][2] = #CCC127; 
  colourPalette[7][3] = #D0450A; 
  colourPalette[7][4] = #C7CBBA; 
  colourPalette[7][5] = #A0D35D; 
  
  colourPalette[8][0] = colourPalette[4][0];      //greyInfluendByNumbers, copy from grey
  colourPalette[8][1] = colourPalette[4][1]; 
  colourPalette[8][2] = colourPalette[4][2]; 
  colourPalette[8][3] = colourPalette[4][3]; 
  colourPalette[8][4] = colourPalette[4][4]; 
  colourPalette[8][5] = colourPalette[4][5];
  
}

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

/*This function returns the index of a colourPalette from given name

  returns -1 if name not found.


*/

int getColourPaletteIndexFromName(String name)    
{
  int index = -1;
  
  switch(name){
    case "blue":
      index = 0;
      break;
    case "green":
      index = 1;
      break;
    case "justred":
      index = 2;
      break;
    case "rainbow":
      index = 3;
      break;
    case "grey":
      index = 4;
      break;
    case "justblue":
      index = 5;
      break;
    case "justyellow":
      index = 6;
      break; 
    case "orange":
      index = 7;
      break;
    case "greyInfluendByNumbers":
      index = 8;
  }
  
  return index;
}