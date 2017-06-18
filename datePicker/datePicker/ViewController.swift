//
//  ViewController.swift
//  datePicker
//
//  Created by Rubens Santos Barbosa on 29/05/17.
//  Copyright © 2017 Rubens Santos Barbosa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dtPicker: UIDatePicker!
    @IBOutlet weak var dtPicker2: UIDatePicker!
    @IBOutlet weak var lbDate: UILabel!
    @IBOutlet weak var lbDateCompare: UILabel!
    
    @IBOutlet weak var showCompareteDate: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dtPicker.locale = Locale(identifier: "pt_BR")
        dtPicker.datePickerMode = .date
        
        dtPicker2.locale = Locale(identifier: "pt_BR")
        dtPicker2.datePickerMode = .date
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func getDatePicker(_ sender: UIDatePicker) {
        
//        let dateFormater = DateFormatter()
//        dateFormater.dateFormat = "dd-MM-yyyy HH:mm"
//        lbDate.text = dateFormater.string(from: sender.date)
//        
//        let nowDate = dateFormater.string(from: Date())
//        let rsp = sender.date > Date() ? "maior" : "menor"
//        
//        lbDateCompare.text = "\(rsp) is \(nowDate) "
        
        // Fazer a comparacao entre os datePicker e dizer a data maior
        
        
    }

}

