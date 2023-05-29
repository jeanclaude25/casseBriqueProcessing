import beads.*;

AudioContext ac;
WavePlayer wavePlayer;
Gain gain;
Envelope envelope;

Level _level;
int difficulty = 40;
int numberBallAtStart = 1;


void setup(){
  
  
size(800, 800, P2D);
//fullScreen();
frameRate(240);
orientation(LANDSCAPE);


_level = new Level(numberBallAtStart, difficulty);
_level.getUI().setLevelNumber(difficulty);
//hint(DISABLE_DEPTH_MASK);

  // Initialisez le contexte audio
  ac = new AudioContext();
  
  // Créez un générateur de forme d'onde (WavePlayer) avec une fréquence donnée
  float frequency = 440; // Fréquence en Hz
  wavePlayer = new WavePlayer(ac, frequency, Buffer.SINE);
  
  // Créez un objet Gain pour contrôler le volume du son
  gain = new Gain(ac, 1, 0.2);
  
  // Créez un Envelope pour contrôler la durée de l'impulsion sonore
  envelope = new Envelope(ac, 0);
  
  // Connectez le générateur de forme d'onde au Gain
  gain.addInput(wavePlayer);
  
  // Connectez l'Envelope au Gain pour contrôler la durée de l'impulsion sonore
  gain.addInput(envelope);
  
  // Connectez le Gain à la sortie audio
  ac.out.addInput(gain);
  
  // Démarrez le contexte audio
  ac.start();
  envelope.clear();
  envelope.addSegment(1, 10);
}




void draw(){



// probleme de conditions
if(_level.getBallsNumber() < 1 || _level.getBriquesNumber() < 1){
  if(_level.getBallsNumber() < 1 && difficulty > 1){ difficulty --;}
  if(_level.getBriquesNumber() < 1){difficulty++;}
  
_level = new Level((int) random(1, 11), difficulty); 
}

_level.draw();
_level.getUI().setLevelNumber(difficulty);
}
