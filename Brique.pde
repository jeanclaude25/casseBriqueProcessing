class Brique{
    float WIDTH = 20;
    float THICKNESS = 5;
    float positionX, positionY;
    
    float startX, endX, startY, endY;
    
    float timeColor = 120;
    color bricColor = color(255);
    
    int badCollision = 0;
    int life = 1;
    boolean isDead = false;
    
  
  Brique(float tempPositionX, float tempPositionY){
      positionX = tempPositionX;
      positionY = tempPositionY;
      
      startX = tempPositionX;
      endX = tempPositionX + WIDTH;
      
      startY = tempPositionY;
      endY = tempPositionY + THICKNESS;
      
    }
    
    
           public void draw(){
                   
                   bricStyle();
                   rect(positionX, positionY, WIDTH, THICKNESS);
                 }
                 
                 
           private void bricStyle(){
                         //modulo plutot
                         if(badCollision > 0){
                                             float col = map(timeColor,0,120,255,0);
                                             if(timeColor>0){ timeColor--; }
                                             bricColor = color(255,col,col);
                                             }
                                   fill(bricColor);
                                   stroke(0,0,255);
                                 }
          
                       
                                 
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
