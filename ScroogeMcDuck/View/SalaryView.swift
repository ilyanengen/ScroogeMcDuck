//
//  SalaryView.swift
//  ScroogeMcDuck
//
//  Created by Илья Билтуев on 03.04.2022.
//

import UIKit

protocol SalaryViewDelegate: AnyObject {
    func salaryViewDidUpdate(_ salaryView: SalaryView, grossSalaryText: String?, selectedPensionOptionIndex: Int)
}

class SalaryView: UIView {
    
    weak var delegate: SalaryViewDelegate?
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 20
        stackView.axis = .vertical
        return stackView
    }()
    
    private let grossSalaryTextField: UITextField = {
        let textField = UITextField()
        textField.autocapitalizationType = .none
        textField.minimumFontSize = 17
        textField.placeholder = "Enter salary on paper"
        textField.keyboardType = .numberPad
        return textField
    }()
    
    private let additionalPensionOptionsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    
    private let additionalPensionOptionsLabel: UILabel = {
        let label = UILabel()
        label.text = "Additional pension payments?"
        label.contentMode = .left
        return label
    }()
    
    private let segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl()
        segmentedControl.selectedSegmentIndex = 0
        return segmentedControl
    }()
    
    private let takeHomeSalaryLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.contentMode = .left
        label.textColor = .systemGreen
        label.font = UIFont.systemFont(ofSize: 60)
        return label
    }()
    
    init(pensionOptionTitles: [String]) {
        super.init(frame: .zero)
        backgroundColor = .white
        addSubviews()
        makeConstraints()
        configureSegmentedControl(pensionOptionTitles: pensionOptionTitles)
        grossSalaryTextField.addTarget(
            self,
            action: #selector(valuesChanged),
            for: .editingChanged
        )
        segmentedControl.addTarget(
            self,
            action: #selector(valuesChanged),
            for: .valueChanged
        )
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(netSalaryString: String) {
        takeHomeSalaryLabel.text = netSalaryString
    }
    
    private func addSubviews() {
        addSubview(mainStackView)
        mainStackView.addArrangedSubview(grossSalaryTextField)
        additionalPensionOptionsStackView.addArrangedSubview(additionalPensionOptionsLabel)
        additionalPensionOptionsStackView.addArrangedSubview(segmentedControl)
        mainStackView.addArrangedSubview(additionalPensionOptionsStackView)
        mainStackView.addArrangedSubview(takeHomeSalaryLabel)
    }
    
    private func makeConstraints() {
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        grossSalaryTextField.translatesAutoresizingMaskIntoConstraints = false
        additionalPensionOptionsLabel.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 44),
            mainStackView.heightAnchor.constraint(equalToConstant: 400),
            mainStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            grossSalaryTextField.heightAnchor.constraint(equalToConstant: 44),
            additionalPensionOptionsLabel.heightAnchor.constraint(equalToConstant: 20),
            segmentedControl.heightAnchor.constraint(equalToConstant: 44)
        ])
    }

    private func configureSegmentedControl(pensionOptionTitles: [String]) {
        for (index, item) in pensionOptionTitles.enumerated() {
            segmentedControl.insertSegment(withTitle: item, at: index, animated: true)
        }
        segmentedControl.selectedSegmentIndex = 0
    }
    
    @objc
    private func valuesChanged() {
        delegate?.salaryViewDidUpdate(
            self,
            grossSalaryText: grossSalaryTextField.text,
            selectedPensionOptionIndex: segmentedControl.selectedSegmentIndex
        )
    }
}
