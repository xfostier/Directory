//
//  String+Extension.swift
//  SimpleDailyPlanner
//
//  Created by AxaPlus Team on 30/04/2024.
//  


import SwiftUI

extension String {
    
    var color: Color? {
        guard let cgColor else {
            return nil
        }
        return Color(cgColor: cgColor)
    }
    
    var cgColor: CGColor? {
        let components = self.components(separatedBy: "-").compactMap { (value: String) -> CGFloat? in
            guard let double = Double(value) else {
                return nil
            }
            return CGFloat(double)
        }
        guard components.count == 3 else {
            return nil
        }
        
        return CGColor(red: components[0]/255, green: components[1]/255, blue: components[2]/255, alpha: 1)
    }
}
