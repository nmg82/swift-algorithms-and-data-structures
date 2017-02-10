/* binary search tree */
class AVLTree<T: Comparable> {
  var key: T?
  var left: AVLTree?
  var right: AVLTree?
  var height: Int?
}

extension AVLTree {
  //add item
  func append(element key: T) {
    
    //check root
    guard self.key != nil else {
      self.key = key
      self.height = 0
      return
    }
    
    //check left side
    if key < self.key! {
      if self.left != nil {
        left?.append(element: key)
      }
      
      else {
        
        //new element
        let leftElement = AVLTree()
        leftElement.key = key
        leftElement.height = 0
        self.left = leftElement
      }
    }
    
    //check right side
    if key > self.key! {
      if self.right != nil {
        right?.append(element: key)
      }
      
      else {
        
        //new element
        let rightElement = AVLTree()
        rightElement.key = key
        rightElement.height = 0
        self.right = rightElement
      }
    }
  } //end function
}

extension AVLTree {
  //depth-first traversal
  func traverse() {
    guard self.key != nil else {
      print("no key provided..")
      return
    }
    
    //process the left side
    if self.left != nil {
      left?.traverse()
    }
    
    print("...the value is: \(self.key!) - height: \(self.height)..")
    
    //process the right side
    if self.right != nil {
      right?.traverse()
    }
  }
}


//simple array of unsorted integers
let numberList = [8, 2, 10, 9, 11, 1, 7]

var root = AVLTree<Int>()
numberList.forEach { root.append(element: $0) }

root.traverse()

//dump(root)
