//: [Previous](@previous)

import Foundation

// Problem 1336
// Mon 7/17/2023

//This problem was asked by Microsoft.

//  You have an N by N board. Write a function that, given N,
//  returns the number of possible arrangements of the board
//  where N queens can be placed on the board without threatening each other,
//  i.e. no two queens share the same row, column, or diagonal.


func totalNQueens(_ n: Int) -> Int {
    var count = 0
    var queensPositions = [Int](repeating: -1, count: n)

    // Helper function to check if a position is safe to place a queen
    func isSafe(row: Int, col: Int) -> Bool {
        for i in 0..<row {
            if queensPositions[i] == col || abs(queensPositions[i] - col) == abs(i - row) {
                return false
            }
        }
        return true
    }

    // Backtracking function to find all valid arrangements
    func backtrack(_ row: Int) {
        if row == n {
            count += 1 // A valid arrangement is found
            return
        }

        for col in 0..<n {
            if isSafe(row: row, col: col) {
                queensPositions[row] = col
                backtrack(row + 1)
                queensPositions[row] = -1
            }
        }
    }

    backtrack(0) // Start placing queens from the first row
    return count
}


let n = 4
let result = totalNQueens(n)
print("Number of possible arrangements for \(n) queens: \(result)")
