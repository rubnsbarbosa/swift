//: Playground - noun: a place where people can play

import UIKit

protocol FiguraGeometricaDelegate {

    func calculaArea() -> Double

}

class FiguraGeometrica {
    
    var delegate: FiguraGeometricaDelegate?

    func printArea() {
        
        let area = delegate?.calculaArea() ?? 0.0
        
        print("A area da figura geometrica é \(area)")
    
    }

}

class Retangulo: FiguraGeometrica, FiguraGeometricaDelegate {

    var base: Double = 0.0
    var altura: Double = 0.0

    init(base: Double, altura: Double) {
        
        super.init()
        
        self.base = base
        self.altura = altura
        
        delegate = self
        
    }
 
    func calculaArea() -> Double {
        
        let area = base * altura
        
        return area
    }
    
}

class Triangulo: FiguraGeometrica, FiguraGeometricaDelegate {

    var base: Double = 0.0
    var altura: Double = 0.0
    
    init(base: Double, altura: Double) {
        
        super.init()
        
        self.base = base
        self.altura = altura
        
        delegate = self
        
    }
    
    func calculaArea() -> Double {
        let area = (base * altura)/2.0
        
        return area
    }

}

let rect = Retangulo(base: 10, altura: 2)
rect.printArea()
let trian = Triangulo(base: 10, altura: 2)
trian.printArea()
let fg = FiguraGeometrica()
fg.printArea()