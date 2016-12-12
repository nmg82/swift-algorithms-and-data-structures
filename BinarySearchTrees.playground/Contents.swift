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

//simple array of unsorted integers
let numberList = [8, 2, 10, 9, 11, 1, 7]

var root = AVLTree<Int>()
numberList.forEach { root.append(element: $0) }

dump(root)
