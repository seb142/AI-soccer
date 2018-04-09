public class TankOne{
  int health = 10;
  int radius;
  PVector position;
  PVector velocity;
  PVector acceleration;
  boolean collision;
  Turret turret;

  TankOne(float x, float y){
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
  
  void checkCollision(TankTwo other){
    //Should take the position of this tank and check it's area and if it overlaps another tanks area
    //Return a bool if it is true or not and use that in keyPressed() for collisioncheck
    if(dist(position.x, position.y, other.position.x, other.position.y) < 50){
      collision = true;
    }
  }
  
    public void keyPressed(){
    if(keyPressed == true){
      if(keyCode == UP && ((position.y > 25 || velocity.heading() > 0) && (position.y < 575 || velocity.heading() < 0) && ((position.x > 25 || (velocity.heading() > -1.5) && (velocity.heading() < 1.5))) && (position.y < 575 || velocity.heading() < 0)) && ((position.x < 775 || (velocity.heading() < -1.5 || velocity.heading() > 1.5)))){
        System.out.println(velocity);
        position.add(velocity);
      }else if(keyCode == DOWN && ((position.y > 25 || velocity.heading() < 0) && (position.y < 575 || velocity.heading() > 0)) && (position.x > 25 || (velocity.heading() > 1.5 || velocity.heading() < -1.5)) && (position.x < 775 || (velocity.heading() < 1.5 && velocity.heading() > -1.5))){
        position.sub(velocity);
      }else if(keyCode == LEFT){
        velocity.rotate(-0.05);
        
      }else if(keyCode == RIGHT){
        velocity.rotate(0.05);
      }
    System.out.println("poxition: " + position);
    System.out.println("velocity: " + velocity);
    System.out.println("heading" + velocity.heading2D());
    }
  }
  
  public void drawTank(){
    fill(128, 204, 255);
    ellipse(position.x,position.y,50,50);
    strokeWeight(2);
    line(position.x, position.y, position.x, position.y+25);
    strokeWeight(1);
  }
  
  void run(){
    display();
    keyPressed();
  }
  
  
  
  void display() {
    drawTank();
    turret = new Turret(position.x, position.y, 30);
    turret.run();
  }

}
