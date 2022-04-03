//
//  SodraAPI.swift
//  ScroogeMcDuck
//
//  Created by Илья Билтуев on 03.04.2022.
//

import Foundation

protocol SodraAPI {
    func sendSalaryResult(_ salary: Salary)
}

final class SodraAPIImpl: SodraAPI {
    func sendSalaryResult(_ salary: Salary) {
        print("Sending to Sodra... \(salary)")
    }
}
