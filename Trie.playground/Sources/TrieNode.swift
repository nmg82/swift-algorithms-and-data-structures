import Foundation

public class TrieNode {
  var key: String!
  var children: Array<TrieNode>
  var isFinal: Bool
  var level: Int
  
  init() {
    children = []
    isFinal = false
    level = 0
  }
}
