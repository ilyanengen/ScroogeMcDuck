//
//  SalaryViewModel.swift
//  ScroogeMcDuck
//
//  Created by Илья Билтуев on 03.04.2022.
//

import Foundation

protocol SalaryViewModel {
    var additionalPensionOptions: [AdditionalPensionOption] { get }
    var sodraApi: SodraAPI { get }
    var salaryCalculator: SalaryCalculator { get }
    
    var updateView: ((AdditionalPensionOption) -> Void)? { get set }
    
    func uploadData()
}

final class SalaryViewModelImple: SalaryViewModel {
    var additionalPensionOptions: [AdditionalPensionOption]
    var sodraApi: SodraAPI
    var salaryCalculator: SalaryCalculator
    
    var updateView: ((AdditionalPensionOption) -> Void)?
    
    init(additionalPensionOptions: [AdditionalPensionOption], sodraApi: SodraAPI, salaryCalculator: SalaryCalculator) {
        self.additionalPensionOptions = additionalPensionOptions
        self.sodraApi = sodraApi
        self.salaryCalculator = salaryCalculator
    }
    
    func uploadData() {
        
    }
}
