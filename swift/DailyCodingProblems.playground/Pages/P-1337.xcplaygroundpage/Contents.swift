//: [Previous](@previous)

import Foundation


// Problem 1337
// Tue 7/18/2023 9:34 PM

//This problem was asked by Square.
//
//The Sieve of Eratosthenes is an algorithm used to generate all prime numbers smaller than N. The method is to take increasingly larger prime numbers, and mark their multiples as composite.
//
//For example, to find all primes less than 100, we would first mark [4, 6, 8, ...] (multiples of two), then [6, 9, 12, ...] (multiples of three), and so on. Once we have done this for all primes less than N, the unmarked numbers that remain will be prime.
//
//Implement this algorithm.
//
//Bonus: Create a generator that produces primes indefinitely (that is, without taking N as an input).

//
//func sieveOfEratosthenes(num: UInt) -> [UInt] {
//
//    var list = Array(2...num)
//
//    func removeMultiplesOfPrime(prime: UInt, list: inout [UInt]) {
//
//        print(prime)
//        let primeIndex = list.firstIndex(of: prime)! + 1
//        for i in primeIndex..<list.endIndex {
//            if list[i] % prime == 0 {
//                list[i] = 0
//            }
//        }
//    }
//
//    for i in list.indices {
//        let n = list[i]
//        if  n != 0 &&  n <= UInt(sqrt(Double(num))) {
//            removeMultiplesOfPrime(prime:  n, list: &list)
//        }
//    }
//
//    return list
//}
//sieveOfEratosthenes(num: 30)


func sieveOfEratosthenes_1(num: UInt) -> [UInt] {
    var list = Array(2...num)

    for i in list.indices {
        let n = list[i]
        if n != 0 && n * n <= num {
            for multiple in stride(from: n * n, through: num, by: Int(n)) {
                list[Int(multiple) - 2] = 0
            }
        }
    }

    return list.filter { $0 != 0 }
}

let n: UInt = 100
let primes = sieveOfEratosthenes_1(num: n)
print("Prime numbers smaller than \(n): \(primes)")


func sieveOfEratosthenes(_ n: Int) -> [Int] {
    var isPrime = [Bool](repeating: true, count: n + 1)
    var primes = [Int]()

    isPrime[0] = false
    isPrime[1] = false

    var p = 2
    while p * p <= n {
        if isPrime[p] {
            for i in stride(from: p * p, through: n, by: p) {
                isPrime[i] = false
            }
        }
        p += 1
    }

    for i in 2...n {
        if isPrime[i] {
            primes.append(i)
        }
    }

    return primes
}


//let n = 100
//let primes = sieveOfEratosthenes(n)
//print("Prime numbers smaller than \(n): \(primes)")
