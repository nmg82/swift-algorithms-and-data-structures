
class Person<T> {
  var key: T?
  var next: Person<T>?
}

extension Array where Element: Comparable {
  func insertionSort() -> [Element] {
    //check for trivial case
    guard self.count > 1 else { return self }
    
    var output = self
    
    for primaryIndex in 0..<output.count {
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

[1,5,2,7,9,3,4,12].insertionSort()
["a", "z", "e", "i"].insertionSort()

protocol Sortable {
  func isSorted<T: Comparable>(_ sequence: Array<T>) -> Bool
}

extension Sortable {
  // not a huge fan of this being an instance method, requiring it to be called on an 
  // instance of an array, for example, yet having another arry passed into the method call as a parameter
  func isSorted<T: Comparable>(_ sequence: Array<T>) -> Bool {
    //check trivial cases
    //probable error in the book, i'm changing sequence.count to be > 1
    //as opposed to <=1 as any list of size > 1 will always return true as sorted, which isn't correct
    guard sequence.count > 1 else { return true }
    
    var index = sequence.startIndex
    
    //compare sequence values
    while index < sequence.endIndex - 1 {
      if sequence[index] > sequence[sequence.index(after: index)] {
        return false
      }
      index = sequence.index(after: index)
    }
    
    return true
  }
}

extension Array: Sortable {}

//ugly calling in my opinion
[].isSorted([1,5,2,7,9,3,4,12])
[].isSorted([2])
