public abstract class Tank{

  TankOne t1;
  TankTwo t2;
  TankThree t3;
  
  public boolean collision;
  
  
  public void checkCollision(){ //<>//
    collision = false;
    if(dist(t1.position.x, t1.position.y, t2.position.x, t2.position.y) <= 50){
      collision = true;
    }
    if(dist(t1.position.x, t1.position.y, t3.position.x, t3.position.y) <= 50){
      collision = true;
    }
    if(dist(t2.position.x, t2.position.y, t3.position.x, t3.position.y) <= 50){
      collision = true;
    }
  }
  
}
