//
//  ViewController.swift
//  ReverseWords
//
//  Created by Dmitrii on 09.11.2021.
//
import UIKit

class MainViewController: UIViewController {
    
    //MARK: - Properties
    
    var currentState: State = .initial {
        didSet {
            updateUIAccordingToNewState()
        }
    }
    let reverseStringManager = ReverseStringManager.init()
    
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
            self.textInput.delegate = self
            textInput.font = Font.regular
            textInput.textColor = Color.inputTextInactive
            textInput.attributedPlaceholder = NSAttributedString(
                string: "Text to reverse",
                attributes: [NSAttributedString.Key.foregroundColor: Color.inputTextInactive,
                             NSAttributedString.Key.font: Font.regular])
            
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
        determineCurrentState(trigger: .textChanged)
    }
    @IBAction private func buttonPressed(_ sender: UIButton) {
        determineCurrentState(trigger: .buttonPressed)
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
        switch currentState {
        case .initial:
            textInput.text?.removeAll()
            textOutput.text.removeAll()
            dividerView.backgroundColor = Color.dividerNonActive
            reverseButton.setTitleColor(.white, for: .normal)
            reverseButton.tintColor = Color.reverseButtonInactive
            reverseButton.isUserInteractionEnabled = false
            reverseButton.setTitle(ButtonTitle.reverse, for: .normal)
        case .input:
            textInput.textColor = Color.inputTextActive
            dividerView.backgroundColor = Color.dividerActive
            reverseButton.tintColor = Color.reserseButtonActive
            reverseButton.isUserInteractionEnabled = true
            reverseButton.setTitle(ButtonTitle.reverse, for: .normal)
        case .result(let reversedtext):
            dividerView.backgroundColor = Color.dividerNonActive
            reverseButton.setTitle(ButtonTitle.clear, for: .normal)
            textOutput.text = reversedtext
        }
    }
    
    private func determineCurrentState(trigger: Trigger) {
        
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
    private func keyboardHidingManager () {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    private func setConstraints () {
        reverseWordsLabelConstraints(view)
        descriptionLabelConstraints(view)
        textInputConstraints(view)
        dividerViewConstraints(view)
        textOutputConstraints(view)
        reverseButtonConstraints(view)
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
        textInput.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 59).isActive = true
    }
    fileprivate func dividerViewConstraints(_ parent: UIView) {
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        dividerView.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 16).isActive = true
        dividerView.trailingAnchor.constraint(equalTo: parent.trailingAnchor, constant: -16).isActive = true
        dividerView.topAnchor.constraint(equalTo: textInput.bottomAnchor, constant: 18.5).isActive = true
    }
    fileprivate func textOutputConstraints(_ parent: UIView) {
        textOutput.translatesAutoresizingMaskIntoConstraints = false
        textOutput.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 16).isActive = true
        textOutput.trailingAnchor.constraint(equalTo: parent.trailingAnchor, constant: 16).isActive = true
        textOutput.bottomAnchor.constraint(equalTo: reverseButton.topAnchor, constant: -10).isActive = true
        textOutput.topAnchor.constraint(equalTo: dividerView.bottomAnchor, constant: 24.5).isActive = true
        textOutput.widthAnchor.constraint(equalToConstant: 343).isActive = true
    }
    fileprivate func reverseButtonConstraints(_ parent: UIView) {
        reverseButton.translatesAutoresizingMaskIntoConstraints = false
        reverseButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        reverseButton.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 13).isActive = true
        reverseButton.trailingAnchor.constraint(equalTo: parent.trailingAnchor, constant: -13).isActive = true
        reverseButton.bottomAnchor.constraint(equalTo: parent.bottomAnchor, constant: -60).isActive = true
    }
}

extension MainViewController {
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

extension UIFont {
    static func main(weight: Weight = .regular, size: CGFloat) -> UIFont {
        switch weight {
        case .bold:
            return UIFont(name: "SFProDisplay-Bold", size: size) ?? UIFont.systemFont(ofSize: size, weight: .bold)
        default:
            return UIFont(name: "SFProDisplay-Regular", size: size) ?? UIFont.systemFont(ofSize: size)
        }
    }
}

extension UIViewController {
    func makeKeyboardHideOnTap() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTapOnView))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func handleTapOnView() {
        view.endEditing(true)
    }
}

extension MainViewController: UINavigationBarDelegate {
    private func adjustNavBar () {
        navigationBar.delegate = self
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.font : Font.regular]
    }
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
}

extension MainViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        determineCurrentState(trigger: .buttonPressed)
        view.endEditing(true)
        return true
    }
}
