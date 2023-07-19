//: [Previous](@previous)

import Foundation

//
//You have an N by N board. Write a function that, given N, returns the number of possible arrangements of the board where N queens can be placed on the board without threatening each other, i.e. no two queens share the same row, column, or diagonal.
//


let animals = ["Antelope", "Butterfly", "Camel", "Dolphin"]
for animal in animals {
    print(animal)
}
// Prints "Antelope"
// Prints "Butterfly"
// Prints "Camel"
// Prints "Dolphin"

var animalIterator = animals.makeIterator()
while let animal = animalIterator.next() {
    print(animal)
}
// Prints "Antelope"
// Prints "Butterfly"
// Prints "Camel"
// Prints "Dolphin"
