//
//  AnagramsViewController.swift
//  ReverseWords
//
//  Created by Dmitrii on 17.02.2022.
//

import UIKit
import SnapKit

class AnagramsViewController: UIViewController {
    
    // MARK: - Properties
    
    private let reverseStringManager = ReverseStringManager()
    private var currentState:Segments = .def {
        didSet {
            updateUIAccordingToNewState()
        }
    }
    var inputText = UITextField.main(placeholder: "Enter text to reverse here")
    var segmentItems:[String] = [Segments.def.rawValue, Segments.custom.rawValue]
    lazy var segmentedSwitcher: UISegmentedControl = {
        return setUpSegmentedControl()
    } ()
    var defaulExplanationLabel = UILabel()
    var inputExclusionField = UITextField.main(placeholder: "Text to ignore")
    var resultButton = UIButton()
    var outputText = UITextView()
    
    // MARK: - Inretface rotate adjustments
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setupLayout()
        configureUI()
        setupTargets()
        setCccessibilityIdentifiers()
    }
    
    // MARK: - Methods
    
    func setupLayout() {
        inputText.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(40)
            make.left.equalTo(view).offset(20)
            make.height.equalTo(40)
            make.right.equalTo(view).offset(-20)
        }
        segmentedSwitcher.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(inputText.snp.bottom).offset(40)
            make.left.equalTo(view).offset(20)
            make.height.equalTo(40)
            make.right.equalTo(view).offset(-20)
        }
        defaulExplanationLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(segmentedSwitcher.snp.bottom).offset(20)
            make.left.equalTo(view).offset(20)
            make.height.equalTo(41)
            make.right.equalTo(view).offset(-20)
        }
        inputExclusionField.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(segmentedSwitcher.snp.bottom).offset(20)
            make.left.equalTo(view).offset(20)
            make.height.equalTo(40)
            make.right.equalTo(view).offset(-20)
        }
        resultButton.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(segmentedSwitcher.snp.bottom).offset(80)
            make.left.equalTo(view).offset(20)
            make.height.equalTo(40)
            make.right.equalTo(view).offset(-20)
        }
        outputText.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(resultButton.snp.bottom).offset(20)
            make.left.equalTo(view).offset(20)
            make.right.equalTo(view).offset(-20)
            make.bottom.equalTo(view.safeAreaInsets.bottom)
        }
    }
    
    func configureUI() {
        currentState = .def
        view.backgroundColor = .white
        defaulExplanationLabel.text = "All characters except alphabetic symbols"
        resultButton.setTitle("Result", for: .normal)
        resultButton.setTitleColor(.systemBlue, for: .normal)
        outputText.font = UIFont.systemFont(ofSize: 15)
        outputText.isEditable = false
    }
    
    func setupTargets() {
        resultButton.addTarget(self, action: #selector(reverseButtonAction(_:)), for: UIControl.Event.touchUpInside)
        inputText.addTarget(self, action: #selector(inputTextEditingDidEnd), for: .editingChanged)
        inputExclusionField.addTarget(self, action: #selector(inputTextEditingDidEnd), for: .editingChanged)
    }
    
    func setCccessibilityIdentifiers() {
        inputText.accessibilityIdentifier = "inputText"
        inputExclusionField.accessibilityIdentifier = "inputExclusionField"
        resultButton.accessibilityIdentifier = "resultButton"
        outputText.accessibilityIdentifier = "outputText"
    }
    
    @objc func inputTextEditingDidEnd(textField: UITextField) {
        fillOutputDependsOnState()
    }
    
    func addSubviews() {
        view.addSubview(inputText)
        view.addSubview(segmentedSwitcher)
        view.addSubview(defaulExplanationLabel)
        view.addSubview(inputExclusionField)
        view.addSubview(resultButton)
        view.addSubview(outputText)
    }
    
    func setUpSegmentedControl() -> UISegmentedControl {
        let control = UISegmentedControl(items: segmentItems)
        control.selectedSegmentIndex = 0
        control.layer.cornerRadius = 9
        control.layer.masksToBounds = true
        control.tintColor = UIColor.white
        control.addTarget(self, action: #selector(handleSegmentedControlValueChanged(_ :)), for: .valueChanged)
        return control
    }
    
    @objc func reverseButtonAction(_ sender:UIButton!) {
        self.view.endEditing(true)
        fillOutputDependsOnState()
    }
    
    func fillOutputDependsOnState()  {
        if currentState == .def {
            outputText.text = reverseStringManager.reverseStringDefaultState(text: inputText.text ?? "")
        }
        if currentState == .custom {
            outputText.text = reverseStringManager.reverseStringWithExclusion(text: inputText.text ?? "", exclusion: inputExclusionField.text ?? "")
        }
    }
    
    @objc func handleSegmentedControlValueChanged(_ sender : UISegmentedControl) {
        self.view.endEditing(true)
        switch (segmentedSwitcher.selectedSegmentIndex) {
        case 0:
            currentState = .def
        case 1:
            currentState = .custom
        default:
            currentState = .def
        }
    }
    
    private func  updateUIAccordingToNewState() {
        func switchToDefaultSegment() {
            defaulExplanationLabel.isHidden = false
            inputExclusionField.isHidden = true
            outputText.text.removeAll()
        }
        
        func switchToCustomSegment() {
            defaulExplanationLabel.isHidden = true
            inputExclusionField.isHidden = false
            outputText.text.removeAll()
        }
        switch currentState {
        case .def:
            switchToDefaultSegment()
        case .custom:
            switchToCustomSegment()
        }
    }
}

extension AnagramsViewController {
    enum Segments:String {
        case def = "Default"
        case custom = "Custom"
    }
}


