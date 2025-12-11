import processing.sound.*;
PFont MinecraftSeven;
boolean flip;
PImage Panorama_1;
PImage Panorama_2;
float boxHeight;
float textSize;
SoundFile sound;
Box Singleplayer;
Box Multiplayer;
Box MinecraftRealms;
Box Options;
Box Quit;
Box Language;
Box Accessibility;
int panCounter;
int i;
float strokeWeight;
PImage Title;
float titleScaler;
float titleMin;
float titleMax;
float scaleWidth;
float paddingButtons;
PImage Empty;
PImage Klode;
PImage AccessibilityIcon1;
void setup() {
  AccessibilityIcon1=loadImage("Panorama/Accessibility.png");
  Klode=loadImage("Panorama/Klode.png");
  Empty=loadImage("Empty.png");
  paddingButtons=width/64;
  titleMax=width*0.505;
  titleMin=width*0.495;
  titleScaler=1;
  Title=loadImage("Panorama/Minecraft-title.png");
  strokeWeight=height/256;
  strokeWeight(strokeWeight);
  boxHeight=height/10.24;
  textSize=height/19.69;
  Panorama_1 = loadImage("Panorama/Panorama_1.png");
  Panorama_2 = loadImage("Panorama/Panorama_2.png");
  MinecraftSeven = createFont("Minecraft Seven/Minecraft Seven_2.ttf", textSize);
  textFont(MinecraftSeven);
  sound = new SoundFile(this, "klik.wav");
  fullScreen();
  drawStartBoxes();
  pixelDensity(1);
  panCounter = 0;
}

void draw() {
  background(0);
  startScreen();
}
void Panorama() {
  for (i=i; i>panCounter-1; i=i-1) {
    image(Panorama_2, i+Panorama_1.width, 0);
    image(Panorama_1, i, 0);
    image(Panorama_1, i+Panorama_1.width+Panorama_2.width, 0);
  }
  if (i==-4096) {
    i=0;
    panCounter=0;
  }
}

void title() {
  for (int n=0; n < 500; n++) {
    scaleWidth = Title.width * titleScaler;
    if (scaleWidth > titleMax) {
      titleScaler=titleScaler*0.99;
    } else if (scaleWidth < titleMin) {
      titleScaler=titleScaler*1.01;
    }
  }
  pushMatrix();
  scale(titleScaler);
  image(Title, (width/4)/titleScaler, height/-10.24);
  popMatrix();
}

void mousePressed() {
  startBoxClick();
  flip=true;
}

void mouseReleased() {
  flip=false;
}

void drawStartBoxes() {
  Singleplayer = new Box(width/4, width-(width/4)*2, height/4, boxHeight, "Singleplayer",Empty);
  Multiplayer = new Box(width/4, width-(width/4)*2, height/4+paddingButtons+boxHeight, boxHeight, "Multiplayer",Empty);
  MinecraftRealms = new Box(width/4, width-(width/4)*2, height/4+paddingButtons*2+boxHeight*2, boxHeight, "Minecraft Realms",Empty);
  Options = new Box(width/4, width-(width/4)*3-paddingButtons, height/4+paddingButtons*5+boxHeight*3, boxHeight, "Options",Empty);
  Quit = new Box(width/2+paddingButtons, width-(width/4)*3-paddingButtons, height/4+paddingButtons*5+boxHeight*3, boxHeight, "Quit game",Empty);
  Language = new Box(width/4-boxHeight-paddingButtons,boxHeight,height/4+paddingButtons*5+boxHeight*3,boxHeight,"",Klode);
  Accessibility = new Box(width/2+paddingButtons*2+width-(width/4)*3-paddingButtons,boxHeight,height/4+paddingButtons*5+boxHeight*3,boxHeight,"",AccessibilityIcon1);
}

void startScreen(){
  panCounter=panCounter-1;
  Panorama();
  Singleplayer.Engine();
  Multiplayer.Engine();
  MinecraftRealms.Engine();
  Options.Engine();
  Quit.Engine();
  Language.Engine();
  Accessibility.Engine();
  title();
}

void startBoxClick(){
   Singleplayer.boxClick();
  Multiplayer.boxClick();
  MinecraftRealms.boxClick();
  Options.boxClick();
  Quit.boxClick();
  Language.boxClick();
  Accessibility.boxClick(); 
}
