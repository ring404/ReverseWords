//
//  ViewController.swift
//  ReverseWords
//
//  Created by Dmitrii on 09.11.2021.
//

import UIKit

class ViewController: UIViewController, UINavigationBarDelegate {
    // MARK: - Outlets
    @IBOutlet private weak var dividerView: UIView! { didSet { dividerView.backgroundColor = UsedColors.black }}
    @IBOutlet private weak var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.textColor = UsedColors.gray
            descriptionLabel.font = UsedFonts.labelFont
        }
    }
    @IBOutlet private weak var reverseWordsLabel: UILabel! { didSet { reverseWordsLabel.font = UsedFonts.headerFont }}
    @IBOutlet private weak var navigationBar: UINavigationBar!
    @IBOutlet private weak var textInput: UITextField! { didSet { textInput.font = UsedFonts.inputFont }}
    @IBOutlet private weak var textOutput: UITextField! { didSet { textOutput.font = UsedFonts.outputFont }}
    @IBOutlet private weak var reverseButton: UIButton! {
        didSet {
            reverseButton.setTitleColor(.white, for: .highlighted)
            reverseButton.isHighlighted = true
        }
    }
    // MARK: - Actions
    @IBAction private func buttonPressed(_ sender: UIButton) {
        if textInput.text != "" {
            textOutput.text =  ReverseClass.reverseString(textInput: textInput.text ?? "")
            sender.setTitle(ButtonConditions.clear, for: .normal)
        }
        if sender.titleLabel?.text  == ButtonConditions.clear {
            textInput.text = ""
            textOutput.text = ""
            sender.setTitle(ButtonConditions.reverse, for: .normal)
        }
    }
    @IBAction private func editingDidBegin(_ sender: UITextField) {
        dividerView.backgroundColor = UsedColors.blue
    }
    @IBAction private func editingDidEnd(_ sender: UITextField, forEvent event: UIEvent) {
        dividerView.backgroundColor = UsedColors.black
    }
    // MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        adjustNavBar()
    }
    private func adjustNavBar () {
        navigationBar.delegate = self
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.font : UsedFonts.labelFont!]
    }
    internal func position(for bar: UIBarPositioning) -> UIBarPosition { return .topAttached }
}
