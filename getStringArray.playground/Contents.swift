//: Playground - noun: a place where people can play

import UIKit
import Foundation

let resultado: NSString = "nome=Rubens Barbosa&phone=987-654"

let value = resultado.components(separatedBy: ["=", "&"])
print(value)

for (i,item) in value.enumerated() where i % 2 != 0 {
    print(item)
}