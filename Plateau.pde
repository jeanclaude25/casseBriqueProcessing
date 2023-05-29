class Plateau{
    float Largeur = 100;
    float hauteur = height - 100;
    float Thickness = 10;
    float cornerRadius = 20;
    float start, end;
  
  Plateau(){
    }
  
  
  public void draw(){
         start = mouseX - Largeur/2;
         end = mouseX + Largeur/2;
         
         fill(255);
         stroke(255);
         rect(start, hauteur, Largeur, Thickness, cornerRadius);
    }
  
  public boolean getCollide(float x, float y){ 
    
    return x > start && x < end && 
            y > hauteur - Thickness && y< hauteur + Thickness? true : false; }
  
}
