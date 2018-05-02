import game2dai.entities.*;
import game2dai.entityshapes.ps.*;
import game2dai.maths.*;
import game2dai.*;
import game2dai.entityshapes.*;
import game2dai.fsm.*;
import game2dai.steering.*;
import game2dai.utils.*;
import game2dai.graph.*;
import java.util.*;

World world;
StopWatch sw;
Obstacle ob1;
Obstacle ob2;
Obstacle ob3;
TankOne t1t1;
TankOne t1t2;
TankOne t1t3;
TankOne t1t4;
TankOne t1t5;
TankOne t1t6;
ArrayList <TankOne> tanks = new ArrayList<TankOne>();
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();

int[] obs = new int[] {
  100, 100, 36, 
  200, 200, 32, 
  270, 70, 16, 
  380, 180, 37, 
  510, 110, 27, 
  520, 210, 23, 
  400, 80, 10, 
  90, 240, 6
};

TankPic tankPic;
BitmapPic obstaclePic;

void setup() {
  size(800, 800);
  Domain domain = new Domain(0, 0, 800, 800);
  t1t1 = createTank(domain,100,70,true);
  t1t2 = createTank(domain,200,70,false);
  t1t3 = createTank(domain,300,70,false);
  t1t4 = createTank(domain,500,530,false);
  t1t5 = createTank(domain,600,530,false);
  t1t6 = createTank(domain,700,530,false);
  ob1 = createObstacle(domain, 230, 600);
  ob2 = createObstacle(domain, 280, 220);
  ob3 = createObstacle(domain, 530, 520);
  
  world = new World(800, 800);
  sw = new StopWatch();
  int selectedHint = -1;
  selectedHint = Hints.HINT_VIEW;
  t1t1.renderer().showHints(selectedHint);
  
  world.add(t1t1);
  world.add(t1t2);
  world.add(t1t3);
  world.add(t1t4);
  world.add(t1t5);
  world.add(t1t6);
  world.add(ob1);
  world.add(ob2);
  world.add(ob3);
  sw.reset();

}

void draw(){
  
  t1t1.lookForTank();
  double elapsedTime = sw.getElapsedTime();
  world.update(elapsedTime);
  background(255);
  world.draw(elapsedTime);
}

public TankOne createTank(Domain domain,int xPos,int yPos, Boolean movement){
  TankOne tank = new TankOne(new Vector2D(xPos,yPos), // position
  25, // collision radius
  Vector2D.ZERO, // velocity
  70, // maximum speed
  Vector2D.random(null), // heading
  1.5, // mass
  2.5f, // turning rate
  2500);
  if(movement){
    tank.AP().obstacleAvoidOn().wanderOn();
    tank.AP().wanderOn().wanderFactors(60, 30, 20);
    tank.AP().obstacleAvoidDetectBoxLength(15);
  }
  tanks.add(tank);
  tankPic = new TankPic(this, (float)50);
  tank.worldDomain(domain, SBF.REBOUND);
  tank.viewFactors(260, PApplet.TWO_PI/7);
  tank.renderer(tankPic);
  return tank;
}


  
public Obstacle createObstacle(Domain domain,int xPos,int yPos) {
  Obstacle ob = new Obstacle(new Vector2D(xPos, yPos), 100);
  obstaclePic = new BitmapPic(this, "data/tree01_v2.png");
  obstacles.add(ob);
  //obPic = new ObstaclePic(this);
  ob.renderer(obstaclePic);
  return ob;
}
