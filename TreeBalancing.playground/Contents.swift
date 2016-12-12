/* binary search tree */
class AVLTree<T: Comparable> {
  var key: T?
  var left: AVLTree?
  var right: AVLTree?
  var height: Int = 0
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
  func getElementHeight(of element: AVLTree!) -> Int {
    guard let element = element else { return -1 }
    return element.height
  }
  
  //calculate height
  func setElementHeight() -> Bool {
    
    guard self.key != nil else {
      print("no key provided")
      return false
    }
    
    var elementHeight = 0
    elementHeight = max(getElementHeight(of: self.left), getElementHeight(of: self.right)) + 1
    self.height = elementHeight
    
    return true
  }
}

extension AVLTree {
  func isTreeBalanced() -> Bool {
    guard self.key != nil else {
      print("no element provided")
      return false
    }
    
    if (abs(getElementHeight(of: self.left) - getElementHeight(of: self.right)) <= 1 ) {
      return true
    } else {
      return false
    }
  }
}

extension AVLTree {
  func rightRotation() {
    let childToUse = AVLTree<T>()
    childToUse.height = 0
    childToUse.key = self.key
    
    if (getElementHeight(of: self.left) - getElementHeight(of: self.right) > 1) {
      //reset the root node
      self.key = self.left?.key
      self.height = getElementHeight(of: self.left)
      
      //assign the new right node
      self.right = childToUse
      
      //adjust the left node
      self.left = self.left?.left
      self.left?.height = 0
    }
  }
}

//example math for tree balance check
let rootVal = abs((0) - (-1)) //balanced
let leafVal = abs((-1) - (-1)) //balanced
let rootVal2 = abs((1) - (-1)) //unbalanced

let balanceList = [29, 26, 23]

let root = AVLTree<Int>()
balanceList.forEach{ root.append(element: $0) }



root.rightRotation()












































