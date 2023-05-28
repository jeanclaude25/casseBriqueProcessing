class Plateau{
    float Largeur = 100;
    float Thickness = 5;
    float start, end;
  
  Plateau(){
    }
  
  
  public void draw(){
         start = mouseX - Largeur/2;
         end = mouseX + Largeur/2;
         
         fill(255);
         stroke(255);
         rect(start, height - 50, Largeur, Thickness);
    }
  
  public boolean getCollide(float x, float y){ 
    
    return x > start && x < end && 
            y > height - 50 - Thickness && y< height - 50 + Thickness? true : false; }
  
}
