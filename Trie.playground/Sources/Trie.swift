extension String {
  //returns characters up to a specified integer
  func substring(to: Int) -> String {
    //define the range
    let range = self.index(self.startIndex, offsetBy: to)
    return self.substring(to: range)
  }
}

public class Trie {
  
  private var root: TrieNode!
  
  init() {
    root = TrieNode()
  }
  
  func append(word keyword: String) {
    //trivial case
    guard keyword.characters.count > 0 else { return }
    
    var current: TrieNode = root
    
    while keyword.characters.count != current.level {
      var childToUse: TrieNode!
      let searchKey = keyword.substring(to: current.level + 1)
      
      //iterate through child nodes
      for child in current.children {
        if child.key == searchKey {
          childToUse = child
          break
        }
      }
      
      //new node
      if childToUse == nil {
        childToUse = TrieNode()
        childToUse.key = searchKey
        childToUse.level = current.level + 1
        current.children.append(childToUse)
      }
      
      current = childToUse
    } //end while
    
    //final end of word check
    if keyword.characters.count == current.level {
      current.isFinal = true
      print("end of word reached!")
      return
    }
  } //end function
  
  func search(forWord keyword: String) -> [String]! {
    //trivial case
    guard keyword.characters.count > 0 else { return nil }
    
    var current: TrieNode = root
    var wordList = [String]()
    
    while keyword.characters.count != current.level {
      var childToUse: TrieNode!
      let searchKey = keyword.substring(to: current.level + 1)
      
      //iterate through any child nodes
      for child in current.children {
        if child.key == searchKey {
          childToUse = child
          current = childToUse
          break
        }
      }
      
      if childToUse == nil { return nil }
    } //end while
    
    //retrieve the keyword and any descendants
    if ((current.key == keyword) && (current.isFinal)) {
      wordList.append(current.key)
    }
    
    //include only children that are words
    for child in current.children {
      if child.isFinal == true {
        wordList.append(child.key)
      }
    }
    
    return wordList
  } //end function
}

