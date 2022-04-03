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
        let pensionRate = Constants.TaxRate.socialSecurity + additionalPensionOption.value
        return ((salaryGross - (salaryGross * Constants.TaxRate.incomeTax) - (salaryGross * Constants.TaxRate.healthInsurance) - (salaryGross * pensionRate)).rounded())
        
        /*
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
         */
    }
}
