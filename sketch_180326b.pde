TankOne t1t1 = new TankOne(100, 50);
TankTwo t2t1 = new TankTwo(400, 50);
TankThree t3t1 = new TankThree(600, 50);
Team team1 = new Team(t1t1,t2t1,t3t1);

TankOne t1t2 = new TankOne(100, 500);
TankTwo t2t2= new TankTwo(400, 500);
TankThree t3t2= new TankThree(600, 500);
Team team2 = new Team(t1t1,t2t1,t3t1);

boolean running = true;

void setup() {
  size(800, 600);
}

void draw(){
  background(255);
  t1t1.run();
  t2t1.run();
  t3t1.run();
  t1t2.run();
  t2t2.run();
  t3t2.run();

}
