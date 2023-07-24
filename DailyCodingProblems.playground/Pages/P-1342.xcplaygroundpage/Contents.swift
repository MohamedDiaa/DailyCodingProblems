//: [Previous](@previous)

import Foundation
// did not solve my self

//
//        You are given an N by N matrix of random letters and a dictionary of words. Find the maximum number of words that can be packed on the board from the given dictionary.
//
//        A word is considered to be able to be packed on the board if:
//
//        It can be found in the dictionary
//        It can be constructed from untaken letters by other words found so far on the board
//        The letters are adjacent to each other (vertically and horizontally, not diagonally).
//        Each tile can be visited only once by any word.
//
//        For example, given the following dictionary:
//
//        { "eat", "rain", "in", "rat" }
//        and matrix:
//
//        [["e", "a", "n"],
//         ["t", "t", "i"],
//         ["a", "r", "a"]]
//        Your function should return 3, since we can make the words "eat", "in", and "rat" without them touching each other. We could have alternatively made "eat" and "rain", but that would be incorrect since that"s only 2 words.

//let matrix =
//[["e", "a", "n"], // 1 , 1
// ["t", "t", "i"], // 1
// ["a", "r", "a"]] //   2
//
//let dictionary =  [ "eat", "rain", "in", "rat" ]


//func maxNumberWordsPacked(matrix: [[String]], words: [String]) -> Int {
//    var count = 0
//
//    let lettersList = Array(matrix.joined())
//    let wordsList = Array(matrix.joined())
//
//    let  dic = countForLetter(lettersList)
//    let words = countForLetter(wordsList)
//
//
//    return 0
//}
//
//func countForLetter(_ array: [String]) -> [String: Int] {
//
//    var dic: [String: Int] = [:]
//
//    for char in array {
//
//        dic[char] = (dic[char] ?? 0) + 1
//    }
//    return dic
//}
//
//maxNumberWordsPacked(matrix: matrix, words: dictionary)

class TrieNode {
    var children: [Character: TrieNode] = [:]
    var isEndOfWord: Bool = false
}

class Trie {
     var root: TrieNode

    init() {
        root = TrieNode()
    }

    func insert(_ word: String) {
        var node = root
        for char in word {
            if let childNode = node.children[char] {
                node = childNode
            } else {
                let newNode = TrieNode()
                node.children[char] = newNode
                node = newNode
            }
        }
        node.isEndOfWord = true
    }

    func search(_ word: String) -> Bool {
        var node = root
        for char in word {
            if let childNode = node.children[char] {
                node = childNode
            } else {
                return false
            }
        }
        return node.isEndOfWord
    }
}

func maxNumWordsPacked(_ matrix: [[Character]], _ dictionary: Set<String>) -> Int {
    var matrix = matrix
    let numRows = matrix.count
    guard numRows > 0 else { return 0 }
    let numCols = matrix[0].count

    // Helper function to perform DFS and find words in the matrix
    func dfs(_ row: Int, _ col: Int, _ trie: Trie, _ count: inout Int) {
        if !isValidCell(row, col, numRows, numCols) || matrix[row][col] == "#" {
            return
        }

        let char = matrix[row][col]
        if let childNode = trie.root.children[char] {
            let nextTrie = Trie()
            nextTrie.root = childNode
            if childNode.isEndOfWord {
                count += 1
                nextTrie.root.isEndOfWord = false // Mark the word as visited
            }

            let originalChar = matrix[row][col]
            matrix[row][col] = "#" // Mark the cell as visited
            let directions = [(0, 1), (0, -1), (1, 0), (-1, 0)]
            for (dx, dy) in directions {
                let newRow = row + dx
                let newCol = col + dy
                dfs(newRow, newCol, nextTrie, &count)
            }
            matrix[row][col] = originalChar // Revert the cell back to the original character
        }
    }

    // Helper function to check if a cell is within the boundaries of the matrix
    func isValidCell(_ row: Int, _ col: Int, _ numRows: Int, _ numCols: Int) -> Bool {
        return row >= 0 && row < numRows && col >= 0 && col < numCols
    }

    let trie = Trie()
    for word in dictionary {
        trie.insert(word)
    }

    var maxCount = 0

    for row in 0..<numRows {
        for col in 0..<numCols {
            var count = 0
            dfs(row, col, trie, &count)
            maxCount = max(maxCount, count)
        }
    }

    return maxCount
}

let matrix: [[Character]] = [
    ["e", "a", "n"],
    ["t", "t", "i"],
    ["a", "r", "a"]
]

let dictionary: Set<String> = ["eat", "rain", "in", "rat"]
let result = maxNumWordsPacked(matrix, dictionary)
print("Maximum number of words that can be packed: \(result)")
