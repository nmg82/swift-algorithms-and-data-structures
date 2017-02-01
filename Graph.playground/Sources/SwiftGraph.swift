public class SwiftGraph {
  private var canvas: [Vertex]
  public var isDirected: Bool
  
  init() {
    canvas = []
    isDirected = true
  }
  
  func addVertex(key: String) -> Vertex {
    let childVertex = Vertex()
    childVertex.key = key
    
    canvas.append(childVertex)
    
    return childVertex
  }
  
  func addEdge(source: Vertex, neighbor: Vertex, weight: Int) {
    let newEdge = Edge()
    newEdge.neighbor = neighbor
    newEdge.weight = weight
    source.neighbors.append(newEdge)
    
    if !isDirected {
      let reverseEdge = Edge()
      reverseEdge.neighbor = source
      reverseEdge.weight = weight
      neighbor.neighbors.append(reverseEdge)
    }
  }
  
  func processDijkstra(source: Vertex, destination: Vertex) -> Path? {
    var frontier = [Path]()
    var finalPaths = [Path]()
    
    for e in source.neighbors {
      let newPath = Path()
      newPath.destination = e.neighbor
      newPath.previous = nil
      newPath.total = e.weight
      
      frontier.append(newPath)
    }
    
    var bestPath = Path()
    
    while frontier.count != 0 {
      //support path changes using the greedy approach
      bestPath = Path()
      var pathIndex = 0
      
      for x in 0 ..< frontier.count {
        let itemPath = frontier[x]
        
        if (bestPath.total == nil) || (itemPath.total < bestPath.total) {
          bestPath = itemPath
          pathIndex = x
        }
      }
      
      for e in bestPath.destination.neighbors {
        let newPath = Path()
        newPath.destination = e.neighbor
        newPath.previous = bestPath
        newPath.total = bestPath.total + e.weight
        
        frontier.append(newPath)
      }
      
      finalPaths.append(bestPath)
      frontier.remove(at: pathIndex)
    }
    
    var shortestPath: Path! = Path()
    
    for itemPath in finalPaths {
      if (itemPath.destination.key == destination.key) {
        if  (shortestPath.total == nil) || (itemPath.total < shortestPath.total) {
          shortestPath = itemPath
        }
      }
    }
    
    return shortestPath
  }
}

