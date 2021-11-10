//
//  ViewController.swift
//  ReverseWords
//
//  Created by Dmitrii on 09.11.2021.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var textInput: UITextField!
    @IBOutlet weak var textOutput: UITextField!
    @IBAction func buttonPressed(_ sender: UIButton) {
        if textInput.text != "" {
            textOutput.text =   textInput.text?.split(separator: " ").map{String($0.reversed())}.joined(separator: " ")
            sender.setTitle("Clear", for: .normal)
        }
        if sender.titleLabel?.text  == "Clear" {
            textInput.text = ""
            textOutput.text = ""
            sender.setTitle("Reverse", for: .normal)
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

