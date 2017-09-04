Rythme n°L
------

Final Assignment "Programming for We Create Identity (P4WCI)" 2016
Creative Technology 
University of Twente  

## Synopsis
You will see an introduction which builds up the main structure of the painting “Rythme n°1” by Robert Delaunay. Simultaneously the song “L” by the band “Tycho” is playing. Together they create a guidance for interaction and establish the connection between the user and the dynamic painting.
I chose this painting because of the rich colors and it seemed perfect to bring it to life in music.

![Rhythm n°1 by Robert Delaunay](https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/Robert_Delaunay%2C_1938%2C_Rythme_n%C2%B01%2C_Decoration_for_the_Salon_des_Tuileries%2C_oil_on_canvas%2C_Mus%C3%A9e_d%27Art_Moderne_de_la_ville_de_Paris.jpg/800px-Robert_Delaunay%2C_1938%2C_Rythme_n%C2%B01%2C_Decoration_for_the_Salon_des_Tuileries%2C_oil_on_canvas%2C_Mus%C3%A9e_d%27Art_Moderne_de_la_ville_de_Paris.jpg)


## Usage
1. Press space to start, just look: Red and Blue Background expands, music starts, the Rotor reveals itself and draws the outer circles. Then grey half-circles in the middle are introduced.
2. Try to hit “b” to the bass drum.
3. Play to the melody on the number keys 1-6.
4. Press “s” to let the sun rise and enjoy the rainbow it produces.
5. Press “p” to make it even more colourful and let the planets orbit.
6. Change the speed of the rotor and the planets with the arrow key. left/right => concentrate on the top part of the rotor to get the directions right. Up/down, focus on the left planet.
7. Try to create cool visual effects that fit the beat.  (Creative Technology Application: This program could also be mapped to the drums of an e-drum set which triggers the animations/e-piano for the melody)


## Interactivity
- “b”: Animates the outer circles to pop (press when base is hit)
- Space: Animates the inner circles to pop (press when snare is hit)
- 1 - 6: Makes two rings of the inner circles change colour (use for melody, like a piano)
Up/Down: Change speed of planets
- Left/right: Change speed of rainbow rotor
- “s”: let the sun rise/set
- “p”: reveal/hide the planets

## Architecture 
- draw
    - calculation of the ring diameters for pop
    - call of the function of class Artwork corresponding to current state (switch)
    - add velocity to position of the three (main, planet, rotor) axis
- class Artwork
    - contains methods for drawing different stages of artwork intro + finished artwork
- colourPalette
    - store all the colours
    - get method to resolve index from name
    - drawFunctions
    - drawStripes
    - drawCircles
    - drawCircleSegments
    - drawLightenCircles
    - drawLightenSegment

--------

## Missing Files
In this publication, essential files are excluded due to copyright regulations.

If you happen to own the rights for the following files, execution will be possible:

- Folder "data"
    - L.mp3 (04m38s, 11.105.316 byte)
    - AvenirNext-UltraLight-30.vlw (Font, 87.823 bytes)

