//: [Previous](@previous)

import Foundation

/*
Given an array of numbers and an index i, return the index of the nearest larger number of the number at index i, where distance is measured in array indices.

For example, given [4, 1, 3, 5, 6] and index 0, you should return 3.

If two distances to larger numbers are the equal, then return any one of them. If the array at i doesn't have a nearest larger integer, then return null.

Follow-up: If you can preprocess the array, can you do this in constant time?
*/



let array = [7,4, 1, 3, 5, 2,1,10]


func findNearestLargerNumberIndex(array: [Int], index: Int) -> Int? {

    for i in 1..<(array.count ) {

        var num = array[index]

        if index + i < array.count {
            print("index + \(i) = \(array[index + i])")
            if array[index + i] > num {
                return index + i
            }
        }

        if (index - i) >= 0 {
            print("index - \(i) = \(array[index - i])")

            if array[index - i] > num {
                return index - i
            }
        }
    }
    return nil
}

findNearestLargerNumberIndex(array: array, index: 4)


// Chat GPT solution

func nearestLargerNumber(_ nums: [Int], _ index: Int) -> Int? {
    guard index >= 0 && index < nums.count else {
        return nil
    }

    let n = nums.count
    var nearestLargerToRight = [Int](repeating: n, count: n)
    var nearestLargerToLeft = [Int](repeating: -1, count: n)

    // Find nearest larger element to the right
    var stack = [Int]()
    for i in 0..<n {
        while !stack.isEmpty && nums[i] > nums[stack.last!] {
            nearestLargerToRight[stack.removeLast()] = i
        }
        stack.append(i)
    }

    // Find nearest larger element to the left
    stack.removeAll()
    for i in (0..<n).reversed() {
        while !stack.isEmpty && nums[i] > nums[stack.last!] {
            nearestLargerToLeft[stack.removeLast()] = i
        }
        stack.append(i)
    }

    // Find the nearest larger element and calculate the distances
    var minDistance = Int.max
    var nearestIndex = -1

    for i in 0..<n {
        let distance = min(nearestLargerToRight[i] - i, i - nearestLargerToLeft[i])
        if distance < minDistance {
            minDistance = distance
            nearestIndex = nums[nearestLargerToRight[i]] > nums[nearestLargerToLeft[i]] ? nearestLargerToRight[i] : nearestLargerToLeft[i]
        }
    }

    return nearestIndex == n ? nil : nearestIndex
}

// Example usage:
let nums = [4, 1, 3, 5, 6]
let index = 0
if let result = nearestLargerNumber(nums, index) {
    print(result) // Output: 3
} else {
    print("No nearest larger number found.")
}
