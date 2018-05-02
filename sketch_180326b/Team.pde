public class Team{
  String teamName;
  int teamColor;

  ArrayList<TankOne> messages = new ArrayList<TankOne>();

  public Team(String teamName){
    this.teamName = teamName;
  }
  
  public String getTeamName(){
    return teamName;
  }

}
