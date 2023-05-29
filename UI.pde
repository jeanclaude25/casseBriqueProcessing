class UI{
      
        int briqueNumber;
        int ballNumber;
      
       UI(){
         
       }
       
       public void draw(){
         textStyle();
         writeBriqueNumber(10, 20);
         writeBallNumber(10, 40);
       }
       
   private void writeBriqueNumber(float x, float y){
       String textToShow = "Bric " + str(briqueNumber);
        text(textToShow, x, y);
   }
   
   private void writeBallNumber(float x, float y){
       String textToShow = "Balls " + str(ballNumber);
        text(textToShow, x, y);
   }
 
   private void textStyle(){
    textSize(17);
    fill(0, 408, 612); 
   }
   
   public void setBricNumber(int b){ briqueNumber = b;};
   public void setBallNumber(int b){ ballNumber = b;};
}
