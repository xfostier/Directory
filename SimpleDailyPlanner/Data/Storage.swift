//
//  Storage.swift
//  SimpleDailyPlanner
//
//  Created by xfostier on 01/04/2024.
//  


import Foundation

class Storage: ObservableObject {
    private let engine = Engine()
    let days: [DayData]

    init() {
        days = engine.readData()
    }
}
