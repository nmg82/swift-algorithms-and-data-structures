//array of sorted integers
var numberList: Array<Int> = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

extension Array where Element: Comparable {
  func linearSearch(forElement key: Element) -> Bool {
    for number in self {
      if number == key {
        return true
      }
    }
    
    return false
  }
}

//execute search
var isFound = numberList.linearSearch(forElement: 8)


extension Array where Element: Comparable {
  
  //Here we know we're searching a sorted array to find a specific value, 
  //so we assume there is no need to search values less than the key.
  mutating func binarySearch(forElement key: Element) -> Bool {
    var result = false
    
    //establish indices
    let min = startIndex
    let max = endIndex - 1
    let mid = midIndex
    
    //check bounds
    if key > self[max] || key < self[min] {
      print("search value \(key) not found...")
      return false
    }
    
    //evaluate chosen number
    let n = self[mid]
    
    print(String(describing: n) + "value attempted...")
    
    if n > key {
      var slice = Array(self[min...mid - 1])
      result = slice.binarySearch(forElement: key)
    }
    
    else if n < key {
      var slice = Array(self[mid + 1...max])
      result = slice.binarySearch(forElement: key)
    }
    
    else {
      print("search value \(key) found...")
      result = true
    }
    
    return result
  }
  
  var midIndex: Index {
    return startIndex + (count / 2)
  }
}

//execute search
isFound = numberList.binarySearch(forElement: 8)






































