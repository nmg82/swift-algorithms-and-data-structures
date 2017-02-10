import Foundation

public class Queue<T> {
  private var top: Node<T>!
  
  func enQueue(_ key: T) {
    guard top.key != nil else {
      top.key = key
      return
    }
    
    let childToUse = Node<T>()
    var current = top
    
    while current?.next != nil {
      current = current?.next
    }
    
    childToUse.key = key
    current?.next = childToUse
  }
  
  //retrieve items from the top level - O(1) time
  func deQueue() -> T? {
    guard top.key != nil else { return nil }
    
    let queueItem: T? = top.key
    
    if let nextItem = top.next {
      top = nextItem
    } else {
      top = Node<T>()
    }
    
    return queueItem
  }
  
  func peek() -> T! {
    return top.key
  }
  
  func isEmpty() -> Bool {
    guard top.key != nil else { return true }
    return false
  }
}
