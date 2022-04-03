import UIKit

class CalculatorViewController: UIViewController {
    
    var viewModel: SalaryViewModel!
    
    @IBOutlet private weak var salaryInputTextField: UITextField!
    @IBOutlet private weak var takeHomeSalaryLabel: UILabel!
    @IBOutlet private weak var additionalPensionOption: UISegmentedControl!
    
//    init(viewModel: SalaryViewModel) {
//        self.viewModel = viewModel
//        super.init(nibName: nil, bundle: nil)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        salaryInputTextField.placeholder = "Enter salary on paper"
//        salaryInputTextField.keyboardType = .numberPad
//        salaryInputTextField.delegate = self
        
//        additionalPensionOption.removeAllSegments()
//        additionalPensionOption.insertSegment(withTitle: "No", at: 0, animated: true)
//        additionalPensionOption.insertSegment(withTitle: "2.1 %", at: 1, animated: true)
//        additionalPensionOption.insertSegment(withTitle: "3 %", at: 2, animated: true)
//        additionalPensionOption.selectedSegmentIndex = 0
        
//        takeHomeSalaryLabel.textAlignment = .center
//        takeHomeSalaryLabel.textColor = .systemGreen
//        takeHomeSalaryLabel.font = takeHomeSalaryLabel.font.withSize(60)
//        takeHomeSalaryLabel.text = ""

//        salaryInputTextField.addTarget(self,
//                                       action: #selector(salaryInputTextFieldDidChange(textField:)),
//                                       for: .editingChanged)
//        additionalPensionOption.addTarget(self,
//                                          action: #selector(additionalPensionSelected(sender:)),
//                                          for: .valueChanged)
        
        // Observe VM updates
        setInitialState()
        updateView()
    }

//    @objc
//    private func salaryInputTextFieldDidChange(textField: UITextField) {
//        updateViewModel()
//    }
//
//    @objc
//    private func additionalPensionSelected(sender: UISegmentedControl) {
//        updateViewModel()
//    }
    
    private func setInitialState() {
        // Configure segmented control
//        additionalPensionOption.removeAllSegments()
//        for (index, item) in viewModel.taxInfo.additionalPensionOptions.enumerated() {
//            additionalPensionOption.insertSegment(withTitle: item.title, at: index, animated: true)
//        }
//        additionalPensionOption.selectedSegmentIndex = 0
    }
    
    private func updateView() {
        viewModel.updateView = { [weak self] salary in
            self?.takeHomeSalaryLabel.text = String(salary)
        }
    }
    
    private func updateViewModel() {
        guard let grossSalary = Double(salaryInputTextField.text ?? "") else {
            return
        }
        viewModel.update(grossSalary: grossSalary, additionalPensionIndex: additionalPensionOption.selectedSegmentIndex)
    }
}

extension CalculatorViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
