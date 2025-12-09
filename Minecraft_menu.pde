Box backToGame;
void setup(){
fullScreen();
backToGame = new Box(width/6,width-(width/6)*2,100,200);
backToGame.drawBox();
pixelDensity(1);
}

void draw(){
    background(0);
  backToGame.hoverDetect();
  backToGame.hoverDrawBox();
  Test();
}

void Test(){
 String test="";
 if(backToGame.hoverDetect()==true){
  test="true"; 
 } else{
  test="false"; 
 }
 text(test,width/2,height/2);
}
