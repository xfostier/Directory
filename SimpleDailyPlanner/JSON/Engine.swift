//
//  Engine.swift
//  SimpleDailyPlanner
//
//  Created by xfostier on 01/04/2024.
//  


import Foundation

public struct Engine {
    private let path = "menuApp.json"

    // https://medium.com/@lrkhan/storing-app-data-locally-99e36d4b91a0

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
                name: "Notes",
                bgColor: "blue",
                textColor: "black"
            ),
            .init(
                order: 1,
                name: "Mon",
                bgColor: "gray",
                textColor: "black"
            ),
            .init(
                order: 2,
                name: "Tue",
                bgColor: "gray",
                textColor: "black"
            ),
            .init(
                order: 3,
                name: "Wed",
                bgColor: "gray",
                textColor: "black"
            ),
            .init(
                order: 4,
                name: "Thu",
                bgColor: "gray",
                textColor: "black"
            ),
            .init(
                order: 5,
                name: "Fri",
                bgColor: "gray",
                textColor: "black"
            ),
            .init(
                order: 6,
                name: "Sat",
                bgColor: "gray",
                textColor: "black"
            ),
            .init(
                order: 7,
                name: "Sun",
                bgColor: "gray",
                textColor: "black"
            )
        ]
    }
}
