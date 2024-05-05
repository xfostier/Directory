//
//  CGColor+Extension.swift
//  SimpleDailyPlanner
//
//  Created by Xavier Fostier on 30/04/2024.
//  


import SwiftUI

extension CGColor {
    func parse() -> String? {
        guard let components = self.components else {
            return nil
        }
        let value =  components.dropLast(2).reduce("", { result, component in
            "\(result)"+"\(component)-"
        }).appending("\(components[2])")
        return value
    }
}
