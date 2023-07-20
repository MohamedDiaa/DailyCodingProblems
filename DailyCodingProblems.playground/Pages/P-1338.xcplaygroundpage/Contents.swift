//: [Previous](@previous)

import Foundation

//        Problem 1338
//
//        This problem was asked by Microsoft.
//
//        Given an unsorted array of integers, find the length of the longest consecutive elements sequence.
//
//        For example, given [100, 4, 200, 1, 3, 2], the longest consecutive element sequence is [1, 2, 3, 4]. Return its length: 4.
//
//        Your algorithm should run in O(n) complexity.


func lengthOfLongestConsecutiveSequence(list: [Int]) -> Int {

    var longest: Int = 0
    var current: Int = 1

    let sorted = list.sorted()

    for i in sorted.indices.dropLast() {

        if (sorted[i] + 1 ) == sorted[i+1] {
            current += 1
        } else {
            if current > longest {
                longest = current
            }
            current = 1
        }
    }

    return longest
}


let given = [100, 4, 200, 1, 3, 2]
let result = lengthOfLongestConsecutiveSequence(list: given)
print("the length Of longest consecutive sequence of \(given) is  \(result)")


// Chat GPt solution

func longestConsecutive(_ nums: [Int]) -> Int {
    // Convert the array to a set for fast lookups
    let numSet = Set(nums)
    var longestStreak = 0

    for num in numSet {
        // Check if the current number is the start of a sequence
        if !numSet.contains(num - 1) {
            var currentNum = num
            var currentStreak = 1

            // Find the consecutive elements in the set
            while numSet.contains(currentNum + 1) {
                currentNum += 1
                currentStreak += 1
            }

            // Update the longest streak if necessary
            longestStreak = max(longestStreak, currentStreak)
        }
    }

    return longestStreak
}


let nums = [100, 4, 200, 1, 3, 2]
let longestStreak = longestConsecutive(nums)
print("Length of the longest consecutive sequence: \(longestStreak)")
