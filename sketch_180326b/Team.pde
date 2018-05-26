public class Team{
  String teamName;
  color teamColor;

  ArrayList<TankOne> messages = new ArrayList<TankOne>();
  ArrayList<TankOne> avoidList = new ArrayList<TankOne>();


  public Team(String teamName){
    this.teamName = teamName;
  }
  
  public String getTeamName(){
    return teamName;
  }
  
  public void addTankToAvoidList(TankOne tank){
      avoidList.add(tank);
      System.out.println(tank + "tankToAvoid lagrad i team");
      
  }

  public Vector2D getEnemyPosVector(TankOne tank){
    Vector2D position = null;
    for(TankOne t : avoidList){
      if(tank == t){
        position = new Vector2D(t.position.x, t.position.y);
      }
    }
    return position;
  }
}
