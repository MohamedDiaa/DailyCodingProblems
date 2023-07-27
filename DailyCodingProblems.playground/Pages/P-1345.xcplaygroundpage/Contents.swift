//: [Previous](@previous)

import Foundation

/*
     Given an array of integers out of order,
     determine the bounds of the smallest window that must be sorted in order for the entire array to be sorted.
     For example, given [3, 7, 5, 6, 9], you should return (1, 3).'

*/

let array = [3, 7, 5, 6, 9]


func boundOfSmallestWindow(_ array: [Int]) -> Range<Array<Int>.Index> {

    var lowerBound = -1
    var upperBound = -1

    for (n,c) in  zip(array, array.sorted()).enumerated() {

        if c.0 != c.1 {
            if lowerBound == -1 {
                lowerBound = n
            }
            upperBound = n
        }
    }

    return array.indices[lowerBound...upperBound]
}

boundOfSmallestWindow(array)

// Chat GPT solution

func findUnsortedSubarray(_ nums: [Int]) -> (Int, Int) {
    var start = -1
    var end = -2

    // Find the starting index of the unsorted window
    for i in 1..<nums.count {
        if nums[i] < nums[i - 1] {
            start = i - 1
            break
        }
    }

    // The array is already sorted
    if start == -1 {
        return (0, 0)
    }

    // Find the ending index of the unsorted window
    for i in (0..<nums.count - 1).reversed() {
        if nums[i] > nums[i + 1] {
            end = i + 1
            break
        }
    }

    // Find the minimum and maximum elements in the unsorted window
    var minInWindow = Int.max
    var maxInWindow = Int.min
    for i in start...end {
        minInWindow = min(minInWindow, nums[i])
        maxInWindow = max(maxInWindow, nums[i])
    }

    let s = nums[start...end].min()

    // Expand the window to include any additional elements that need to be sorted
    while start > 0 && nums[start - 1] > minInWindow {
        start -= 1
    }

    while end < nums.count - 1 && nums[end + 1] < maxInWindow {
        end += 1
    }

    return (start, end)
}

// Example usage:
let nums = [3, 7, 5, 6, 9]
let result = findUnsortedSubarray(nums)
print(result) // Output: (1, 3)



