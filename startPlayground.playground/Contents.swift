//: Playground - noun: a place where people can play

import UIKit

// Constantes
let name = "Rubens"
let pi = 3.1415927
// Because name is a constant, you can`t give a new value after assigning it.
// For example, the following code won`t compile.
//name = "Barbosa"
print(name)
print("Pi: \(pi)")

// Variables
var age = 25
print(age)
// Because age is a variable, you can assign a new value in later lines of code.
// The following code compiles with no erros.
age = 26
print(age)  // This code would print 26 to the console.


// You can assign constants and variables from other constants and variables.
let dafaultScore = 10
var playerOne = dafaultScore
var playerTwo = dafaultScore
print(playerOne)
print(playerTwo)
playerOne = 20
print(playerOne)


// Type Definition, and it defines the properties and functions of a Person type
struct Person {
    // You can see there are two String values, firstName and lastName.
    // These are called properties, which store information about the person.
    let firstName: String
    let lastName: String
    var age: Int
    // You also see sayHello(), which is a function and defines an action for the person.
    func sayHello() {
        print("Hello there! My name is \(firstName) \(lastName) is \(age) years old.")
    }
}
// Whenever you create a new variable, you`re creating an instance of a type. Consider the following code.

let personOne = Person(firstName: "Rubens", lastName: "Barbosa", age: 26)
let personTwo = Person(firstName: "Gabriel", lastName: "Barbosa", age: 20)

print(personOne)
print(personOne.firstName)
print(personOne.lastName)
print(personOne.age)

// This code creates two instances of the Person type.
// One instance represents a Person named Rubens, and the other instance represents a person named Gabriel
personOne.sayHello()
personTwo.sayHello()

/* 
 Here are a few of the most common types in Swift.
 Int -> represents whole numbers, of integers.
 Double -> represents numbers requiring decimal points.
 Bool -> represents true or false values.
 String -> represents text.
 */

// Type inference: specify the type of value when you declare a constant or variable.
let cityName: String = "San Francisco"
let number: Double = 3

print(cityName)
print(number)

var x: Int
x = 10
print(x)

// When you write you own type definition.
struct Car {
    var make: String
    var model: String
    var year: Int
}


// Basic arithmetic: you can use the +,-,* and / operators to perform basic math functionality.
var opponentScore = 3 * 5
var myScore = 100 / 4
print(opponentScore)
print(myScore)
var totalScore = opponentScore + myScore
print(totalScore) // totalScore has a value of 40

totalScore += 3 // totalScore has a value of 43
print(totalScore)
totalScore -= 5 // totalScore has a value of 38
print(totalScore)
totalScore *= 2 // totalScore has a value of 76
print(totalScore)
totalScore /= 2
print(totalScore) // totalScore has a value of 38

let k: Double = 51
let y: Double = 4
let z = k / y // z has a value of 12.75
print(z)

// IF-ELSE STATEMENTS
let temperature = 100
if temperature >= 100 {
    print("The water is boiling.")
} else {
    print("The water is not boiling.")
}
// Console output: The water is boiling.


var finishPosition = 2

if finishPosition == 1 {
    print("Congratulations, you won the gold medal!")
} else if finishPosition == 2 {
    print("You came in second place, you won a silver medal!")
} else {
    print("You did not win a gold or silver medal")
}
// Console output: You came in second place, you won a silver medal!


// Boolean values
let num = 1000
let isSmallNumber = num < 10
print(isSmallNumber) // Console output: false


var isSnowing = false
if !isSnowing {
    print("It is not snowing.")
}
// Console outout: It is not snowing.


// logical and operator, represented by &&
let temp = 70

if temp >= 65 && temp <= 75 {
    print("The temperature is just right.")
} else if temp < 65 {
    print("It is too cold.")
} else {
    print("It is too hot.")
}
// Console outout: The temperature is just right.


// logical or operator, represented by ||
var isPluggedIn = false
var hasBatteryPower = true

if isPluggedIn || hasBatteryPower {
    print("You can use your laptop.")
} else {
    print("=O")
}
// Console outout: You can use your laptop.


// Switch statement

let numberOfWheels = 2

switch numberOfWheels {
case 1:
    print("Unicycle")
case 2:
    print("Bicycle")
case 3:
    print("Tricycle")
case 4:
    print("Quadcycle")
default:
    print("That`s a lot of wheels!")
}
// Console outout: Bicycle


// Ternary operator
var largest: Int

let a = 15
let b = 4

if a > b {
    largest = a
} else {
    largest = b
}
// You can read it as: "if a > b, assign a to the largest constant; otherwise, assign b."
// In this case, a is greater than b, so it`s assigned to largest.
largest = a > b ? a : b


var myString = ""

if myString.isEmpty {
    print("The string is empty")
}
// Console outout: The string is empty

let r = "r" // 'r' is a String
let f: Character = "f" // 'f' is a Character


// Concatenation and interpolation

let str1 = "Hello"
let str2 = ", world!"
let concatString = str1 + str2 // "Hello, world!"


let m = 4
let n = 5
print("If a is \(m) and b is \(n), then a + b equals \(m+n) ")
// Console output: If a is 4 and b is 5, then a + b equals 9


let nome = "Johnny Appleseed"
if nome.lowercased() == "joHnnY aPPleseeD".lowercased() {
    print("The two name are equal.")
}
// Console output: The two name are equal.

let myName = "Rubens Santos Barbosa"
let count = myName.characters.count
print(count) // Console output: 21

let newPassword = "12345"
if newPassword.characters.count < 8 {
    print("This password is too short. Password should have at least eight characters.")
} // Console output: This password is too short. Password should have at least eight characters.


// Functions

func displayPi() {
    print("3.1415926535")
}
displayPi() // Console output: 3.1415926535

func triple(value: Int) {
    let result = value * 3
    print("If you multiply \(value) by 3, you'll get \(result)")
}
triple(value: 3) // Console output: If you multiply 3 by 3, you'll get 9

func multiply(firstNum: Int, secondNum: Int) {
    let result = firstNum * secondNum
    print("The result is \(result)")
}
multiply(firstNum: 10, secondNum: 5) // Console output: The result is 50

func sayHello(firstNome: String) {
    print("Hi, \(firstNome)!")
}
sayHello(firstNome: "Rubens") // Console output: Hi, Rubens!


func sayHelloo(to person: String, and anotherPerson: String) {
    print("Hello \(person) and \(anotherPerson)")
}
sayHelloo(to: "Rubens", and: "Gabriel") // Console output: Hello Rubens and Gabriel

func sayHellooo(_ person: String, _ anotherPerson: String) {
    print("Hello \(person) and \(anotherPerson)")
}
sayHellooo("Rubens", "Gabriel") // Console output: Hello Rubens and Gabriel

func multiplyReturn(fNum: Int, sNum: Int) -> Int {
    let res = fNum * sNum
    return res
}

let myResult = multiplyReturn(fNum: 5, sNum: 5)
print("5 * 5 is \(myResult)")  // Console output: 5 * 5 is 25


struct Whoiam {

    var n: String
    func hi() {
        print("Hi, there! My name is \(n)")
    }

}

let whoiam = Whoiam(n: "Rubens")
whoiam.hi()
// Console output: Hi, there! My name is Rubens
