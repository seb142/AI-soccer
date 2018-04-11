public class TankThree extends Tank{
 int health = 10;
  int radius;
  PVector position;
  PVector velocity;
  PVector acceleration;
  Turret turret;

  TankThree(float x, float y){
    this.radius = 20;
    acceleration = new PVector(0, 0);
    position = new PVector(x, y); 
    if(y > 400) {
      velocity = new PVector(0, -1);
    }else{
      velocity = new PVector(0, 1);
    }
  }

  public void keyPressed(){
    checkCollision();
    if(keyPressed == true){
      if(keyCode == UP && ((position.y > 25 || velocity.heading() > 0) && (position.y < 575 || velocity.heading() < 0) && ((position.x > 25 || (velocity.heading() > -1.5) && (velocity.heading() < 1.5))) && (position.y < 575 || velocity.heading() < 0)) && ((position.x < 775 || (velocity.heading() < -1.5 || velocity.heading() > 1.5)))){
        //position.y--;
        System.out.println(velocity);
        position.add(velocity);
      }else if(keyCode == DOWN && ((position.y > 25 || velocity.heading() < 0) && (position.y < 575 || velocity.heading() > 0)) && (position.x > 25 || (velocity.heading() > 1.5 || velocity.heading() < -1.5)) && (position.x < 775 || (velocity.heading() < 1.5 && velocity.heading() > -1.5))){
        //position.y++;
        position.sub(velocity);
      }else if(keyCode == LEFT){
        //position.x--;
        velocity.rotate(-0.05);
      }else if(keyCode == RIGHT){
        //position.x++;
        velocity.rotate(0.05);
      }
    System.out.println("poxition: " + position);
    System.out.println("velocity: " + velocity);
    System.out.println("heading" + velocity.heading2D());
    }
  }

  public void moveBackward(){


  }

  public void rotateCounterClock(){

    
  }

  public void rotateClock(){

    
  }
  
  void run(){
   display();
   
  }
  
  
  
  void display() {
    // Draw a triangle rotated in the direction of velocity
     fill(128, 204, 255);
    ellipse(position.x,position.y,50,50);
    turret = new Turret(position.x, position.y, 30);
    turret.run();
  }

}
