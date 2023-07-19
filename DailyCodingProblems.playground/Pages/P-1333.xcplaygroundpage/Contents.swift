//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

// Problem 1333
// Fri 7/14/2023
/*
    Good morning! Here's your coding interview problem for today.

    This problem was asked by Slack.

    You are given an N by M matrix of 0s and 1s. Starting from the top left corner, how many ways are there to reach the bottom right corner?

    You can only move right and down. 0 represents an empty space while 1 represents a wall you cannot walk through.

    For example, given the following matrix:
    [[0, 0, 1],
     [0, 0, 1],
     [1, 0, 0]]
    Return two, as there are only two ways to get to the bottom right:

    Right, down, down, right
    Down, right, down, right
    The top left corner and bottom right corner will always be 0.

*/

// backtracking solution
func countNumberOfWays(matrix:[[Int]]) -> Int {

    let colsCount = matrix.count
    guard let rowsCount = matrix.first?.count , rowsCount > 0
    else  { return 0 }

    if matrix[0][0] == 1 {
        return 0
    }

    var result = 0

    var row = 0
    var col = 0
    
    func backtrack(row: Int, col: Int) {
        if col == colsCount - 1 && row == rowsCount - 1 {
            result += 1
            return
        }

        print("row \(row), col \(col)")
        if matrix[row][col] == 0 {

            if col + 1 < colsCount {
                backtrack(row: row, col: col + 1)
            }

            if row + 1 < rowsCount {
                backtrack(row: row + 1, col: col)
            }
        }
    }

    backtrack(row: 0, col: 0)

    return result
}

print(countNumberOfWays(matrix: matrix)) // Output: 2


let matrix = [ [0, 0, 1 ],
               [0, 0, 1],
            [1, 0 , 0 ]
            ]

let result = countNumberOfWays(matrix: matrix)

print("number of ways are to the bottom right corner \(result)")
