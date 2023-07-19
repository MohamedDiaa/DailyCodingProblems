//: [Previous](@previous)

import Foundation

// Continuation for problem 1337
//Bonus: Create a generator that produces primes indefinitely (that is, without taking N as an input).

struct PrimeGenerator: IteratorProtocol {
    private var primes: [Int] = [2]
    private var currentNumber = 3

    mutating func next() -> Int? {
        if currentNumber == 3 {
            currentNumber += 1
            return 2
        }

        while true {
            if isPrime(number: currentNumber) {
                primes.append(currentNumber)
                let result = currentNumber
                currentNumber += 2
                return result
            }
            currentNumber += 2
        }
    }

    private func isPrime(number: Int) -> Bool {
        let maxDivisor = Int(sqrt(Double(number))) + 1
        for prime in primes {
            if prime > maxDivisor {
                break
            }
            if number % prime == 0 {
                return false
            }
        }
        return true
    }
}

var primeGenerator = PrimeGenerator()
for _ in 1...10 {
    if let nextPrime = primeGenerator.next() {
        print(nextPrime)
    }
}
