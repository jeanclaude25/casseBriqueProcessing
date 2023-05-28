class FX{
boolean motionBlur = true;
float motionBlurStrength = 10; // 0-255
  
  FX(){
    
    
  }
  
  public void draw(){
    
                  if(motionBlur){
                                fill(0, motionBlurStrength);
                                noStroke();
                                rect(0,0,width,height);
                    }else{
                                background(0);
                          }
    
                }
  
}
