class Level {
    
  FX screenFX;
  Balls ball;
  Plateau playerLocal;

  
    Level(){
      
      screenFX = new FX();
      ball = new Balls();
      playerLocal = new Plateau();
      
      }
    
    public void draw(){
      
                    screenFX.draw();
                    if(!ball.IsNotDead()){ball.draw();}
                    playerLocal.draw();
                    
                    }
    
    
}
