//
//  SalaryCalculator.swift
//  ScroogeMcDuck
//
//  Created by Илья Билтуев on 03.04.2022.
//

import Foundation

typealias Salary = Double

protocol SalaryCalculator {
    func calculateSalary(salaryGross: Salary, additionalPensionOption: AdditionalPensionOption) -> Salary
}

final class SalaryCalculatorImpl: SalaryCalculator {
    func calculateSalary(salaryGross: Salary, additionalPensionOption: AdditionalPensionOption) -> Salary {
        let pensionRate = Constants.TaxRate.socialSecurity + additionalPensionOption.rate
        return ((salaryGross -
                 (salaryGross * Constants.TaxRate.incomeTax) -
                 (salaryGross * Constants.TaxRate.healthInsurance) -
                 (salaryGross * pensionRate)).rounded())
    }
}
