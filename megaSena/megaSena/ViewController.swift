//
//  ViewController.swift
//  megaSena
//
//  Created by Rubens Santos Barbosa on 25/05/17.
//  Copyright © 2017 Rubens Santos Barbosa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var headMegaSena: UILabel!
    
    @IBOutlet weak var lbNum1: UILabel!
    @IBOutlet weak var lbNum2: UILabel!
    @IBOutlet weak var lbNum3: UILabel!
    @IBOutlet weak var lbNum4: UILabel!
    @IBOutlet weak var lbNum5: UILabel!
    @IBOutlet weak var lbNum6: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func bnJogar(_ sender: UIButton) {
        let randomNum1 = Int(arc4random_uniform(60) + 1)
        let randomNum2 = Int(arc4random_uniform(60) + 1)
        let randomNum3 = Int(arc4random_uniform(60) + 1)
        let randomNum4 = Int(arc4random_uniform(60) + 1)
        let randomNum5 = Int(arc4random_uniform(60) + 1)
        let randomNum6 = Int(arc4random_uniform(60) + 1)
        
        lbNum1.text = String(randomNum1)
        lbNum2.text = String(randomNum2)
        lbNum3.text = String(randomNum3)
        lbNum4.text = String(randomNum4)
        lbNum5.text = String(randomNum5)
        lbNum6.text = String(randomNum6)
    }
    
    @IBAction func btReset(_ sender: Any) {
        lbNum1.text = nil
        lbNum2.text = nil
        lbNum3.text = nil
        lbNum4.text = nil
        lbNum5.text = nil
        lbNum6.text = nil
    }
    
}

