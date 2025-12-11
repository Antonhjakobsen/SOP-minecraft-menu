import processing.sound.*;
PFont MinecraftSeven;
boolean flip;
PImage Panorama_1;
PImage Panorama_2;
float boxHeight;
float textSize;
SoundFile sound;
SoundFile BG1;
SoundFile BG2;
SoundFile BG3;
SoundFile BG4;
SoundFile BG5;
SoundFile BG6;
SoundFile BG7;
SoundFile BG8;
SoundFile BG9;
Box Singleplayer;
Box Multiplayer;
Box MinecraftRealms;
Box Options;
Box Quit;
Box Language;
Box Accessibility;
Box Pin1;
Box Pin2;
Box Pin3;
int panCounter;
int i;
float strokeWeight;
PImage Title;
float titleScaler;
float titleMin;
float titleMax;
float scaleWidthTitle;
float scaleWidthIcon;
float iconMin;
float iconMax;
float paddingButtons;
PImage Empty;
PImage Klode;
PImage AccessibilityIcon1;
PImage Pin;
float randomMusik;
color yellowText;

void setup() {
  yellowText=color(255,255,0);
  titleScaler=1;
  noSmooth();
  BG1=new SoundFile(this, "Baggrundsmusik/1.mp3");
  BG2=new SoundFile(this, "Baggrundsmusik/2.mp3");
  BG3=new SoundFile(this, "Baggrundsmusik/3.mp3");
  BG4=new SoundFile(this, "Baggrundsmusik/4.mp3");
  BG5=new SoundFile(this, "Baggrundsmusik/5.mp3");
  BG6=new SoundFile(this, "Baggrundsmusik/6.mp3");
  BG7=new SoundFile(this, "Baggrundsmusik/7.mp3");
  BG8=new SoundFile(this, "Baggrundsmusik/8.mp3");
  BG9=new SoundFile(this, "Baggrundsmusik/9.mp3");

  AccessibilityIcon1=loadImage("Panorama/Accessibility.png");
  Klode=loadImage("Panorama/Klode.png");
  Empty=loadImage("Empty.png");
  Pin=loadImage("Panorama/Pin.png");

  paddingButtons=width/64;
  titleMax=width*0.505;
  titleMin=width*0.495;

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
  makeStartBoxes();
  Language.iconScalerSet();
  Accessibility.iconScalerSet();
  makeStartBoxes();
  pixelDensity(1);
  panCounter = 0;
  iconMin=boxHeight*0.799;
  iconMax=boxHeight*0.801;
  backgroundMusic();
  titleScalerSet();
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

void makeStartBoxes() {
  Singleplayer = new Box(width/4, width-(width/4)*2, height/4, boxHeight, "Singleplayer", Empty, 0, 0);
  Multiplayer = new Box(width/4, width-(width/4)*2, height/4+paddingButtons+boxHeight, boxHeight, "Multiplayer", Empty, 0, 0);
  MinecraftRealms = new Box(width/4, width-(width/4)*2, height/4+paddingButtons*2+boxHeight*2, boxHeight, "Minecraft Realms", Empty, 0, 0);
  Options = new Box(width/4, width-(width/4)*3-paddingButtons, height/4+paddingButtons*5+boxHeight*3, boxHeight, "Options...", Empty, 0, 0);
  Quit = new Box(width/2+paddingButtons, width-(width/4)*3-paddingButtons, height/4+paddingButtons*5+boxHeight*3, boxHeight, "Quit game", Empty, 0, 0);
  Language = new Box(width/4-boxHeight-paddingButtons, boxHeight, height/4+paddingButtons*5+boxHeight*3, boxHeight, "", Klode, width/4-boxHeight-paddingButtons, height/4+paddingButtons*5+boxHeight*3);
  Accessibility = new Box(width/2+paddingButtons*2+width-(width/4)*3-paddingButtons, boxHeight, height/4+paddingButtons*5+boxHeight*3, boxHeight, "", AccessibilityIcon1, width/2+paddingButtons*2+width-(width/4)*3-paddingButtons, height/4+paddingButtons*5+boxHeight*3);
  Pin1 = new Box(paddingButtons*3, boxHeight, height/4+paddingButtons*3+boxHeight*1, boxHeight, "", Pin,paddingButtons*width/576-paddingButtons/width*Language.iconScaler,height/4+paddingButtons*3+boxHeight);//Language png fil har samme størrelse som pin png filen, og kan derfor godt anvendes
  Pin2 = new Box(paddingButtons*3, boxHeight, height/4+paddingButtons*4+boxHeight*2, boxHeight, "", Pin,paddingButtons*width/576-paddingButtons/width*Language.iconScaler,height/4+paddingButtons*4+boxHeight*2);
  Pin3 = new Box(paddingButtons*3, boxHeight, height/4+paddingButtons*5+boxHeight*3, boxHeight, "", Pin,paddingButtons*width/576-paddingButtons/width*Language.iconScaler,height/4+paddingButtons*5+boxHeight*3);
}

void startScreen() {
  panCounter=panCounter-1;
  Panorama();
  Singleplayer.Engine();//Denne er indsat for at fikse indstillingerne, som bliver ændre af yellowText(); ved ikke en anden måde udover dette hvorpå det kan fikses
  Singleplayer.Engine();
  Multiplayer.Engine();
  MinecraftRealms.Engine();
  Options.Engine();
  Quit.Engine();
  Language.Engine();
  Accessibility.Engine();
  Pin1.Engine();
  Pin2.Engine();
  Pin3.Engine();
  title();
  yellowText();
  musicPlay();
}

void startBoxClick() {
  Singleplayer.boxClick();
  Multiplayer.boxClick();
  MinecraftRealms.boxClick();
  Options.boxClick();
  Quit.boxClick();
  Language.boxClick();
  Accessibility.boxClick();
  Pin1.boxClick();
  Pin2.boxClick();
  Pin3.boxClick();
}

void backgroundMusic() {
  randomMusik=ceil(random(9));
  if (randomMusik==1) {
    BG1.play();
  } else if (randomMusik==2) {
    BG2.play();
  } else if (randomMusik==3) {
    BG3.play();
  } else if (randomMusik==4) {
    BG4.play();
  } else if (randomMusik==5) {
    BG5.play();
  } else if (randomMusik==6) {
    BG6.play();
  } else if (randomMusik==7) {
    BG7.play();
  } else if (randomMusik==8) {
    BG8.play();
  } else {
    BG9.play();
  }
}

void titleScalerSet() {
  for (int n=0; n < 500; n++) {
    scaleWidthTitle = Title.width * titleScaler;
    if (scaleWidthTitle > titleMax) {
      titleScaler=titleScaler*0.99;
    } else if (scaleWidthTitle < titleMin) {
      titleScaler=titleScaler*1.01;
    } else {
      break;
    }
  }
}

void yellowText(){
  pushMatrix();
  textSize(height/60);
  fill(yellowText);
  rotate(radians(-10));
  translate(0-width/32,height/5);
  text("The yellow text is cool", width/1.5,height/6);
  fill(255);
  textSize=height/19.69;
  popMatrix();
}

void musicPlay(){
 if(BG1.isPlaying()==false&&BG2.isPlaying()==false&&BG3.isPlaying()==false&&BG4.isPlaying()==false&&BG5.isPlaying()==false&&BG6.isPlaying()==false&&BG7.isPlaying()==false&&BG8.isPlaying()==false&&BG9.isPlaying()==false){
   backgroundMusic();
 }
}
