//
//  ViewController.swift
//  ReverseWords
//
//  Created by Dmitrii on 09.11.2021.
//
import UIKit

class MainViewController: UIViewController {
    
    //MARK: - Properties
    
    private var currentState: State = .initial {
        didSet {
            updateUIAccordingToNewState()
        }
    }
    private let reverseStringManager = ReverseStringManager()
    
    // MARK: - Outlets
    
    @IBOutlet private weak var dividerView: UIView! {
        didSet {
            dividerView.backgroundColor = Color.dividerNonActive
        }
    }
    @IBOutlet private weak var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.textColor = Color.labelText
            descriptionLabel.font = Font.regular
        }
    }
    @IBOutlet private weak var reverseWordsLabel: UILabel! {
        didSet {
            reverseWordsLabel.font = Font.header
        }
    }
    @IBOutlet private weak var navigationBar: UINavigationBar!
    
    @IBOutlet private weak var textInput: UITextField! {
        didSet {
            textInput.delegate = self
            textInput.font = Font.regular
            textInput.textColor = Color.inputTextInactive
            textInput.attributedPlaceholder = Placeholder.attributed
            
        }
    }
    @IBOutlet private weak var textOutput: UITextView! {
        didSet {
            textOutput.font = Font.output
            textOutput.textColor = Color.outputText
        }
    }
    @IBOutlet private weak var reverseButton: UIButton! {
        didSet {
            reverseButton.setTitleColor(.white, for: .normal)
            reverseButton.tintColor = Color.reverseButtonInactive
            reverseButton.isUserInteractionEnabled = false
        }
    }
    
    // MARK: - Actions
    
    @IBAction private func editingDidChanged(_ sender: UITextField) {
        setUpCurrentState(trigger: .textChanged)
    }
    
    @IBAction private func buttonPressed(_ sender: UIButton) {
        setUpCurrentState(trigger: .buttonPressed)
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraints()
        adjustNavBar()
        makeKeyboardHideOnTap()
    }
    
    // MARK: - Methods
    
    private func updateUIAccordingToNewState() {
        
        func setUpIniTialState() {
            textInput.text?.removeAll()
            textOutput.text.removeAll()
            dividerView.backgroundColor = Color.dividerNonActive
            reverseButton.setTitleColor(.white, for: .normal)
            reverseButton.tintColor = Color.reverseButtonInactive
            reverseButton.isUserInteractionEnabled = false
            reverseButton.setTitle(ButtonTitle.reverse, for: .normal)
        }
        
        func setUpInputState() {
            textInput.textColor = Color.inputTextActive
            dividerView.backgroundColor = Color.dividerActive
            reverseButton.tintColor = Color.reserseButtonActive
            reverseButton.isUserInteractionEnabled = true
            reverseButton.setTitle(ButtonTitle.reverse, for: .normal)
        }
        
        func setUpResultState(_ reversedText:String) {
            dividerView.backgroundColor = Color.dividerNonActive
            reverseButton.setTitle(ButtonTitle.clear, for: .normal)
            textOutput.text = reversedText
        }
        
        switch currentState {
        case .initial:
           setUpIniTialState()
            
        case .input:
           setUpInputState()
            
        case .result(let reversedText):
            setUpResultState(reversedText)
        }
    }
    
    private func setUpCurrentState(trigger: Trigger) {
        
        switch currentState {
        case .initial:
            if !(textInput.text?.isEmpty ?? false) {
                currentState = .input
            }
            
        case .input:
            switch trigger {
            case .buttonPressed:
                if !(textInput.text?.isEmpty ?? false) {
                    let reversedStringValue = reverseStringManager.reverseString(text: textInput.text ?? "")
                    currentState = .result(reversedtext: reversedStringValue)
                }
                
            case .textChanged:
                if textInput.text?.isEmpty ?? false {
                    currentState = .initial
                }
            }
            
        case .result(reversedtext: let reversedtext):
            textOutput.text = reversedtext
            switch trigger {
            case .buttonPressed:
                currentState = .initial
                
            case .textChanged:
                if !(textInput.text?.isEmpty ?? false) {
                    currentState = .input
                }
            }
        }
    }
    
    private func setConstraints () {
        reverseWordsLabelConstraints()
        descriptionLabelConstraints()
        textInputConstraints()
        dividerViewConstraints()
        textOutputConstraints()
        reverseButtonConstraints()
    }
    fileprivate func reverseWordsLabelConstraints() {
        reverseWordsLabel.translatesAutoresizingMaskIntoConstraints = false
        reverseWordsLabel.topAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: 64).isActive = true
        reverseWordsLabel.heightAnchor.constraint(equalToConstant: 41).isActive = true
        reverseWordsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        reverseWordsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
    }
    fileprivate func descriptionLabelConstraints() {
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.heightAnchor.constraint(equalToConstant: 44).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 33).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -34).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: reverseWordsLabel.bottomAnchor, constant: 16).isActive = true
    }
    fileprivate func textInputConstraints() {
        textInput.translatesAutoresizingMaskIntoConstraints = false
        textInput.heightAnchor.constraint(equalToConstant: 22).isActive = true
        textInput.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        textInput.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        textInput.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 59).isActive = true
    }
    fileprivate func dividerViewConstraints() {
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        dividerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        dividerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        dividerView.topAnchor.constraint(equalTo: textInput.bottomAnchor, constant: 18.5).isActive = true
    }
    fileprivate func textOutputConstraints() {
        textOutput.translatesAutoresizingMaskIntoConstraints = false
        textOutput.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        textOutput.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        textOutput.topAnchor.constraint(equalTo: dividerView.bottomAnchor, constant: 24.5).isActive = true
    }
    fileprivate func reverseButtonConstraints() {
        reverseButton.translatesAutoresizingMaskIntoConstraints = false
        reverseButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        reverseButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 13).isActive = true
        reverseButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -13).isActive = true
        reverseButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60).isActive = true
        reverseButton.topAnchor.constraint(equalTo: textOutput.bottomAnchor, constant: 10).isActive = true
    }
}

// MARK: - Constants

private extension MainViewController {
    enum Font {
        static let header:UIFont = UIFont.main(weight: .bold, size: 34)
        static let regular:UIFont = UIFont.main(size: 17)
        static let output:UIFont = UIFont.main(size: 24)
    }
    enum Color {
        static let dividerNonActive = UIColor(red: 0.129, green: 0.129, blue: 0.129, alpha: 0.2)
        static let dividerActive = UIColor(red: 0, green: 0.478, blue: 1, alpha: 1)
        static let labelText = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.6)
        static let inputTextInactive = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.3)
        static let inputTextActive = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 1)
        static let outputText = UIColor(red: 0, green: 0.478, blue: 1, alpha: 1)
        static let reverseButtonInactive = UIColor(red: 0, green: 0.478, blue: 1, alpha: 0.6)
        static let reserseButtonActive = UIColor(red: 0, green: 0.478, blue: 1, alpha: 1)
    }
    enum ButtonTitle {
        static let clear = "Clear"
        static let reverse = "Reverse"
    }
    enum Placeholder {
        static let textColor = Color.inputTextInactive
        static let font = Font.regular
        static let text = "Text to reverse"
        static let attributed = NSAttributedString(
            string: text,
            attributes: [
                NSAttributedString.Key.foregroundColor: textColor,
                NSAttributedString.Key.font: font
            ]
        )
    }
}

// MARK: - Models

private extension MainViewController {
    
    enum State {
        case initial
        case input
        case result(reversedtext: String)
    }
    enum Trigger {
        case buttonPressed
        case textChanged
    }
}

// MARK: - Navigation bar delegate

extension MainViewController: UINavigationBarDelegate {
    private func adjustNavBar () {
        navigationBar.delegate = self
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.font : Font.regular]
    }
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
}

// MARK: - Text field delegate

extension MainViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        setUpCurrentState(trigger: .buttonPressed)
        view.endEditing(true)
        return true
    }
}
