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
    public void addtank(TankOne tank){
      avoidList.add(tank);
      System.out.println("tank lagrad i team");
      
  }

}
