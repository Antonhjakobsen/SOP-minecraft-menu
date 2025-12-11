class Box {
  float xV1;//x-værdi for start af boks
  float xV2;//bredde af boks
  float yV1;//y-værdi for start af boks
  float yV2;//højde af boks
  color inactiveColor = color(205);
  color activeColor = color(155);
  String Text;
  color lighting = color(225);
  PImage Image;
  Box(float xV1, float xV2, float yV1, float yV2, String Text, PImage Image) {
    this.Text = Text;
    this.xV1 = xV1;
    this.xV2 = xV2;
    this.yV1 = yV1;
    this.yV2 = yV2;
    this.Image=Image;
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
  void displayImage(){
   image(this.Image,xV1+boxHeight*0.125,yV1+boxHeight*0.125);
  }
  void Engine(){
      this.hoverDetect();
      this.hoverDrawBox();
      this.drawText();
      this.displayImage();
  }
}
