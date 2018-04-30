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
TankOne t1t1;
TankOne t1t2;
TankOne t1t3;
TankOne t1t4;
TankOne t1t5;
TankOne t1t6;
ArrayList <TankOne> tanks = new ArrayList<TankOne>();

TankPic tankPic;

void setup() {
  size(800, 600);
  Domain domain = new Domain(0, 0, 800, 600);
  t1t1 = createTank(domain,100,70,true);
  t1t2 = createTank(domain,200,70,false);
  t1t3 = createTank(domain,300,70,false);
  t1t4 = createTank(domain,500,530,false);
  t1t5 = createTank(domain,600,530,false);
  t1t6 = createTank(domain,700,530,false);
  world = new World(800, 600);
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
  20, // collision radius
  Vector2D.ZERO, // velocity
  70, // maximum speed
  Vector2D.random(null), // heading
  1.5, // mass
  2.5f, // turning rate
  2500);
  if(movement){
    tank.AP().wanderOn().wanderFactors(60, 30, 20);
  }
  tanks.add(tank);
  tankPic = new TankPic(this, (float)50);
  tank.worldDomain(domain, SBF.WRAP);
  tank.viewFactors(260, PApplet.TWO_PI/7);
  tank.renderer(tankPic);
  return tank;
}
