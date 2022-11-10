//To Do, add the printlns to verify the values
//Algorithm works when image is bigger than the CANVAS, not smaller
//Different Algorithm is necessary - work to get above 65%
//
//Global Variables
int appWidth, appHeight;
float backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight;
float topX, topY, topWidth, topHeight, buttomX, buttomY, buttomWidth, buttomHeight;
float picWidthAdjusted=0.0, picHeightAdjusted=0.0;
PImage pic, pic2, pic3;
Boolean nightMode=true;
int tintDayMode=255, tintDayModeOpacity=50, tintRed=128, tintGreen=60, TintBlue=40, tintNightModeOpacity=100;
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
  int picWidth = 890;
  int picHeight = 501;
  int picWidth2 = 693;
  int picHeight2 = 520;
  //int picWidth3 = 800;
  //int picHeight3 = 1000;
  //
  //Image Orientation: Landscape, Square, Portrait
    float smallerDimension, largerDimension, imageWidthRatio=0.0, imageHeightRatio=0.0;
  float smallerDimension2, largerDimension2, imageWidthRatio2=0.0, imageHeightRatio2=0.0;
  float smallerDimension3, largerDimension3, imageWidthRatio3=0.0, imageHeightRatio3=0.0;
  Boolean widthLarger=false, heightLarger=false, widthLarger2=false, heightLarger2=false;;
   if ( picWidth >= picHeight ) { //True if Landscape or Square
    largerDimension = picWidth;
    smallerDimension = picHeight;
    widthLarger = true;
  } else { //False if Portrait
    largerDimension = picHeight;
    smallerDimension = picWidth;
    heightLarger = true;
  }
  if ( picWidth2 >= picHeight2 ) { //True if Landscape or Square
    largerDimension2 = picWidth2;
    smallerDimension2 = picHeight2;
    widthLarger2 = true;
    //Landscape Image larger image to smaller rectangle (or larger)
    picWidthAdjusted2 = picWidth2; //stretch or reduce
    imageHeightRatio2 = smallerDimension2 / largerDimension2;
    picHeightAdjusted2 = picWidthAdjusted2 * imageHeightRatio2;
  } else { //False if Portrait
    largerDimension2 = picHeight2;
    smallerDimension2 = picWidth2;
    heightLarger2 = true;
    //Portrait Image larger image to smaller rectangle (or larger)
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
  pic = loadImage("../Image Used/Landscape/MW-IE203_corona_20200409232441_ZH.jpg");
  pic2 = loadImage("../Image Used/Landscape/kyG95j.jpg");
  pic2 = loadImage("../Image Used/Portrait/HD-wallpaper-gojo-cursed-spirits-domain-expansion-hollow-purple-jujutsu-kaisen-void.jpg");
  backgroundImageX = appWidth*0;
  backgroundImageY = appHeight*0;
  backgroundImageWidth = appWidth-1;
  backgroundImageHeight = appHeight-1;
  topX = appWidth * 1/4;
  topY = appHeight * 1/20;
  topWidth = appWidth * 1/2;
  topHeight = appHeight * 13/20;
  bottomX = appWidth *1/2;
  bottomY = appHeight * 3/4;
  bottomWidth = appWidth * 1/4;
  bottomHeight = appHeight * 4/20;
  //
  //Verify Variable Values after Algorithm
  println("App Width:", appWidth, " and App Height:", appHeight);
  println("Image dimensions are:", picWidth, picHeight);
  println("Larger Image dimension is:", largerDimension);
  println("Adjusted Image dimesnions are (stretch is goal):", picWidthAdjusted, picHeightAdjusted);
  //
  //Rectangular Layout and Image Drawing to CANVAS
  //rect( backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight );
  rect( 120, 49, 769, 348 );
  rect( 120, 400, 769, 348 );
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
    rect(backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight);
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
