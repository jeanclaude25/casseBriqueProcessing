class Balls {
  PVector position, velocity, energie, dissipation;
  
  float size;
  PVector gravity = new PVector(0, 0.01);
  boolean isDead;
  
  color ballColor;
  
  float timeColor = 120;
  int badCollision = 0;
  
  boolean sensX = false;
  boolean sensY = false;
  
  Balls(){
    isDead = false;
    size = 10;
    position = new PVector(width/2, height/2);
    velocity = new PVector(1, 1);
    energie = new PVector(0, 1);
    dissipation = new PVector(0, 1);
    ballColor = color(255);
    }
    
   public void draw(){
    
                   velocity.add(gravity);
                   position.add(velocity);
                   collideEnvironment();
                   
                   ballStyle();
                   circle(position.x, position.y, size);
                   
                   calculateIfBallIsDead();
                 }
                 
   
   private void ballStyle(){
                       if(badCollision > 0){
                                           float col = map(timeColor,0,120,255,0);
                                           if(timeColor>0){ timeColor--; }
                                           ballColor = color(255,col,col);
                                           }
                        fill(ballColor);
                        stroke(ballColor);
                       }
   
   public boolean IsNotDead(){ return isDead; }
   
   private void calculateIfBallIsDead(){
     float safeOffset = 10.0;
      if(position.x > width + safeOffset || position.x < 0 - safeOffset || position.y > height + safeOffset || position.y < - 2 * height){
        isDead = true;
      }
   }
   
   private void collideEnvironment(){
           //float sensY = 1;
           //float sensX = 1;
          boolean reverseY = false; 
          boolean reverseX = false; 
          List<Brique> _briques = _level.getBriques();
            
              for (Brique brique : _briques) {
                if (brique.getCollide(position.x, position.y)) {
                      reverseY = !reverseY;
                      reverseX = !reverseX;
                  }
              }
              sensY = reverseY;
    sensX = reverseX;
          if(collidePlateau()){velocity.add(energie); }
          if(collideFloor()){
                            //velocity.sub(dissipation); 
                            badCollision++; timeColor = 120;
                            }
          

           
           if(collideFloor()||collidePlateau()){ sensY = !sensY; }
           if(collideWall()){ sensX = !sensX; }
    
          velocity.y *= sensY ? -1 : 1;
          velocity.x *= sensX ? -1 : 1;
   }

private boolean collideFloor() { return position.y > height ? true : false; }
private boolean collideWall() { return position.x > width || position.x < 0 ? true : false; }
private boolean collidePlateau(){ return _level.getPlayerLocal().getCollide(position.x, position.y);}


}
