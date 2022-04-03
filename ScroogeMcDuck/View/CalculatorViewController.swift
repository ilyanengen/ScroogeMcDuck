import UIKit

var salaryResult: String?

class CalculatorViewController: UIViewController {
    
    @IBOutlet private weak var salaryInputTextField: UITextField!
    @IBOutlet private weak var takeHomeSalaryLabel: UILabel!
    @IBOutlet private weak var additionalPensionOption: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        salaryInputTextField.placeholder = "Enter salary on paper"
        salaryInputTextField.keyboardType = .numberPad
        salaryInputTextField.delegate = self
        
        additionalPensionOption.removeAllSegments()
        additionalPensionOption.insertSegment(withTitle: "No", at: 0, animated: true)
        additionalPensionOption.insertSegment(withTitle: "2.1 %", at: 1, animated: true)
        additionalPensionOption.insertSegment(withTitle: "3 %", at: 2, animated: true)
        additionalPensionOption.selectedSegmentIndex = 0
        
        takeHomeSalaryLabel.textAlignment = .center
        takeHomeSalaryLabel.textColor = .systemGreen
        takeHomeSalaryLabel.font = takeHomeSalaryLabel.font.withSize(60)
        takeHomeSalaryLabel.text = ""

        salaryInputTextField.addTarget(self,
                                       action: #selector(salaryInputTextFieldDidChange(textField:)),
                                       for: .editingChanged)
        additionalPensionOption.addTarget(self,
                                          action: #selector(additionalPensionSelected(sender:)),
                                          for: .valueChanged)

    }

    @objc
    private func salaryInputTextFieldDidChange(textField: UITextField) {
        guard let textNumber = Double(textField.text ?? "") else {
            return
        }
        updateTakeHomeSalaryLabel(textNumber)
    }
    
    @objc
    private func additionalPensionSelected(sender: UISegmentedControl) {
        guard let textNumber = Double(salaryInputTextField.text ?? "0") else {
            return
        }
        updateTakeHomeSalaryLabel(textNumber)
    }

    private func updateTakeHomeSalaryLabel(_ number: Double) {
        var rate: Double = 0
        if additionalPensionOption.selectedSegmentIndex == 1 {
            rate = 0.021
        } else if additionalPensionOption.selectedSegmentIndex == 2 {
            rate = 0.03
        }
        
        let pensionRate = 0.1252 + rate
        takeHomeSalaryLabel.text = String((number - (number * 0.2) - (number * 0.0698) - (number * pensionRate)).rounded())
        salaryResult = takeHomeSalaryLabel.text
        SodraAPIImpl().sendTaxInfoToSodra()
    }
}

extension CalculatorViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
