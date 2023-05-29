class Brique{
    float WIDTH = 50;
    float THICKNESS = 20;
    float positionX, positionY;
    float cornerRadius = 2;
    
    float startX, endX, startY, endY;
    
    float timeColor = 120;
    color startColor = color(0, 191, 255); // Bleu clair (RVB : 0, 191, 255)
color endColor = color(0, 0, 128);    // Bleu foncé (RVB : 0, 0, 128)
    color bricColor = color(255);
    
    int badCollision = 0;
    int life = 1;
    boolean isDead = false;
    
  
  Brique(float tempPositionX, float tempPositionY){
        WIDTH = map(difficulty, 1, 40, 50, 20);
        THICKNESS = map(difficulty, 1, 40, 20, 5); 
     
    positionX = tempPositionX;
      positionY = tempPositionY;
      
      startX = tempPositionX;
      endX = tempPositionX + WIDTH;
      
      startY = tempPositionY;
      endY = tempPositionY + THICKNESS;
      
    }
    
    
           public void draw(){
                   
                   bricStyle();
                   rect(positionX, positionY, WIDTH, THICKNESS, cornerRadius);
                   if(badCollision > life){ isDead = true; }
                 }
                 
                 
           private void bricStyle(){
                         //modulo plutot
                         if(badCollision > 0){
                                             float col = map(timeColor,0,120,255,0);
                                             if(timeColor>0){ timeColor--; }
                                             bricColor = color(255,col,col);
                                             }
                                   
                                  float factor = map(badCollision, 0, life, 0, 1); // Facteur d'interpolation en fonction du nombre de collisions

                                  bricColor = lerpColor(startColor, endColor, factor);

                                   fill(bricColor);
                                   noStroke();
                                   //stroke(0,0,255);
                                 }
          
         public boolean IsNotDead(){ return !isDead; }             
         public boolean IsDead(){ return isDead; }
         
         public boolean getCollide(float x, float y){
                                         if(x > startX && x < endX && y > startY && y< endY){
                                                                                             timeColor = 120;
                                                                                             badCollision++;
                                                                                             return true;
                                                                                           }else{
                                                                                           return false;
                                                                                           }
                                                                                  }
    
    
}
