//
//  ViewController.swift
//  demoPickerView
//
//  Created by Rubens Santos Barbosa on 29/05/17.
//  Copyright © 2017 Rubens Santos Barbosa. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var pickerView: UIPickerView!
    
    var herois = ["superman", "batman", "mulher maravilha", "chapolin", "zico"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // pega o numero de componentes
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // pega o numero de linhas do array herois
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return herois.count
    }
    
    // informacao das linhas do componentes (o que vai ser mostrado na tela) titulo da linha
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return herois[row]
    }
    
    // elemento que foi selecionado
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("comp: \(component) row: \(row)")
    }
    
}

