//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

func countWays(matrix: [[Int]]) -> Int {
    if matrix.isEmpty || matrix[0].isEmpty {
        return 0
    }

    let n = matrix.count
    let m = matrix[0].count

    var dp = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)

    // Base case: the bottom right cell has 1 way to reach itself.
    dp[n - 1][m - 1] = 1

    // Calculate the number of ways for the last column.
    for i in stride(from: n - 2, through: 0, by: -1) {
        if matrix[i][m - 1] == 1 {
            dp[i][m - 1] = 0
        } else {
            dp[i][m - 1] = dp[i + 1][m - 1]
        }
    }

    // Calculate the number of ways for the last row.
    for j in stride(from: m - 2, through: 0, by: -1) {
        if matrix[n - 1][j] == 1 {
            dp[n - 1][j] = 0
        } else {
            dp[n - 1][j] = dp[n - 1][j + 1]
        }
    }

    // Calculate the number of ways for the rest of the cells.
    for i in stride(from: n - 2, through: 0, by: -1) {
        for j in stride(from: m - 2, through: 0, by: -1) {
            if matrix[i][j] == 1 {
                dp[i][j] = 0
            } else {
                dp[i][j] = dp[i + 1][j] + dp[i][j + 1]
            }
        }
    }

    return dp[0][0]
}

// Example usage:
let matrix = [
    [0, 0, 1],
    [0, 0, 1],
    [1, 0, 0]
]
print(countWays(matrix: matrix)) // Output: 2
