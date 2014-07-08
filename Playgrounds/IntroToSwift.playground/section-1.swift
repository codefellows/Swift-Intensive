// Playground - noun: a place where people can play

import Cocoa

//slide 5 - variables and constants
var greeting = "Hello"
let name = " Brad"
greeting = greeting + name
//name = "Jeff" cant do this because name is a constant, cant change its value

let redBox = NSView(frame: NSRect(x: 0, y: 0, width: 100, height: 100))
//redBox = NSView(frame: NSRect(x: 50, y: 50, width: 200, height: 200))
redBox.frame = NSRect(x: 50, y: 50, width: 200, height: 200)


//slide 7 - Ints
let max8bitInt = Int8.max
let min8bitInt = Int8.min

let max8bitUInt = UInt8.max
let min8bitUInt = UInt8.min

let maxInt = Int.max
let minInt = Int.min

// slide 8 - floats and doubles

let maxFloat = 3.225 as Float
let maxDouble = 3.255 as Double

// slide 10 - number conversion
//var product = maxFloat * maxDouble nope
var product = maxFloat * Float(maxDouble) //yep

//slide 13 strings

var mutableName = "Russel"
var immutableName = "Russel"
var RW = mutableName + " Wilson"
for character in RW {
    var letter = "\(character)"
}

//side 15 Arrays
var names : Array<String> = String[]()
names.append("Brad")
names += "John"
var names2 : String[] = ["Brad","John"]
var names3 = ["Brad", "John"]

var empty = names2.isEmpty

//slide 16 Dictionaries

var teams : Dictionary<String,String> = Dictionary()
teams["Sea"] = "Seahawks"
teams.updateValue("niners", forKey: "SF")

var bestTeam = teams["Sea"]


for team in teams.values {
    var newTeam = team
}

//



