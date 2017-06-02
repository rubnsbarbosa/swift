//
//  ViewController.swift
//  textFieldApp
//
//  Created by Rubens Santos Barbosa on 22/05/17.
//  Copyright © 2017 Rubens Santos Barbosa. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var lbl2: UILabel!
    
    @IBOutlet weak var txtField1: UITextField!
    @IBOutlet weak var txtField2: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtField1.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

