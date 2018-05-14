public class TankOne extends Vehicle{
  int health = 10;
  int radius;
  Vector2D position;
  Vector2D velocity;
  Vector2D heading;
  Vector2D lastKnownPos = new Vector2D();
  PVector acceleration;
  boolean collision;
  Turret turret;
  Team team;
  boolean patroling = true;
  boolean retreating = false;
  
  public TankOne(Vector2D position, double radius, Vector2D velocity, 
  double max_speed, Vector2D heading, double mass, 
  double max_turn_rate, double max_force, Team team){
    super(position, radius, velocity, max_speed, heading, mass, max_turn_rate, 
    max_force);
    this.radius = 20;
    this.position = position;
    this.health = 3;
    this.team = team;
  }

  public void moveForward(){
    position.add(velocity);

  }
  
  public void run(){
    System.out.println("PRINT FRÅN RUN X:" + position.x+"Y:" + position.y);
    if(patroling){
      lookForTank(); 
    }else if(retreating){
      System.out.println("RETREATING");
     if(position.x < 100 && position.y < 100){
      System.out.println("PRINT FRÅN RUN X:" + position.x+"Y:" + position.y);
       patroling = true;
       retreating = false;
       this.AP().obstacleAvoidOn().wanderOn();
       this.AP().wanderOn().wanderFactors(60, 30, 20);
    }
  }
  }
  
  
  public void lookForTank() {
    for (int i = 0; i < tanks.size(); i++) {
      if (canSee(world, tanks.get(i).pos()) && tanks.get(i) != this  && tanks.get(i).team.teamName == "teamB") {
        System.out.println(tanks.get(i).team.getTeamName());
        findPathHome(this);
        team.addtank(tanks.get(i));
        this.AP().wanderOff();
        patroling = false;
        retreating = true;
      }else{
       //System.out.println("INTE HITTAD"); 
      }
    }
    
  }
    
  public void rotateCounterClock(){
    
  }

  public void rotateClock(){
    
  }
}

public class TankPic extends PicturePS {
  Turret turret;
  Team team;
  int head;
  float size;
  int health;

  public TankPic(PApplet app, float size, int body, Team team) {
    super(app);
    this.size = size;
    this.head = body;
    this.health = 3;
    this.team = team;
  }

  public TankPic(PApplet app, float size, Team team) {
    this(app, size, color(255, 169, 19), team);
    this.health = 3;
  }

  public void draw(BaseEntity user, float posX, float posY, float velX, 
  float velY, float headX, float headY, float etime) {
    // Draw and hints that are specified and relevant
    
    Hints.hintFlags = hints;
    Hints.draw(app, user, velX, velY, headX, headY);
    System.out.println("x: " + (float)posX + "y: " + (float)posY);

    // Determine the angle the tank is heading
    float angle = PApplet.atan2(headY, headX);

    // Prepare to draw the entity    
    pushStyle();
    pushMatrix();
    translate(posX, posY);
    rotate(angle);

    // Draw the entity  
    //System.out.println(team.getTeamName());
    if(team.getTeamName() == "teamA"){
      fill((((255/6) * health) * 40), 50, 50, 255 - health*60);
    }else if(team.getTeamName() == "teamB"){
      fill(0, 0, ((255/6) * health) * 40, 255 - health*60);
    }
    ellipse(0,0, 50, 50);
    strokeWeight(2);
    line(0, 0, 25, 0);
    
    turret = new Turret(0, 0, 20, 25);
    turret.display();
 
    // Finished drawing
    popMatrix();
    popStyle();
  }
}
