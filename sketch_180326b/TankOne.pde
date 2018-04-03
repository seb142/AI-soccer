public class TankOne{
  int health = 10;
  int radius;
  PVector position;
  PVector velocity;
  PVector acceleration;

  TankOne(float x, float y){
    this.radius = radius;
    this.radius = 20;
    acceleration = new PVector(0, 0);
    position = new PVector(x, y); 
    if(y > 400) {
      velocity = new PVector(0, -1);
    }else{
      velocity = new PVector(0, 1);
    }
  }

  public void moveForward(){
    position.add(velocity);

  }

  public void moveBackward(){


  }

  public void rotateCounterClock(){

    
  }

  public void rotateClock(){

    
  }
  
    public void keyPressed(){
    if(key == CODED){
      if(keyCode == UP && (position.y > 25)){
        position.y--;
      }else if(keyCode == DOWN && (position.y < 575)){
        position.y++;
      }else if(keyCode == LEFT && (position.x > 25)){
        position.x--;
      }else if(keyCode == RIGHT && position.x < 775){
        position.x++;
      }
    }
  }
  
  void run(){
    display();
    keyPressed();
  }
  
  
  
  void display() {
    // Draw a triangle rotated in the direction of velocity
    ellipse(position.x,position.y,50,50);
    ellipse(position.x,position.y,30,30);
  }

}
