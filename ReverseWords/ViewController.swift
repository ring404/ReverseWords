//
//  ViewController.swift
//  ReverseWords
//
//  Created by Dmitrii on 09.11.2021.
//

import UIKit

class ViewController: UIViewController, UINavigationBarDelegate {

    let headerFont = UIFont(name: "SFProDisplay-Bold", size: 34)
    let regularFont = UIFont(name: "SFProDisplay-Regular", size: 17)
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var reverseWordsLabel: UILabel!
    @IBOutlet weak var navigationBar: UINavigationBar!
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
    
    @IBOutlet weak var reverseButton: UIButton!
    
    @IBAction func editingDidBegin(_ sender: UITextField) {
        sender.setUnderLine(color: UIColor(red: 0, green: 0.478, blue: 1, alpha: 1).cgColor)
        reverseButton.isHighlighted = false
    }
    
    @IBAction func editingDidEnd(_ sender: UITextField, forEvent event: UIEvent) {
        sender.setUnderLine(color: UIColor.darkGray.cgColor)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.delegate = self
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.font : regularFont!]
        
        descriptionLabel.textColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.6)
        textInput.setUnderLine(color: UIColor.darkGray.cgColor)
        reverseButton.isHighlighted = true
        reverseWordsLabel.font = headerFont
        descriptionLabel.font = regularFont
        textInput.font = regularFont
        textOutput.font = regularFont?.withSize(24)
        
      setupConstraints()
        
        
        
    }
    func position(for bar: UIBarPositioning) -> UIBarPosition { return .topAttached }
    
    func setupConstraints () {
        let parent = self.view!
        reverseButton.translatesAutoresizingMaskIntoConstraints = false
        reverseButton.heightAnchor.constraint(equalToConstant: 56).isActive = true
        reverseButton.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 16).isActive = true
        reverseButton.trailingAnchor.constraint(equalTo: parent.trailingAnchor, constant: -16).isActive = true
        reverseButton.bottomAnchor.constraint(equalTo: parent.bottomAnchor, constant: -66).isActive = true
        
        reverseWordsLabel.translatesAutoresizingMaskIntoConstraints = false
        reverseWordsLabel.heightAnchor.constraint(equalToConstant: 41).isActive = true
        reverseWordsLabel.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 16).isActive = true
        reverseWordsLabel.trailingAnchor.constraint(equalTo: parent.trailingAnchor, constant: -16).isActive = true
        reverseWordsLabel.topAnchor.constraint(equalTo: parent.topAnchor, constant: 152).isActive = true
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.heightAnchor.constraint(equalToConstant: 44).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 16).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: parent.trailingAnchor, constant: -16).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: parent.topAnchor, constant: 209).isActive = true
        
        textInput.translatesAutoresizingMaskIntoConstraints = false
        textInput.heightAnchor.constraint(equalToConstant: 22).isActive = true
        textInput.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 16).isActive = true
        textInput.trailingAnchor.constraint(equalTo: parent.trailingAnchor, constant: -16).isActive = true
        textInput.centerYAnchor.constraint(equalTo: parent.centerYAnchor, constant: 0).isActive = true
        
        textOutput.translatesAutoresizingMaskIntoConstraints = false
        textOutput.widthAnchor.constraint(equalToConstant: 184).isActive = true
        textOutput.heightAnchor.constraint(equalToConstant: 22).isActive = true
        textOutput.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 16).isActive = true
        textOutput.topAnchor.constraint(equalTo: parent.topAnchor, constant: 450).isActive = true


    }


}

extension UITextField {

    func setUnderLine(color:CGColor) {
        let border = CALayer()
        let width = CGFloat(0.5)
        border.borderColor = color
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width - 10, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }

}

