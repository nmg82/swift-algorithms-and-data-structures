//array of unsorted integers
let numberList = [8, 2, 10, 9, 7, 5]

extension Array where Element: Comparable {
  func insertionSort() -> [Element] {
    //check for trivial case
    guard self.count > 1 else { return self }
    
    //mutated copy
    var output = self
    
    for primaryIndex in 0 ..< output.count {
      let key = output[primaryIndex]
      var secondaryIndex = primaryIndex
      
      while secondaryIndex > -1 {
        if key < output[secondaryIndex] {
          //move to correct position
          output.remove(at: secondaryIndex + 1)
          output.insert(key, at: secondaryIndex)
        }
        
        secondaryIndex -= 1
      }
    }
    
    return output
  }
}

//execute sort
numberList.insertionSort()



extension Array where Element: Comparable {
  func bubbleSort() -> [Element] {
    //check for trivial case
    guard self.count > 1 else { return self }
    
    //mutated copy
    var output = self
    
    for primaryIndex in 0 ..< self.count {
      let passes = (output.count - 1) - primaryIndex
      
      //"half-open" range operator
      for secondaryIndex in 0 ..< passes {
        let key = output[secondaryIndex]
        
        //compare / swap positions
        if key > output[secondaryIndex + 1] {
          swap(&output[secondaryIndex], &output[secondaryIndex + 1])
        }
      }
    }
    
    return output
  }
}

//execute sort
numberList.bubbleSort()



extension Array where Element: Comparable {
  func selectionSort() -> [Element] {
    //check for trivial case
    guard self.count > 1 else { return self }
    
    //mutated copy
    var output = self
    
    for primaryIndex in 0 ..< output.count {
      var minimum = primaryIndex
      var secondaryIndex = primaryIndex + 1
      
      while secondaryIndex < output.count {
        //store lowest value as minimum
        if output[minimum] > output[secondaryIndex] {
          minimum = secondaryIndex
        }
        secondaryIndex += 1
      }
      
      //swap minimum value with array iteration
      if primaryIndex != minimum {
        swap(&output[primaryIndex], &output[minimum])
      }
    }
    
    return output
  }
}

numberList.selectionSort()







































