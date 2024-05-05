//
//  Storage.swift
//  SimpleDailyPlanner
//
//  Created by Xavier Fostier on 01/04/2024.
//  

import Foundation

//TODO: Move debounce to Storage
class Storage {
    private let engine = StorageEngine()
    let days: [DayData]

    init() {
        days = engine.readData()
    }
}
