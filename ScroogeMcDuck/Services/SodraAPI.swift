//
//  SodraAPI.swift
//  ScroogeMcDuck
//
//  Created by Илья Билтуев on 03.04.2022.
//

import Foundation

protocol SodraAPI {
    func sendTaxInfoToSodra()
}

final class SodraAPIImpl: SodraAPI {
    func sendTaxInfoToSodra() -> Void {
        print("Sending to Sodra... \(salaryResult!)")
    }
}
