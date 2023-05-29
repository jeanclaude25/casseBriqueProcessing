
Level _level;

void setup(){
  
size(800, 800, P2D);
//fullScreen();
frameRate(240);
orientation(LANDSCAPE);

_level = new Level(1);

//hint(DISABLE_DEPTH_MASK);

}




void draw(){

if(_level.getBallsNumber() < 1 || _level.getBriquesNumber() < 1){ _level = new Level((int) random(1, 11)); }
_level.draw();

}
