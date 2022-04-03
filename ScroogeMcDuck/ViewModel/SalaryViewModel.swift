//
//  SalaryViewModel.swift
//  ScroogeMcDuck
//
//  Created by Илья Билтуев on 03.04.2022.
//

import Foundation

protocol SalaryViewModel {
    var taxInfo: TaxInfo { get }
    var sodraApi: SodraAPI { get }
    var salaryCalculator: SalaryCalculator { get }
    var updateView: ((Salary) -> Void)? { get set }
    
    func sendResultToSodra(_ salary: Salary)
}

final class SalaryViewModelImple: SalaryViewModel {
    var taxInfo: TaxInfo
    var sodraApi: SodraAPI
    var salaryCalculator: SalaryCalculator
    var updateView: ((Salary) -> Void)?
    
    private var additionalPensionIndex: Int?
    
    init(taxInfo: TaxInfo, sodraApi: SodraAPI, salaryCalculator: SalaryCalculator) {
        self.taxInfo = taxInfo
        self.sodraApi = sodraApi
        self.salaryCalculator = salaryCalculator
    }
    
    func additionalPensionSelected(at index: Int) {
        additionalPensionIndex = index
    }
    
    func grossSalaryDidChange(_ salary: Salary) {
        guard
            let index = additionalPensionIndex,
            let additionalPensionRate = taxInfo.additionalPensionOptions.element(at: index)
        else {
            return
        }
        let netSalary = salaryCalculator.calculateSalary(
            salaryGross: salary,
            additionalPensionOption: additionalPensionRate
        )
        updateView?(netSalary)
        sendResultToSodra(netSalary)
    }
    
    func sendResultToSodra(_ salary: Salary) {
        sodraApi.sendSalaryResult(salary)
    }
}
