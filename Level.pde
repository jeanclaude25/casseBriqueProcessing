import java.util.ArrayList;
import java.util.List;

class Level {
  int ballNumber;
  FX screenFX;
  Plateau _plateau;
  UI _ui;
  
  List<Balls> _balls;
  List<Brique> _briques;

  
    Level(int tempBalls){
      ballNumber = tempBalls-1;
      screenFX = new FX();
      _plateau = new Plateau();
      _ui = new UI();
      
      _balls = new ArrayList<>();
      _briques = new ArrayList<>();
      
      for (int i = 0; i <= ballNumber; i ++) {
      _balls.add(new Balls(new PVector(width/2+random(-100, 100), height/2 + random(-100, 100))));
      }
      
      for (int i = 10; i <= 750; i += 10) {
                  _briques.add(new Brique(i, i % 20 == 0 ? 310 : 300));
              }
      }
    
    public void draw(){
      
                    screenFX.draw();
                    _ui.draw();
                    _ui.setBricNumber( getBriquesNumber() );
                    _ui.setBallNumber( getBallsNumber() );
                    
                    _balls.removeIf(ball -> ball.IsDead());
                    for (Balls ball : _balls) {
                                                    if(ball.IsNotDead()){
                                                                          ball.draw();
                                                                          }
                                                    }
                                                    
                    
                    _briques.removeIf(brique -> brique.IsDead());
                    for (Brique brique : _briques) {
                                                    if(brique.IsNotDead()){
                                                                          brique.draw();
                                                                          }
                                                    }
                     _plateau.draw();
                    }
                    
   public Plateau getPlayerLocal(){ return _plateau; }
   public List<Brique> getBriques(){ return _briques; };
   
   public int getBallsNumber(){ return _balls.size(); }
   public int getBriquesNumber(){ return _briques.size(); }
    
}
