//
//  ScroogeMcDuckTests.swift
//  ScroogeMcDuckTests
//
//  Created by Arminas Ruzgas on 2020-10-23.
//

import XCTest
@testable import ScroogeMcDuck

class ScroogeMcDuckTests: XCTestCase {

    func testSalaryCalculator() throws {
        let salaryCalculator = SalaryCalculatorImpl()
        let netSalary = salaryCalculator.calculateSalary(
            grossSalary: 50000,
            additionalPensionOption: AdditionalPensionOption(title: "3 %", rate: 0.03)
        )
        XCTAssertEqual(netSalary, 28750.0)
    }
}
