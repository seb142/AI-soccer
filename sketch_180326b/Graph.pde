import game2dai.graph.*;

public Graph graph;
GraphNode node;

GraphEdge[] edges;
GraphNode[] nodes;
IGraphSearch pf;



public void createGraph(){
  graph = new Graph();
  int id = 0;
  for(int x = 10; x < 800; x += 100){
      //System.out.println("test");
    for(int y = 10; y < 800; y += 100){
        node = new GraphNode(id, x, y);
        graph.addNode(node);
        id++;
     } 
      
    }
    
    for(double x = 10; x < 800; x += 100){
        
    for(double y = 10; y < 800; y += 100){
       GraphNode mainNode = graph.getNodeNear (x, y, 2);
       GraphNode northNode = graph.getNodeNear (x, y-100, 2);
       GraphNode eastNode = graph.getNodeNear (x+100, y, 2);
       GraphNode southNode = graph.getNodeNear (x, y+100, 2);
       GraphNode westNode = graph.getNodeNear (x-100, y, 2);
       
       System.out.println(mainNode.id());
      if(northNode != null){
       System.out.println(northNode.id());
       graph.addEdge(mainNode.id(), northNode.id(), 0, 0);

      }
      if(southNode != null){
       System.out.println(southNode.id());
       graph.addEdge(mainNode.id(), southNode.id(), 0, 0);

      }
      if(eastNode != null){
       System.out.println(eastNode.id());
       graph.addEdge(mainNode.id(), eastNode.id(), 0, 0);

      }
      if(westNode != null){
       System.out.println(westNode.id()); 
       graph.addEdge(mainNode.id(), westNode.id(), 0, 0);

      }
      System.out.println("-----------------");


     }
      
    }
    pf = new GraphSearch_Astar(graph, new AshCrowFlight());
  
}

public void findPathHome(TankOne tank){
    GraphNode startNode = graph.getNodeNear (tank.position.x, tank.position.y, 500);
    GraphNode endNode = graph.getNodeNear (10, 10, 700);
    System.out.println(tank.position.x +" " +tank.position.y);
  if (startNode != null && endNode!= null && startNode != endNode) {
      tank.AP().pathSetRoute(pf.search(startNode.id(), endNode.id()));
      System.out.println("janne");
  }
  
}
