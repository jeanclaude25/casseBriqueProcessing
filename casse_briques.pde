
Level game;

void setup(){
  
size(800, 800, P2D);
//fullScreen();
frameRate(240);
orientation(LANDSCAPE);

game = new Level();

hint(DISABLE_DEPTH_MASK);

}




void draw(){

game.draw();

}
