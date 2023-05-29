import java.util.ArrayList;
import java.util.List;

class Level {
  int ballNumber;
  int difficulty = 1;
  FX screenFX;
  Plateau _plateau;
  UI _ui;
  
  List<Balls> _balls;
  List<Brique> _briques;

  
    Level(int tempBalls, int tempDifficulty){
      difficulty = tempDifficulty;
      ballNumber = tempBalls-1;
      screenFX = new FX();
      _plateau = new Plateau();
      _ui = new UI();
      
      _balls = new ArrayList<>();
      _briques = new ArrayList<>();
      
      for (int i = 0; i <= ballNumber; i ++) {
      _balls.add(new Balls(new PVector(width/2+random(-100, 100), height/2 + random(-100, 100))));
      }
      
      
int numBrickRows = difficulty; // Nombre de lignes de briques à ajouter
    
for (int row = 0; row < numBrickRows; row++) {
    int offsetX = row % 2 == 0 ? (int)random(10,20) : (int)random(20,50); // Offset de décalage sur l'axe x
    
    for (int i = offsetX; i <= width-25; i += 25) {
        if (random(1) < difficulty * 0.02) {
            _briques.add(new Brique(i, 50 + row * 10));
        }
    }
}
      }
    
    public void draw(){
      
                    screenFX.draw();
                    
                    
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
                     
                     _ui.draw();
                    _ui.setBricNumber( getBriquesNumber() );
                    _ui.setBallNumber( getBallsNumber() );
                    }
                    
   public Plateau getPlayerLocal(){ return _plateau; }
   public List<Brique> getBriques(){ return _briques; };
   
   public int getBallsNumber(){ return _balls.size(); }
   public int getBriquesNumber(){ return _briques.size(); }
   public UI getUI(){return _ui;};
    
}
