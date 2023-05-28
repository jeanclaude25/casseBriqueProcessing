class Brique{
    float Largeur = 100;
    float Hauteur = 20;
    float positionX, positionY;
    
  
  Brique(float tempPositionX, float tempPositionY){
      positionX = tempPositionX;
      positionY = tempPositionY;
      
    }
    
    
           public void draw(){
                   
                   bricStyle();
                   rect(positionX, positionY, Largeur, Hauteur);
                 }
                 
                 
           private void bricStyle(){
                                   fill(255);
                                   stroke(255);
                                 }
    
    
}
