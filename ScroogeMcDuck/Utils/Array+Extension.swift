//
//  Array+Extension.swift
//  ScroogeMcDuck
//
//  Created by Илья Билтуев on 03.04.2022.
//

import Foundation

extension Array {
    func element(at index: Int) -> Element? {
        guard
            index >= 0,
            index < count
        else {
            return nil
        }
        return self[index]
    }
}
