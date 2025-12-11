class Box {
  float xV1;//x-værdi for start af boks
  float xV2;//bredde af boks
  float yV1;//y-værdi for start af boks
  float yV2;//højde af boks
  float xV3;//x-værdi for start af ikon
  float yV3;//y-værdi for start af ikon
  color inactiveColor = color(205);
  color activeColor = color(155);
  String Text;
  color lighting = color(225);
  PImage Image;
  float iconScaler=1;
  Box(float xV1, float xV2, float yV1, float yV2, String Text, PImage Image, float xV3, float yV3) {
    this.Text = Text;
    this.xV1 = xV1;
    this.xV2 = xV2;
    this.yV1 = yV1;
    this.yV2 = yV2;
    this.Image=Image;
    this.xV3=xV3;
    this.yV3=yV3;
  }

  void drawBox() {
    rect(xV1, yV1, xV2, yV2);
    stroke(lighting);
    rect(xV1+strokeWeight,yV1+strokeWeight,xV2-strokeWeight*2,0);
    rect(xV1+strokeWeight,yV1+strokeWeight,0,yV2-strokeWeight*2);
    fill(0);
  }

  boolean hoverDetect() {
    boolean hover = false;
    if (mouseX>xV1&&mouseX<xV2+xV1&&mouseY>yV1&&mouseY<yV2+yV1) {
      hover=true;
    } else {
      hover=false;
    }
    return hover;
  }

  void hoverDrawBox() {
    if (hoverDetect()==true) {
      fill(activeColor);
      stroke(255);
      drawBox();
      drawText();
    } else if (hoverDetect()==false) {
      stroke(0);
      fill(inactiveColor);
      drawBox();
    }
  }
  void boxClick() {
    if (hoverDetect()==true&&mousePressed==true&&flip==false) {
      sound.play();
    }
  }
  void drawText() {
    float c = textWidth(Text);
    textFont(MinecraftSeven);
    text(Text, xV1+xV2/2-c/2, yV1+yV2/2+textSize/2);
  }
  
  void iconScalerSet(){
  for (int u=0; u < 500; u++) {
    scaleWidthIcon = Image.width * iconScaler;
    if (scaleWidthIcon > iconMax) {
      iconScaler=iconScaler*0.99;
    } else if (scaleWidthIcon < iconMin) {
      iconScaler=iconScaler*1.01;
    } else{
     break; 
    }
  }
}
  
  void displayImage(){
    pushMatrix();
    scale(iconScaler);
   image(this.Image,xV3/iconScaler+boxHeight/8.5,yV3/iconScaler+boxHeight/8.5);
   popMatrix();
  }
  
  void Engine(){
      this.hoverDetect();
      this.hoverDrawBox();
      this.drawText();
      this.displayImage();
  }
}
