import Foundation
import UIKit
import PlaygroundSupport

public typealias RenderProcedure = (CGContext) -> ()

class DiagramView: UIView {
    
    var render: RenderProcedure?
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let context = UIGraphicsGetCurrentContext()
        context?.setStrokeColor(UIColor.green.cgColor)
        context?.setLineWidth(5)
        
        render?(context!)
        
        context?.strokePath()
        context?.fillPath()
    }
    
}


public func showDiagram(using procedure: @escaping RenderProcedure) {
    
    let diagramView = DiagramView(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
    diagramView.render = procedure
    PlaygroundPage.current.liveView = diagramView
}
