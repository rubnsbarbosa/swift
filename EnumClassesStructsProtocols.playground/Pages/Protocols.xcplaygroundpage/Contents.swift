
//Enumerations
//Classes and Structs
//Properties
//Methods
//Initialization
//Designated and Convenience Initializers
//Extensions

import UIKit
import PlaygroundSupport

enum CompassPoint: String {

    case north
    case south
    case east
    case west

}

let point: CompassPoint = .north
point.rawValue

enum Barcode {

    case QRCode(String)
    case UPCA(Int, Int, Int,Int)

}

var productBarcode = Barcode.QRCode("ABCDE")
productBarcode = .UPCA(10, 3333, 2222, 3)

switch productBarcode {
    
case .UPCA(let system, let manufacture, let product, let check):
    print("UPC-A: \(system), \(manufacture), \(product), \(check)")

case .QRCode(let code):
    print("QRCode: \(code)")
 
}

// class & struct
//definem propriedades, métodos, construtores, 
//podem ser extendidos
//estar em conformidade com protocolos (que sao as interfaces do Java)
//classes possuem características adicionais: heranca, conversao de tipo, deinitializers, uma instancia pode ter mais de uma referencia
//classes e struct possuem sintaxes similares
struct resolution {
    // code
}
class videoMode {
    // code
}
/*
structs e enumerations em Swift sao Value Types
classes sao Reference Types
Usamos structs quando: O proposito do model [e encapsular dados relativamente simples
Eh esperado que os dados encapsulados sejam copiados e nao referenciados
*/

struct Point {

    var x: Float
    var y: Float
    
}

let p = Point(x: 150, y: 200)


struct Size {
    
    var width: Float
    var height: Float

}

struct Rect {

    var origin: Point
    var size: Size {
        willSet {
            size
            newValue
        }
    
        didSet {}
    }
    

    var area: Float {
        get {
            return self.size.width * self.size.height
        }
    }
    
    var center: Point {
        get {
            var center = origin
            center.x += size.width/2
            center.y += size.height/2
            return center
        }
        set {
            origin.x = newValue.x - size.width/2
            origin.y = newValue.y - size.height/2
        }
    }
    
}

let origin = Point(x: 0, y: 0)
let size = Size(width: 100, height: 100)
var rect = Rect(origin: origin, size: size)

rect.center = Point(x: 100, y: 100)
print(rect)


//Initialization
struct Celsius {
    
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
}

let c = Celsius(fromFahrenheit: 70)
print(c)


//is and as

/*
var a = [any]()
a.append(1)
a.append("String")
a.append(1.0)

for v in a {
    
    if v = v as? Int {

    }
}
*/

//Protocols
/*
 Define um conjunto de métodos, propriedades e iniciadores
 Podem ser adotados por classes, structs e enum
 Qualquer tipo que adota um procolo é dito que está em conformidade com o protocolo.
 
 struct SomeStructure: FirstProtocol, AnotherProtocol {
    // Definicoes da struct
 }
 
 class SomeClass: FirstProtocol, AnotherProtocol {
    // Definicoes da classe
 }
 
 Nao especifica se é uma propriedade armazenada ou computada
 Apenas especifica o nome e o tipo
 Tbm especifica os acessos à propriedade. ({ get } { get set })
 
 Protocolos podem especificar métodos de instancia e de tipo
 Nao é permitido definir valores padrao para parametros de métodos especificados em protocolos
 Métodos de tipo sao especificados com a palavra chave static
 */

protocol Render {
    
    func move(to position: Point)
    func addLine(to position: Point)
    func add(rect: Rect)
    func addArc(center: Point, radius: Float, startAngle: Float, endAngle: Float)
    
}


class TestRender: Render {
    
    func move(to position: Point) {
        print("Movendo par ao ponto x: \(position.x), \(position.y)")
    }
    
    func addLine(to position: Point) {
        print("Desenhando linha até: \(position.x), \(position.y)")
    }

    func add(rect: Rect) {
         print("Adicionando Retangulo: \(rect)")
    }
    
    func addArc(center: Point, radius: Float, startAngle: Float, endAngle: Float) {
         print("Adicionando arco centralizado em : \(center.x), \(center.y), com raio: \(radius)")
    }
    
}

protocol Drawable {
    
    func draw(with render: Render)
    
}

struct Circle: Drawable {
    
    var center: Point
    var radius: Float
    
    func draw(with render: Render) {
        render.addArc(center: self.center, radius: self.radius, startAngle: 0, endAngle: 2 * Float.pi)
    }
    
}

let render = TestRender()

let circleCenter = Point(x: 200, y: 200)
let circle = Circle(center: circleCenter, radius: 100)
circle.draw(with: render)

struct Diagram: Drawable {
    
    var elements: [Drawable]

    func draw(with render: Render) {
    
        for element in elements {
            element.draw(with: render)
        }
        
    }
}

let d = Diagram(elements: [circle])
d.draw(with: render)

/*
struct Rectang: Drawable {
    
    var origin = Point(x: 0, y: 0)
    var size = Size(width: 100, height: 100)
    //var rect = Rect(origin: origin, size: size)
    
    var rect = Rect(origin: (x: 0, y: 0), size: (width: 100, heigth: 100))
    
    func draw(with render: Render) {
        render.add(rect: self.rect)
    }
    
}
*/


extension Double {

    var km: Double { return self * 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    
}

let double: Double = 10.0
double.km


extension CGContext: Render {

    func move(to position: Point) {
        let point = CGPoint(x: CGFloat(position.x), y: CGFloat(position.y))
        self.move(to: point)
    }
    
    func addLine(to position: Point) {
        
    }
    
    func add(rect: Rect) {
        
    }
    
    func addArc(center: Point, radius: Float, startAngle: Float, endAngle: Float) {
        
    }
}







