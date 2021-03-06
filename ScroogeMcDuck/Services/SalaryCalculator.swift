//
//  SalaryCalculator.swift
//  ScroogeMcDuck
//
//  Created by Илья Билтуев on 03.04.2022.
//

import Foundation

// If we can change behavior, use Decimal instead of Double for better rounding.
typealias Salary = Double

protocol SalaryCalculator {
    func calculateSalary(grossSalary: Salary, additionalPensionOption: AdditionalPensionOption) -> Salary
}

final class SalaryCalculatorImpl: SalaryCalculator {
    func calculateSalary(grossSalary: Salary, additionalPensionOption: AdditionalPensionOption) -> Salary {
        let pensionRate = Constants.TaxRate.socialSecurity + additionalPensionOption.rate
        return ((grossSalary -
                 (grossSalary * Constants.TaxRate.incomeTax) -
                 (grossSalary * Constants.TaxRate.healthInsurance) -
                 (grossSalary * pensionRate)).rounded())
    }
}
