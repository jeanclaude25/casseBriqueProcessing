import ddf.minim.*;
Minim minim;
AudioPlayer bricSong, plateauSong, wallSong;

Level _level;
int difficulty = 40;


void setup(){
  
  
size(800, 800, P2D);
//fullScreen();
frameRate(240);
orientation(LANDSCAPE);

minim = new Minim(this);
bricSong = minim.loadFile("bricSong.mp3");
plateauSong = minim.loadFile("bricSong.mp3");
wallSong = minim.loadFile("bricSong.mp3");

_level = new Level(10, difficulty);
_level.getUI().setLevelNumber(difficulty);
//hint(DISABLE_DEPTH_MASK);

}




void draw(){



// probleme de conditions
if(_level.getBallsNumber() < 1 || _level.getBriquesNumber() < 1){
  if(_level.getBallsNumber() < 1 && difficulty > 1){ difficulty --;}
  if(_level.getBriquesNumber() < 1){difficulty++;}
  
_level = new Level((int) random(1, 11), difficulty); 
}

_level.draw();
_level.getUI().setLevelNumber(difficulty);
}

void stop() {
  bricSong.close();
  plateauSong.close();
  wallSong.close();
  minim.stop();
  super.stop();
}
