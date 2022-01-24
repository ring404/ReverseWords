//
//  ViewController.swift
//  ReverseWords
//
//  Created by Dmitrii on 09.11.2021.
//

import UIKit

class ViewController: UIViewController, UINavigationBarDelegate, UITextViewDelegate {
    // MARK: - Outlets
    @IBOutlet private weak var dividerView: UIView! {
        didSet {
            dividerView.backgroundColor = UsedColors.dividerNonActiveColor
        }
    }
    @IBOutlet private weak var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.textColor  = UsedColors.labelTextColor
            descriptionLabel.font = UsedFonts.labelFont
        }
    }
    @IBOutlet private weak var reverseWordsLabel: UILabel! {
        didSet {
            reverseWordsLabel.font = UsedFonts.headerFont
        }
    }
    @IBOutlet private weak var navigationBar: UINavigationBar!

    @IBOutlet weak var textInput: UITextView! {
        didSet {
            textInput.font = UsedFonts.inputFont
            textInput.textColor = UsedColors.inputTextInactiveColor
                }
    }
    @IBOutlet weak var textOutput: UITextView! {
        didSet {
            textOutput.font = UsedFonts.outputFont
            textOutput.textColor = UsedColors.outputTextColor
        }
    }
    @IBOutlet private weak var reverseButton: UIButton! {
        didSet {
            reverseButton.setTitleColor(.white, for: .highlighted)
            reverseButton.isHighlighted = true
        }
    }
    // MARK: - Actions
    @IBAction private func buttonPressed(_ sender: UIButton) {
        buttonBehaviourManager(sender)
    }
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraints()
        adjustNavBar()
        keyboardHidingManager()
        self.textInput.delegate = self
    }
    private func adjustNavBar () {
        navigationBar.delegate = self
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.font : UsedFonts.labelFont!]
    }
    func position(for bar: UIBarPositioning) -> UIBarPosition { return .topAttached }
    private func buttonBehaviourManager(_ sender: UIButton) {
        if textInput.text != "" {
            textOutput.text = ReverseStringManager.reverseString(text: textInput.text ?? "")
            makeViewAutoHeight(textOutput)
            sender.setTitle(ButtonConditions.clear, for: .normal)
        }
        if sender.titleLabel?.text == ButtonConditions.clear {
            textInput.text = ""
            textOutput.text = ""
            sender.setTitle(ButtonConditions.reverse, for: .normal)
            setConstraints()
            dividerView.backgroundColor = UsedColors.dividerNonActiveColor
        }
    }
    private func keyboardHidingManager () {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    func setConstraints () {
        let parent = self.view!
        reverseWordsLabelConstraints(parent)
        descriptionLabelConstraints(parent)
        textInputConstraints(parent)
        dividerViewConstraints(parent)
        textOutputConstraints(parent)
        reverseButtonConstraints(parent)
    }
    fileprivate func reverseWordsLabelConstraints(_ parent: UIView) {
        reverseWordsLabel.translatesAutoresizingMaskIntoConstraints = false
        reverseWordsLabel.topAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: 64).isActive = true
        reverseWordsLabel.heightAnchor.constraint(equalToConstant: 41).isActive = true
        reverseWordsLabel.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 16).isActive = true
        reverseWordsLabel.trailingAnchor.constraint(equalTo: parent.trailingAnchor, constant: -16).isActive = true
    }
    fileprivate func descriptionLabelConstraints(_ parent: UIView) {
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.heightAnchor.constraint(equalToConstant: 44).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 33).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: parent.trailingAnchor, constant: -34).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: reverseWordsLabel.bottomAnchor, constant: 16).isActive = true
    }
    fileprivate func textInputConstraints(_ parent: UIView) {
        textInput.translatesAutoresizingMaskIntoConstraints = false
        textInput.heightAnchor.constraint(equalToConstant: 22).isActive = true
        textInput.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 16).isActive = true
        textInput.trailingAnchor.constraint(equalTo: parent.trailingAnchor, constant: -16).isActive = true
        textInput.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 40).isActive = true
    }
    fileprivate func dividerViewConstraints(_ parent: UIView) {
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        dividerView.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 16).isActive = true
        dividerView.trailingAnchor.constraint(equalTo: parent.trailingAnchor, constant: -16).isActive = true
        dividerView.topAnchor.constraint(equalTo: textInput.bottomAnchor, constant: 1).isActive = true
    }
    fileprivate func textOutputConstraints(_ parent: UIView) {
        textOutput.translatesAutoresizingMaskIntoConstraints = false
        textOutput.widthAnchor.constraint(equalToConstant: 198).isActive = true
        textOutput.heightAnchor.constraint(equalToConstant: 22).isActive = true
        textOutput.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 16).isActive = true
        textOutput.topAnchor.constraint(equalTo: dividerView.bottomAnchor, constant: 24.5).isActive = true
    }
    fileprivate func reverseButtonConstraints(_ parent: UIView) {
        reverseButton.translatesAutoresizingMaskIntoConstraints = false
        reverseButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        reverseButton.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 13).isActive = true
        reverseButton.trailingAnchor.constraint(equalTo: parent.trailingAnchor, constant: -13).isActive = true
        reverseButton.bottomAnchor.constraint(equalTo: parent.bottomAnchor, constant: -60).isActive = true
    }
    func textViewDidChange(_ textView: UITextView) {
        dividerView.backgroundColor = UsedColors.dividerActiveColor
        makeViewAutoHeight(textView)
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        dividerView.backgroundColor = UsedColors.dividerActiveColor
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        makeViewAutoHeight(textView)
        if textView.text != "" {
            reverseButton.setTitle(ButtonConditions.reverse, for: .normal)
        }
    }
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        if textView.text == "Text to reverse" {
            textView.text = ""
            textView.textColor = UsedColors.inputTextActiveColor
        }
        return true
    }
    func makeViewAutoHeight(_ textView: UITextView) {
        textView.translatesAutoresizingMaskIntoConstraints = true
        textView.sizeToFit()
        textView.frame.size.width = 343
    }
}

extension UIViewController {
    enum UsedFonts {
        static let headerFont = UIFont(name: "SFProDisplay-Bold", size: 34)
        static let labelFont = UIFont(name: "SFProDisplay-Regular", size: 17)
        static let inputFont = UIFont(name: "SFProDisplay-Regular", size: 17)
        static let outputFont = UIFont(name: "SFProDisplay-Regular", size: 24)
    }
    enum UsedColors {
        static let dividerNonActiveColor = UIColor(red: 0.129, green: 0.129, blue: 0.129, alpha: 1)
        static let dividerActiveColor = UIColor(red: 0, green: 0.478, blue: 1, alpha: 1)
        static let labelTextColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.6)
        static let inputTextInactiveColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.3)
        static let inputTextActiveColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 1)
        static let outputTextColor = UIColor(red: 0, green: 0.478, blue: 1, alpha: 1)
    }
    enum ButtonConditions {
        static let clear = "Clear"
        static let reverse = "Reverse"
    }
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
