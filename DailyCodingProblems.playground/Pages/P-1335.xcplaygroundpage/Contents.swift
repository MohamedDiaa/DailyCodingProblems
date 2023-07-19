//: [Previous](@previous)

import Foundation

/*
 Problem #1335
 Sun 7/16/2023
Good morning! Here's your coding interview problem for today.
This problem was asked by Facebook.
Given the mapping a = 1, b = 2, ... z = 26, and an encoded message, count the number of ways it can be decoded.
For example, the message '111' would give 3, since it could be decoded as 'aaa', 'ka', and 'ak'.
You can assume that the messages are decodable. For example, '001' is not allowed.
*/

//func countWaysOfDecoding(code: String) -> Int {
//
//    let oneDigitMessageCount = code.count
//
//    let twos = Array(zip(Array(code), Array(code).dropFirst()))
//    let twoDigitMessagesCount = twos.compactMap { Int("\($0)\($1)") } .filter {
//        (10...26).contains($0)
//    }.count
//
//    return oneDigitMessageCount + twoDigitMessagesCount
//}

//let code: String = "111"
//
//countWaysOfDecoding(code: code)
//



func numDecodings(_ message: String) -> Int {
    let n = message.count
    guard n > 0 else { return 0 }

    let digits = Array(message)
    var dp = [Int](repeating: 0, count: n + 1)

    // Base cases
    dp[0] = 1
    dp[1] = digits[0] == "0" ? 0 : 1

    print("message = \(Array(message))")
    print(dp)

    for i in 2...n {
        let oneDigit = Int(String(digits[i-1]))!
        let twoDigits = Int(String(digits[i-2...i-1]))!

        if oneDigit >= 1 {
            dp[i] += dp[i-1]
        }

        if twoDigits >= 10 && twoDigits <= 26 {
            dp[i] += dp[i-2]
        }

        print("i=\(i)" + " " + "dp= \(dp)" )
    }

    return dp[n]
}

let encodedMessage = "1113"
let count = numDecodings(encodedMessage)
print("Number of ways to decode: \(count)")


