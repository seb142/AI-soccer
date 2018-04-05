public class TankTwo{
  int health = 10;
  int radius;
  PVector position;
  PVector velocity;
  PVector acceleration;

  TankTwo(float x, float y){
    this.radius = 20;
    acceleration = new PVector(0, 0);
    position = new PVector(x, y); 
    if(y > 400) {
      velocity = new PVector(2, -1);
    }else{
      velocity = new PVector(1, 2);
    }
  }

  public void moveForward(){
    velocity.rotate(0.2);
    position.add(velocity);
 

  }

  public void moveBackward(){
    
  }

  public void rotateCounterClock(){

  }

  public void rotateClock(){
    
    
  }
  
  void run(){
   rotateCounterClock();
   moveForward();
   display();
   
  }
  
  void display() {
    // Draw a triangle rotated in the direction of velocity
    ellipse(position.x,position.y,50,50);
    ellipse(position.x,position.y,30,30);
  }

}
