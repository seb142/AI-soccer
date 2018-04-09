public class Turret{
  
  PVector position;
  PVector velocity;
  float radius;
  Shell shell;
  
  public Turret(float x, float y, float radius){
    position = new PVector(x,y);
      if(y > 400) {
      velocity = new PVector(0, -1);
    }else{
      velocity = new PVector(0, 1);
    }
    this.radius = radius;
  }
  
  public void drawTurret(){
    fill(0, 153, 255);
    ellipse(position.x,position.y,30,30);
  }
  
  public void run(){
    display();
  }
  
  public void display(){
    drawTurret();
    shell = new Shell(position.x, position.y, 15);
    shell.run();
  }
}
