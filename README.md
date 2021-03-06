# Graphics-HW-1

## Part A:

![Part A Screenshot](Images/Part%20A.png)

A scene in unity which has three different objects, three distinct lights, and three different shaders applied. The bear object on the far left has a vertex displacement shader rotating the object which also changes the color of the bear based on normals.  

The fox model in the middle has a Phong shader applied which reflects light in the scene as well as applying two different textures to the model. One half of the model has a traditional orange fox texture while the other half has a more stylized red fox texture. This model uses a script to rotate its position. 

The ram model on the far right has only a Phong shader applied to it and is rotated with the same script rotating the fox. Attempts to use Blend One One have fallen short in getting multiple lights to reflect their colors off of this model at runtime, although they seem to appear in the editor.  For now, Blend One One has been commented out as it will turn the entire model white on the display although sometimes when it is on the display will show all lights reflecting momentarily. 

Three point lights are used in the scene which oscillate back and forth on either the X or Y axis. One is white, one is red, and the last is aqua.

## Part B:

![Part B Screenshot](Images/Part%20B%20.png)

A scene in unity which uses a shader to create a blurred effect on the texture applied to a plane. Two buttons on the side of the plane will either increase or decrease the blurring effect when clicked. 

## Part C:

![Part C Screenshot](Images/Part%20C.png)

A scene in unity which displays a Game of Life cellular automata shader upon a cube. Cells that are alive are colored blue, cells that have recently come back to life are colored green, and cells that are dead are colored red. The cellular automata shader handles the determination of which cells are alive/dead and then the information is passed to the output shader which actually prints that color information to the screen. 

This seems to work just fine in the Unity editor, however, attempts to build it have caused a texture missing error that I have been unable to resolve. 
