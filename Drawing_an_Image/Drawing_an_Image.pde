//Global Variables
int appWidth, appHeight;
float backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight;
PImage pic;
//
size(1000, 700); //Landscape
//Copy Display Algorithm
appWidth = width;
appHeight = height;
//
//Population
pic = loadImage("../Image Used/MW-IE203_corona_20200409232441_ZH.jpg");
tint(255, 126);  // Apply transparency without changing color
tint(128, 0, 0); //Night Mode
backgroundImageX = appWidth*0;
backgroundImageY = appHeight*0;
backgroundImageWidth = appWidth-1;
backgroundImageHeight = appHeight-1;
//
//Rectangular Layout and Image Drawing to CANVAS
rect( backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight );
//
image( pic, backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight);
