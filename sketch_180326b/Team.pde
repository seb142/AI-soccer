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
  
  public int getTeamColor(){
    if(teamName.equals("teamA")){
      teamColor = 42;
    }else{
      teamColor = 2;
    }
    return teamColor;
  }
}
