//: [Previous](@previous)

import Foundation


// Problem 1334
// Sat 7/15/2023

//The edit distance between two strings refers to the minimum number of character insertions,
//deletions, and substitutions required to change one string to the other.
//For example, the edit distance between “kitten” and “sitting” is three: substitute the “k” for “s”, substitute the “e” for “i”, and append a “g”.
//
//Given two strings, compute the edit distance between them.



//func calculateEditDistance(_ str1: String, _ str2: String) -> Int {
//
//   let distance = Array(zip(Array(str1), Array(str2))).reduce(0) { return $1.0 != $1.1 ? ($0 + 1) : $0 }
//
//    return distance + abs(str1.count - str2.count)
//}
//
//calculateEditDistance("kitten", "sitting")
//

func minDistance(_ word1: String, _ word2: String) -> Int {
    let m = word1.count
    let n = word2.count

    // Create a 2D array (matrix) to store the edit distances between substrings
    var dp = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: m + 1)

    // Initialize the base cases (empty strings)
    for i in 0...m {
        dp[i][0] = i
    }
    for j in 0...n {
        dp[0][j] = j
    }

    // Fill up the matrix using dynamic programming
    for i in 1...m {
        for j in 1...n {
            let index1 = word1.index(word1.startIndex, offsetBy: i - 1)
            let index2 = word2.index(word2.startIndex, offsetBy: j - 1)

            if word1[index1] == word2[index2] {
                dp[i][j] = dp[i - 1][j - 1] // Characters are the same, no operation needed
            } else {
                dp[i][j] = 1 + min(dp[i - 1][j - 1], dp[i - 1][j], dp[i][j - 1])
            }
        }
    }

    // The bottom-right cell of the matrix contains the edit distance for the entire strings
    return dp[m][n]
}


let word1 = "kitten"
let word2 = "sitting"
let distance = minDistance(word1, word2)
print("Edit distance between '\(word1)' and '\(word2)': \(distance)")
