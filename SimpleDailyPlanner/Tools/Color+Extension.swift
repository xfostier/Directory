//
//  Color+Extension.swift
//  SimpleDailyPlanner
//
//  Created by Xavier Fostier on 13/04/2024.
//  


import SwiftUI

extension Color {
    
    func parse() -> String? {
        self.cgColor?.parse()
    }
    
    static var dark: [Color] = [.darkRed, .darkGreen, .darkBlue, .darkGray, .darkYellow, darkOrange, darkPink, darkPink, darkBrown, darkTurquoise, darkMint, darkMagenta, almostBlack]
    
    static var light: [Color] = []
    
    // MARK: - DARK

    static var darkRed = Color(UIColor(red: 97/255, green: 0/255, blue: 5/255, alpha: 1.0))
    
    static var darkGreen = Color(UIColor(red: 0/255, green: 100/255, blue: 0/255, alpha: 1.0))
    
    static var darkBlue = Color(UIColor(red: 0/255, green: 0/255, blue: 50/255, alpha: 1.0))
    
    static var darkGray = Color(UIColor(red: 70/255, green: 70/255, blue: 70/255, alpha: 1.0))

    static var darkYellow = Color(UIColor(red: 184/255, green: 134/255, blue: 11/255, alpha: 1.0))
    
    static var darkOrange = Color(UIColor(red: 210/255, green: 105/255, blue: 30/255, alpha: 1.0))
    
    static var darkPurple = Color(UIColor(red: 26/255, green: 0/255, blue: 45/255, alpha: 1.0))
    
    static var darkPink = Color(UIColor(red: 70/255, green: 70/255, blue: 70/255, alpha: 1.0))
    
    static var darkBrown = Color(UIColor(red: 50/255, green: 0/255, blue: 0/255, alpha: 1.0))
    
    static var darkTurquoise = Color(UIColor(red: 0/255, green: 128/255, blue: 128/255, alpha: 1.0))
    
    static var darkMint = Color(UIColor(red: 46/255, green: 139/255, blue: 87/255, alpha: 1.0))
    
    static var darkMagenta = Color(UIColor(red: 55/255, green: 0/255, blue: 55/255, alpha: 1.0))
    
    static var almostBlack = Color(UIColor(red: 70/255, green: 70/255, blue: 70/255, alpha: 1.0))
    
    // MARK: - LIGHT

    static var lightRed = Color(UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1.0))
    
    static var lightGreen = Color(UIColor(red: 0/255, green: 250/255, blue: 154/255, alpha: 1.0))
    
    static var lightBlue = Color(UIColor(red: 70/255, green: 70/255, blue: 70/255, alpha: 1.0))
    
    static var lightYellow = Color(UIColor(red: 70/255, green: 70/255, blue: 70/255, alpha: 1.0))
    
    static var lightOrange = Color(UIColor(red: 255/255, green: 165/255, blue: 0/255, alpha: 1.0))
    
    static var lightPurle = Color(UIColor(red: 199/255, green: 21/255, blue: 133/255, alpha: 1.0))
    
    static var lightPink = Color(UIColor(red: 255/255, green: 105/255, blue: 180/255, alpha: 1.0))
    
    static var lightBrown = Color(UIColor(red: 70/255, green: 70/255, blue: 70/255, alpha: 1.0))
    
    static var lightTurquoise = Color(UIColor(red: 25/255, green: 88/255, blue: 82/255, alpha: 1.0))
    
    static var lightMint = Color(UIColor(red: 70/255, green: 70/255, blue: 70/255, alpha: 1.0))
    
    static var lightMagenta = Color(UIColor(red: 70/255, green: 70/255, blue: 70/255, alpha: 1.0))
}

