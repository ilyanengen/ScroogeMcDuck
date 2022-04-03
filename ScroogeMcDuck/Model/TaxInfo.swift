//
//  TaxInfo.swift
//  ScroogeMcDuck
//
//  Created by Илья Билтуев on 03.04.2022.
//

import Foundation

struct AdditionalPensionOption {
    let title: String
    let rate: Double
}

struct TaxInfo {
    let additionalPensionOptions: [AdditionalPensionOption]
}
