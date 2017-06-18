//
//  ViewController.swift
//  pickerView2
//
//  Created by IFCE on 29/05/17.
//  Copyright © 2017 IFCE. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var dados = [ ["fortaleza", "rio de janeiro", "bahia"],
                  ["praia de iracema", "dragao do mar", "corcovado", "pao de acucar", "maracana", "pelourinho"] ]
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // conta quantos componentes tem
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return dados.count
    }
    
    // conta o numero de linhas de cada elemento
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dados[component].count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dados[component][row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let cidade = dados[0][pickerView.selectedRow(inComponent: 0)]
        let local = dados[1][pickerView.selectedRow(inComponent: 1)]
        
        label.text = "Quando for a \(cidade), visite \(local)"
        
    }
    
}

