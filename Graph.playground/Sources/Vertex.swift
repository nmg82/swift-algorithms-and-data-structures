public class Vertex {
  var key: String?
  var neighbors: [Edge]
  var visited: Bool = false
  
  init() {
    neighbors = []
  }
}

