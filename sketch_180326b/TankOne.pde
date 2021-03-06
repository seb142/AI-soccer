public class TankOne extends Vehicle{
  int health;
  int radius;
  Vector2D position;
  Vector2D velocity;
  Vector2D heading;
  Vector2D lastKnownPos = new Vector2D();
  Turret turret;
  Team team;
  TankPic tankPic;
  boolean patroling = true;
  boolean retreating = false;
  boolean home;
  long startTime;
 
  ArrayList<TankOne> seenEnemies = new ArrayList<TankOne>();
  
  public TankOne(Vector2D position, double radius, Vector2D velocity, 
  double max_speed, Vector2D heading, double mass, 
  double max_turn_rate, double max_force, Team team, TankPic tankPic){
    super(position, radius, velocity, max_speed, heading, mass, max_turn_rate, 
    max_force);
    this.radius = 20;
    this.position = position;
    this.health = 3;
    this.team = team;
    this.tankPic = tankPic;
  }
  
  public void run(){
    System.out.println(System.currentTimeMillis() - startTime);
    System.out.println("retreating: " + retreating+ " patroling: " +patroling);
    System.out.println("posX: " + tankPic.posX+ " posY: " +tankPic.posY);

    if(patroling){
       //The effective range of the flee target. The flee force applied will be zero if the entity is outside the flee radius.
       //By setting the flee radius to a very large number (e.g 600) we can easily test that it actually works.
       this.AP().fleeRadius(600); 
       for(TankOne t : team.avoidList){
         this.AP().fleeOn(t.position.x, t.position.y); //Set location to flee from. The location is were we last saw an enemy tank.
     }
     lookForTank(); 
     
   }else if(retreating){
     if(tankPic.posX < 11f && tankPic.posY < 11f){
       startTime = System.currentTimeMillis();
       home = true;
       System.out.println("Report to team");
       for(TankOne t : seenEnemies){ //Report to team which enemeies the tank have seen
         System.out.println("Reporting tank " + t);
         this.team.addTankToAvoidList(t);
       }
       //Clear the tanks own list of enemies to make sure it doesn't report doublets to the team
       seenEnemies.clear();
    }
    if(System.currentTimeMillis()-startTime > 3000 && retreating && home){
       patroling = true;
       home = false;
       retreating = false;
       this.AP().obstacleAvoidOn().wanderOn();
       this.AP().wanderOn().wanderFactors(60, 30, 20);
       this.AP().obstacleAvoidDetectBoxLength(15);
      }
    }
  }
  
  
  public void lookForTank() {
    System.out.println("look for tank1");
    for (int i = 0; i < tanks.size(); i++) {
      if (canSee(world, tanks.get(i).pos()) && tanks.get(i) != this  && tanks.get(i).team.teamName == "teamB") {
        System.out.println(tanks.get(i).team.getTeamName());
        seenEnemies.add(tanks.get(i)); // Add the seen enemy to the tanks own list of enemies
        this.AP().wanderOff(); // Turn off the tanks wander behaviour
        findPathHome(this); //Called from Graph class
        System.out.print("test1");
        patroling = false;
        retreating = true;
        System.out.println("look for tank2");
      }else{
         System.out.println("INTE HITTAD");
      }
    }
  }
}

public class TankPic extends PicturePS {
  Turret turret;
  Team team;
  int head;
  float size;
  int health;
  float posX,posY;

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
    this.posX = posX;
    this.posY = posY;
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
