//
//  Engine.swift
//  SimpleDailyPlanner
//
//  Created by Xavier Fostier on 01/04/2024.
//  

// https://medium.com/@lrkhan/storing-app-data-locally-99e36d4b91a0

import Foundation

public struct Engine {

    private let path = "menuApp.json"

    func writeData(_ totals: [DayData]) -> Void {
        do {
            let fileURL = try FileManager.default
                .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                .appendingPathComponent(path)

            try JSONEncoder()
                .encode(totals)
                .write(to: fileURL)
        } catch {
            print("error writing data")
        }
    }

    func readData() -> [DayData] {
        do {
            let fileURL = try FileManager.default
                .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                .appendingPathComponent("menuApp.json")

            let data = try Data(contentsOf: fileURL)
            let pastData = try JSONDecoder().decode([DayData].self, from: data)

            return pastData
        } catch {
            print("error reading data")
            return initialization
        }
    }

    var initialization: [DayData] {
        [
            .init(
                order: 0, 
                displayType: .image,
                name: "pencil.circle",
                bgColor: "blue",
                textColor: "black"
            ),
            .init(
                order: 1, 
                displayType: .text,
                name: "Mon",
                bgColor: "gray",
                textColor: "black"
            ),
            .init(
                order: 2,
                displayType: .text,
                name: "Tue",
                bgColor: "gray",
                textColor: "black"
            ),
            .init(
                order: 3,
                displayType: .text,
                name: "Wed",
                bgColor: "gray",
                textColor: "black"
            ),
            .init(
                order: 4,
                displayType: .text,
                name: "Thu",
                bgColor: "gray",
                textColor: "black"
            ),
            .init(
                order: 5,
                displayType: .text,
                name: "Fri",
                bgColor: "gray",
                textColor: "black"
            ),
            .init(
                order: 6,
                displayType: .text,
                name: "Sat",
                bgColor: "gray",
                textColor: "black"
            ),
            .init(
                order: 7,
                displayType: .text,
                name: "Sun",
                bgColor: "gray",
                textColor: "black"
            )
        ]
    }
}
