//To Do, add the printlns to verify the values
//Algorithm works when image is bigger than the CANVAS, not smaller
//Different Algorithm is necessary - work to get above 65%
//
//Global Variables
int appWidth, appHeight;
float backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight;
float picWidthAdjusted=0.0, picHeightAdjusted=0.0;
PImage pic;
Boolean nightMode=true;
int tintDayMode=255, tintDayModeOpacity=50,tintRed=128, tintGreen=60, TintBlue=40, tintNightModeOpacity=100;
//
void setup()
{
  size(1000, 800); //Landscape
  //Copy Display Algorithm from Hello World
  appWidth = width;
  appHeight = height;
  //
  //Image Dimensions for Aspect Ratio
  //MW-IE203_corona_20200409232441_ZH.jpg
  //Note: Dimensions are found in the image file / Right Click / Properties / Details
  int picWidth = 800;
  int picHeight = 600;
  //
  //Image Orientation: Landscape, Square, Portrait
  float smallerDimension, largerDimension, imageWidthRatio=0.0, imageHeightRatio=0.0;
  Boolean widthLarger=false, heightLarger=false;
  if ( picWidth >= picHeight ) { //True if Landscape or Square
    largerDimension = picWidth;
    smallerDimension = picHeight;
    widthLarger = true;
  } else { //False if Portrait
    largerDimension = picHeight;
    smallerDimension = picWidth;
    heightLarger = true;
  }
  //
  //Teaching Example: width is known to be larger
  //Better Image Stretch Algorithm
  if ( appWidth >= picWidth ) {
    picWidthAdjusted = appWidth; //Stretching larger dimension
    //
    if ( widthLarger == true ) imageWidthRatio = largerDimension / largerDimension;
    //
    if ( appHeight >= picHeight ) {
      //Calculated Dimension b/c smaller than width
      if ( widthLarger == true ) imageHeightRatio = smallerDimension / largerDimension;
      picHeightAdjusted = picWidthAdjusted * imageHeightRatio;
      if ( appHeight < picHeightAdjusted ) {
        println("STOP: image is too big for CANVAS");
        exit(); //stop further use of the APP
      }
    } else {
      //Image smaller than CANVAS needs separate algorithm
      println("CANVAS is smaller than Image");
    }
  } else {
    //Image smaller than CANVAS, needs separate algorithm
    println("CANVAS is smaller than Image");
  }
  //
  //Population
  pic = loadImage("../Image Used/MW-IE203_corona_20200409232441_ZH.jpg");
  backgroundImageX = appWidth*0;
  backgroundImageY = appHeight*0;
  backgroundImageWidth = appWidth-1;
  backgroundImageHeight = appHeight-1;
  //
  //Verify Variable Values after Algorithm
  println("App Width:", appWidth, " and App Height:", appHeight);
  println("Image dimensions are:", picWidth, picHeight);
  println("Larger Image dimension is:", largerDimension);
  println("Adjusted Image dimesnions are (stretch is goal):", picWidthAdjusted, picHeightAdjusted);
  //
  //Rectangular Layout and Image Drawing to CANVAS
  //rect( backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight );
  //
  //Background Image must be single executed code
  if ( nightMode == false ) tint(tintDayMode, tintDayModeOpacity); //Gray Scale, Day use: use 1/2 tint value for white (i.e. 128/256=1/2)
  if ( nightMode == true ) tint(tintRed, tintGreen, TintBlue, tintNightModeOpacity); //RGB: Night Mode
  image( pic, backgroundImageX, backgroundImageY, picWidthAdjusted, picHeightAdjusted);
}//End setup
//
void draw() {
}//End draw
//
void keyPressed() {
}//End keyPressed
//
void mousePressed() {
  //  
  //Mouse Pressed will control background image
  if ( mouseButton == LEFT) {
    nightMode = true;
    
    tint(tintRed, tintGreen, TintBlue, tintNightModeOpacity); //RGB: Night Mode
    image( pic, backgroundImageX, backgroundImageY, picWidthAdjusted, picHeightAdjusted);
  }
  if ( mouseButton == RIGHT ) {
    nightMode = false;
    rect(backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight);
    tint(tintDayMode, tintDayModeOpacity); //Gray Scale: use 1/2 tint value for white (i.e. 128/256=1/2)
    image(pic, backgroundImageX, backgroundImageY, picWidthAdjusted, picHeightAdjusted);
  }
}//End mousePressed
//
//End Main Program
