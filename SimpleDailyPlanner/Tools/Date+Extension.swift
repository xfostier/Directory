//
//  Date+Extension.swift
//  SimpleDailyPlanner
//
//  Created by Xavier Fostier on 13/04/2024.
//  


import Foundation

//TODO: Check behaviour
extension Date {
    var weekday: Int {
        Calendar.current.component(.weekday, from: self) - 1
    }
}
