class Obstacle {
  
  PImage img;
  float xPos;
  float yPos;
  float diameter;
  float radius;
  Vector2D position;
  
  
  Obstacle(Vector2D position){
    this.img = loadImage("data/tree01_v2.png");
    this.position = position;
    this.diameter = this.img.width/2;
    this.radius = diameter/2;
  }
  
  void display() {
    fill(104, 102, 100, 100);
    ellipse(xPos, yPos, diameter, diameter);
    image(img, xPos, yPos);
  }
  
  public class ObstaclePic extends PicturePS {
 
       
    public ObstaclePic(PApplet app){
      super(app);
    }
    
    public void draw(){
      fill(204, 102, 0, 100);
      ellipse(xPos, yPos, diameter, diameter);
      image(img, xPos, yPos);
    }
    
  }
}
