
Level _level;
int difficulty = 1;

void setup(){
  
  
size(800, 800, P2D);
//fullScreen();
frameRate(240);
orientation(LANDSCAPE);

_level = new Level(100, difficulty);
//_level.getUI().setLevelNumber(difficulty);
//hint(DISABLE_DEPTH_MASK);

}




void draw(){
if(_level.getBriquesNumber() < 1){difficulty++;}
if(_level.getBallsNumber() < 1 && difficulty > 1){ difficulty --;}

// probleme de conditions
if(_level.getBallsNumber() < 1 || _level.getBriquesNumber() < 1){
 _level.getUI().setLevelNumber(difficulty);
_level = new Level((int) random(1, 11), difficulty); 
}

_level.draw();

}
