//
//  ScroogeMcDuckUITests.swift
//  ScroogeMcDuckUITests
//
//  Created by Arminas Ruzgas on 2020-10-23.
//

import XCTest

class ScroogeMcDuckUITests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
    }

    func testSalaryView() throws {
        let grossSalaryText = "50000"
        let netSalary1 = "30250.0"
        let netSalary2 = "29200.0"
        let netSalary3 = "28750.0"
        
        let app = XCUIApplication()
        app.launch()
        
        let grossSalaryTextField = app.textFields["Enter salary on paper"]
        XCTAssertTrue(grossSalaryTextField.exists)
        grossSalaryTextField.tap()
        grossSalaryTextField.typeText(grossSalaryText)
        
        let segmentedControlButton1 = app.segmentedControls.buttons["No"]
        XCTAssertTrue(segmentedControlButton1.exists)
        segmentedControlButton1.tap()
        let resultLabelResult1 = app.staticTexts[netSalary1]
        XCTAssert(resultLabelResult1.exists)
        
        let segmentedControlButton2 = app.segmentedControls.buttons["2.1 %"]
        XCTAssertTrue(segmentedControlButton2.exists)
        segmentedControlButton2.tap()
        let resultLabelResult2 = app.staticTexts[netSalary2]
        XCTAssert(resultLabelResult2.exists)
        
        let segmentedControlButton3 = app.segmentedControls.buttons["3 %"]
        XCTAssertTrue(segmentedControlButton3.exists)
        segmentedControlButton3.tap()
        let resultLabelResult3 = app.staticTexts[netSalary3]
        XCTAssert(resultLabelResult3.exists)
    }
}
