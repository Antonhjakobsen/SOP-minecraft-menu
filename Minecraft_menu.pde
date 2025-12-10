import processing.sound.*;
PFont MinecraftSeven;
boolean flip;
PImage Panorama_1;
PImage Panorama_2;
PImage Panorama_3;
PImage Panorama_4;
float boxHeight;
int textSize;
SoundFile sound;
Box Singleplayer;
int fa;
int i;
void setup() {
  boxHeight=100;
  textSize=64;
  Panorama_1 = loadImage("Panorama/Panorama_1.png");
  Panorama_2 = loadImage("Panorama/Panorama_2.png");
  MinecraftSeven = createFont("Minecraft Seven/Minecraft Seven_2.ttf", textSize);
  textFont(MinecraftSeven);
  sound = new SoundFile(this, "klik.wav");
  fullScreen();
  drawStartBoxes();
  Singleplayer.drawBox();
  pixelDensity(1);
  fa = 0;
  frameRate(120);
}

void draw() {
  background(0);
  fa=fa-1;
  Panorama();
  Singleplayer.hoverDetect();
  Singleplayer.hoverDrawBox();
  Singleplayer.drawText();
}

void Panorama() {
  for (i=i; i>fa-1; i=i-1) {
    image(Panorama_2, i+Panorama_1.width, 0);
    image(Panorama_1, i, 0);
    image(Panorama_1, i+Panorama_1.width+Panorama_2.width, 0);
  }
  if (i==-4096) {
    i=0;
    fa=0;
  }
}

void mousePressed() {
  Singleplayer.boxSound();
  flip=true;
}

void mouseReleased() {
  flip=false;
}

void drawStartBoxes() {
  Singleplayer = new Box(width/6, width-(width/6)*2, height/3+boxHeight, height/3, "Singleplayer");
  
}
