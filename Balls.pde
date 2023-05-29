class Balls {
  PVector position, velocity, dissipation;
  float maxBallVelocity = 6.0;
  
  float size;
  PVector gravity = new PVector(0, 0.01);
  boolean isDead;
  
  color ballColor;
  
  float timeColor = 60;
  float timeBricCollisionColor = 60;
  boolean floorHit = false;
  boolean bricHit = false;
  int badCollisionCount = 0;
  int bricCollisionCount = 0;
  
  boolean sensX = false;
  boolean sensY = false;
  
  Balls(PVector pos){
    isDead = false;
    size = 10;
    position = pos;
    velocity = new PVector(1, 1);
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
                       if (bricCollisionCount > 0 && bricHit) {
                                                  float col1 = map(timeBricCollisionColor, 0, 120, 255, 0);
                                                  if (timeBricCollisionColor > 0) { timeBricCollisionColor--; }else{bricHit = false;}
                                                  
                                                  if (badCollisionCount > 0 && floorHit) {
                                                                            float col2 = map(timeColor, 0, 120, 255, 0);
                                                                            if (timeColor > 0) {
                                                                                timeColor--;
                                                                            }else{floorHit=false;}
                                                                            
                                                                            float mixedRed = (col1 + 255) / 2;  // Mélange des composantes rouges
                                                                            float mixedGreen = col1 / 2;        // Mélange des composantes vertes
                                                                            float mixedBlue = (col2 + 255) / 2; // Mélange des composantes bleues
                                                                            
                                                                            ballColor = color(mixedRed, mixedGreen, mixedBlue);
                                                  } else {
                                                          ballColor = color(col1, col1, 255);
                                                          }
                                                  
                                                  }else if (badCollisionCount > 0 && floorHit) {
                                                                  float col = map(timeColor, 0, 120, 255, 0);
                                                                  if (timeColor > 0) { timeColor--; }else{floorHit=false;}
                                                                  ballColor = color(255, col, col);
                                                   }else{ ballColor = color(255); }
                        fill(ballColor);
                        stroke(ballColor);
                       }
   
   public boolean IsNotDead(){ return !isDead; }
   public boolean IsDead(){ return isDead; }
   
   private void calculateIfBallIsDead(){
     float safeOffset = 10.0;
      if(position.x > width + safeOffset || position.x < 0 - safeOffset || position.y > height + safeOffset || position.y < - 2 * height){
        isDead = true;
      }
   }
   
   private void collideEnvironment(){
           //float sensY = 1;
           //float sensX = 1;
          collideBrique();
              
          if(collidePlateau()){ increaseEnergie(new PVector(0, 1)); }
          if(collideFloor()){
                            //velocity.sub(dissipation); 
                            badCollisionCount++; floorHit = true; timeColor = 60;
                            }
          

           
           if(collideFloor()||collidePlateau()||collideSky()){ sensY = !sensY; }
           if(collideWall()){ sensX = !sensX; }
    
          velocity.y *= sensY ? -1 : 1;
          velocity.x *= sensX ? -1 : 1;
   }

private void increaseEnergie(PVector e){
                                           if(velocity.x < maxBallVelocity && velocity.y < maxBallVelocity){ 
                                              velocity.add(e);
                                            }             
                                          }

private void collideBrique(){
                                    boolean reverseY = false; 
                                    boolean reverseX = false;
                                    
                                    List<Brique> _briques = _level.getBriques();
                                      
                                        for (Brique brique : _briques) {
                                                      if(brique.IsNotDead()){
                                                                if (brique.getCollide(position.x, position.y)) {
                                                                      bricCollisionCount++;
                                                                      bricHit = true;
                                                                      timeBricCollisionColor = 60;
                                                                      reverseY = !reverseY;
                                                                      reverseX = !reverseX;
                                                                  }
                                                                }
                                        }
                                        sensY = reverseY;
                                        sensX = reverseX; 
                          }
                          
private boolean collideSky() { return position.y < 0 ? true : false; }
private boolean collideFloor() { return position.y > height ? true : false; }
private boolean collideWall() { return position.x > width || position.x < 0 ? true : false; }
private boolean collidePlateau(){ return _level.getPlayerLocal().getCollide(position.x, position.y);}


}
