import game2dai.entities.*;
import game2dai.entityshapes.ps.*;
import game2dai.maths.*;
import game2dai.*;
import game2dai.entityshapes.*;
import game2dai.fsm.*;
import game2dai.steering.*;
import game2dai.utils.*;
import game2dai.graph.*;

World world;
StopWatch sw;
TankOne t1t1;
TankOne t1t2;
TankPic tankPic;


void setup() {
  size(800, 600);
  Domain domain = new Domain(0, 0, 800, 600);
  t1t1 = createTank(domain);
  t1t2 = createTank(domain);
  world = new World(800, 600);
  sw = new StopWatch();
  world.add(t1t1);
  world.add(t1t2);
  sw.reset();

}

void draw(){
  double elapsedTime = sw.getElapsedTime();
  world.update(elapsedTime);
  background(255);
  world.draw(elapsedTime);
}

public TankOne createTank(Domain domain){
  TankOne tank = new TankOne(new Vector2D(100,100), // position
  20, // collision radius
  Vector2D.ZERO, // velocity
  70, // maximum speed
  Vector2D.random(null), // heading
  1.5, // mass
  2.5f, // turning rate
  2500);
  tank.AP().wanderOn().wanderFactors(60, 30, 20);
  tankPic = new TankPic(this, (float)50);
  tank.worldDomain(domain, SBF.WRAP);
  tank.renderer(tankPic);
  return tank;

}
