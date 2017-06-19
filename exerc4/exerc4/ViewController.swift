//
//  ViewController.swift
//  exerc4
//
//  Created by Rubens Santos Barbosa on 25/05/17.
//  Copyright © 2017 Rubens Santos Barbosa. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var lbTexto1: UILabel!
    @IBOutlet weak var lbTexto2: UILabel!
    
    @IBOutlet weak var txtField1: UITextField!
    @IBOutlet weak var txtField2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtField1.delegate = self
        txtField2.delegate = self
        txtField1.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        txtField2.delegate = self
    }
    
    // method when the user taps the keyboard’s return button.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

