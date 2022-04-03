//
//  SalaryViewController.swift
//  ScroogeMcDuck
//
//  Created by Илья Билтуев on 03.04.2022.
//

import UIKit

class SalaryViewController: UIViewController {

    private var viewModel: SalaryViewModel
    private var salaryView: SalaryView!
    
    init(viewModel: SalaryViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSalaryView()
        subscribeOnViewModelUpdates()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        salaryView.frame = view.bounds
    }
    
    private func addSalaryView() {
        salaryView = SalaryView(pensionOptionTitles: viewModel.pensionOptionTitles)
        view.addSubview(salaryView)
        salaryView.delegate = self
    }
    
    private func subscribeOnViewModelUpdates() {
        viewModel.updateView = { [weak self] salary in
            self?.salaryView.update(netSalaryString: String(salary))
        }
    }
}

extension SalaryViewController: SalaryViewDelegate {
    func salaryViewDidUpdate(_ salaryView: SalaryView, grossSalaryText: String?, selectedPensionOptionIndex: Int) {
        guard
            let grossSalaryText = grossSalaryText,
            let grossSalary = Salary(grossSalaryText)
        else {
            return
        }
        viewModel.update(grossSalary: grossSalary, additionalPensionIndex: selectedPensionOptionIndex)
    }
}
