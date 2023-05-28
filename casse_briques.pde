
Level _level;

void setup(){
  
size(800, 800, P2D);
//fullScreen();
frameRate(240);
orientation(LANDSCAPE);

_level = new Level();

hint(DISABLE_DEPTH_MASK);

}




void draw(){

_level.draw();

}
