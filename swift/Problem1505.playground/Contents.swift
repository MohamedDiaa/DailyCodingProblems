import UIKit

/*
Good morning! Here's your coding interview problem for today.

This problem was asked by Pinterest.

Given an integer list where each number represents the number of hops you can make, determine whether you can reach to the last index starting at index 0.
For example, [2, 0, 1, 0] returns True while [1, 1, 0, 1] returns False.

*/

let test1 = [2, 0, 1, 0]
let test2 = [1, 1, 0, 1]

func canReachLastIndex(list: [Int]) -> Bool {

    if list.isEmpty {
        return true
    }

    var currentIndex = 0

    while true {
        currentIndex = list[currentIndex] + currentIndex
        print(currentIndex)

        if currentIndex == (list.count - 1) {
            return true
        }
        if currentIndex >= list.count || list[currentIndex] == 0 {
            return false
        }
    }
}

canReachLastIndex(list: test1)
canReachLastIndex(list: test2)

// Chat GPT solution

func canReachLastIndex(_ nums: [Int]) -> Bool {
    var maxReach = 0

    for i in 0..<nums.count {
        // If the current index is beyond the maximum reach, return false
        if i > maxReach {
            return false
        }

        // Update the maximum reach based on the current element and index
        maxReach = max(maxReach, i + nums[i])

        // If the last index is reachable without using the current element, return false
        if maxReach >= nums.count - 1 {
            return true
        }
    }

    // If the loop completes and the last index is not reached, return false
    return false
}


// Example usage:
let example1 = [2, 0, 1, 0]
let example2 = [1, 1, 0, 1]

print(canReachLastIndex(example1)) // Output: true
print(canReachLastIndex(example2)) // Output: false
