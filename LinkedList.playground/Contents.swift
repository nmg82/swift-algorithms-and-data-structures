//linked list structure
class LLNode<T> {
  var key: T!
  var next: LLNode?
  var previous: LLNode?
}

class LinkedList<T: Equatable> {
  
  //new instance
  private var head = LLNode<T>()
  
  var count: Int {
    if head.key == nil {
      return 0
    }
    
    else {
      var current: LLNode = head
      var x: Int = 1
      
      //cycle through items
      while current.next != nil {
        current = current.next!
        x += 1
      }
      
      return x
    }
  }
  
  //add item
  func append(element key: T) {
    guard head.key != nil else {
      head.key = key
      return
    }
    
    var current: LLNode? = head
    
    //position node
    while current != nil {
      if current?.next == nil {
        let childToUse = LLNode<T>()
        childToUse.key = key
        childToUse.previous = current
        current!.next = childToUse
        break
      }
      
      else {
        current = current?.next
      }
    } //end while
  }
  
  //remove at specific index
  func remove(at index: Int) {
    
    //check empty conditions
    if ((index < 0) || (index > (self.count - 1)) || (head.key == nil)) {
      print("link index does not exist...")
      return
    }
    
    var current: LLNode<T>? = head
    var trailer: LLNode<T>?
    var listIndex: Int = 0
    
    //determine if the removal is at the head
    if index == 0 {
      current = current?.next
      head = current!
      return
    }
    
    //iterate through remaining items
    while current != nil {
      if listIndex == index {
        
        //redirect the trailer and next pointers
        trailer!.next = current?.next
        current = nil
        break
      }
      
      //update assignments
      trailer = current
      current = current?.next
      listIndex += 1
    }
  }
} //end class
