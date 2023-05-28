import java.util.ArrayList;
import java.util.List;

class Level {
    
  FX screenFX;
  Balls _balls;
  Plateau _plateau;
  
  List<Brique> _briques;

  
    Level(){
      
      screenFX = new FX();
      _balls = new Balls();
      _plateau = new Plateau();
      
      
      _briques = new ArrayList<>();
      
      for (int i = 10; i <= 750; i += 10) {
                  _briques.add(new Brique(i, i % 20 == 0 ? 310 : 300));
              }
      }
    
    public void draw(){
      
                    screenFX.draw();
                    if(!_balls.IsNotDead()){_balls.draw();}
                    _plateau.draw();
                    
                    for (Brique brique : _briques) {
                                                        brique.draw();
                                                    }
                    }
                    
   public Plateau getPlayerLocal(){ return _plateau; }
   public List<Brique> getBriques(){ return _briques; };
    
    
}
