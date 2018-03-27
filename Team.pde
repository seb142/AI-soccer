public class Team{
  TankOne tank1;
  TankTwo tank2;
  TankThree tank3;

  public Team(TankOne t1, TankTwo t2, TankThree t3){
    TankOne tank1 = t1;
    TankTwo tank2 = t2;
    TankThree tank3 = t3;
  }

  public TankOne getTank1(){

    return tank1;
  }

  public TankTwo getTank2(){
    return tank2;
    
  }

  public TankThree getTank3(){
    return tank3;
    
  }

}
