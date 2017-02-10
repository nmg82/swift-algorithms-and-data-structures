import Foundation

public class PathHeap {
  private var heap: [Path]
  
  init() {
    heap = []
  }
  
  var count: Int {
    return heap.count
  }
  
  func enQueue(_ key: Path) {
    heap.append(key)
    var childIndex = Float(heap.count) - 1
    var parentIndex = 0
    
    if childIndex != 0 {
      parentIndex = Int(floorf((childIndex - 1) / 2)) 
    }
    
    var childToUse: Path
    var parentToUse: Path
    
    //use the bottom-up approach
    while childIndex != 0 {
      
      
      childToUse = heap[Int(childIndex)]
      parentToUse = heap[parentIndex]
      
      
      //swap child and parent positions
      if childToUse.total < parentToUse.total {
        swap(&heap[parentIndex], &heap[Int(childIndex)])
      }
      
      
      //reset indices
      childIndex = Float(parentIndex)
      
      if (childIndex != 0) {
        parentIndex = Int(floorf((childIndex - 1) / 2))
      }
    }
  }
  
  func peek() -> Path! {
    if heap.count > 0 {
      return heap[0] //the shortest path
    } else {
      return nil
    }
  }
}

