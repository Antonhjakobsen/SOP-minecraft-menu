class Box {
  float xV1;//x-værdi for start af boks
  float xV2;//bredde af boks
  float yV1;//y-værdi for start af boks
  float yV2;//højde af boks
  float OGxV1 = xV1;
  float OGxV2 = xV2;
  float OGyV1 = yV1;
  float OGyV2 = yV2;
  color activeColor = color(105);
  color inactiveColor = color(175);
  String Text;
  Box(float xV1, float xV2, float yV1, float yV2, String Text) {
    this.Text = Text;
    this.xV1 = xV1;
    this.xV2 = xV2;
    this.yV1 = yV1;
    this.yV2 = yV2;
  }

  void drawBox() {
    rect(xV1, yV1, xV2, yV2);
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
      drawBox();
    } else if (hoverDetect()==false) {
      fill(inactiveColor);
      drawBox();
    }
  }
  void boxSound() {
    if (hoverDetect()==true&&mousePressed==true&&flip==false) {
      sound.play();
    }
  }
  void drawText() {
    float c = textWidth(Text);
    float boxLength = xV1-xV2;
    textFont(MinecraftSeven);
    text(Text, xV2+boxLength/2, yV1+(yV1-yV2)+textSize);
  }

}
