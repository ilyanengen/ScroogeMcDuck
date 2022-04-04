//
//  SalaryViewModel.swift
//  ScroogeMcDuck
//
//  Created by Илья Билтуев on 03.04.2022.
//

import Foundation

protocol SalaryViewModel {
    var pensionOptionTitles: [String] { get }
    var updateView: ((Salary) -> Void)? { get set }
    
    func update(grossSalary: Salary, additionalPensionIndex: Int)
}

final class SalaryViewModelImpl: SalaryViewModel {
    private let taxInfo: TaxInfo
    private let sodraApi: SodraAPI
    private let salaryCalculator: SalaryCalculator
    
    var pensionOptionTitles: [String] { return taxInfo.additionalPensionOptions.map { $0.title } }
    var updateView: ((Salary) -> Void)?
    
    init(taxInfo: TaxInfo, sodraApi: SodraAPI, salaryCalculator: SalaryCalculator) {
        self.taxInfo = taxInfo
        self.sodraApi = sodraApi
        self.salaryCalculator = salaryCalculator
    }
    
    func update(grossSalary: Salary, additionalPensionIndex: Int) {
        guard let additionalPensionRate = taxInfo.additionalPensionOptions.element(at: additionalPensionIndex) else {
            return
        }
        let netSalary = salaryCalculator.calculateSalary(
            grossSalary: grossSalary,
            additionalPensionOption: additionalPensionRate
        )
        updateView?(netSalary)
        sendResultToSodra(netSalary)
    }
    
    private func sendResultToSodra(_ salary: Salary) {
        sodraApi.sendSalaryResult(salary)
    }
}
