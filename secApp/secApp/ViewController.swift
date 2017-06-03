//
//  ViewController.swift
//  secApp
//
//  Created by Rubens Santos Barbosa on 22/05/17.
//  Copyright © 2017 Rubens Santos Barbosa. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myLabel2: UILabel!
    @IBOutlet weak var myLabel3: UILabel!
    
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var myTextField2: UITextField!
    @IBOutlet weak var myTextField3: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        myTextField.delegate = self
        myTextField2.delegate = self
        myTextField3.delegate = self
        
        myTextField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: --> TextFieldDelegate
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if (textField == myTextField) {
            myTextField2.becomeFirstResponder()
        } else if (textField == myTextField2) {
            myTextField3.becomeFirstResponder()
        } else if (textField == myTextField3) {
            myTextField.becomeFirstResponder()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

