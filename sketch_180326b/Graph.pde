HashMap hm = new HashMap();


public void createGraph(){
  
  for(int x = 0; x< 800; x += 100){
   
    for(int y = 10; y < 800; y += 100){
    
     if(x == 10 && y == 10){
         System.out.println(x+" "+y);
     }else if(x == 10){
       System.out.println(x+" "+y);
     }
      
    }    
  }
}

public class Node {
    public String name;
    public Node northNode;
    public Node eastNode;
    public Node southNode;
    public Node westNode;
    public int x,y;
    
    public Node(Node NorthNode, Node EastNode, Node SouthNode, Node WestNode, int x, int y){
      this.northNode = northNode;
      this.eastNode = eastNode;
      this.southNode = southNode;
      this.westNode = westNode;
    }
    public Node(int x, int y){
      this.x = x;
      this.y = y;
    }
    
    public void addNodes(Node newNorth, Node newEast, Node newSouth, Node newWest ){
      northNode =  newNorth;
      eastNode = newEast;
      southNode= newSouth;
      westNode = newWest;

      
      
    }
}


public class Graph {
    List<Node> nodes;
}

class CordinateKey {
    private int x;
    private int y;
    
    public CordinateKey(int x, int y){
      this.x = x;
      this.y = y;
    }

    @Override
    public boolean equals(Object obj) {
        if(obj != null && obj instanceof CordinateKey) {
            CordinateKey s = (CordinateKey)obj;
            return x == s.x && y == s.y;
        }
        return false;
    }

    @Override
    public int hashCode() {
        return x * 31 + y;
    }
}
