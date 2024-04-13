//
//  Engine.swift
//  SimpleDailyPlanner
//
//  Created by Xavier Fostier on 01/04/2024.
//  

// https://medium.com/@lrkhan/storing-app-data-locally-99e36d4b91a0

import Foundation

public struct Engine {

    private func path(index: Int) -> String { "SimpleDailyPlanner\(index).json"
    }
    
    private let order = [0, 1, 2, 3, 4, 5, 6, 7]
    
    func save(day: DayData?) {
        guard let day else {
            return
        }
        self.writeData(day)
    }
    
    func writeData(_ data: DayData) -> Void {
        do {
            let fileURL = try FileManager.default
                .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                .appendingPathComponent(path(index: data.order))
            
            try JSONEncoder()
                .encode(data)
                .write(to: fileURL)
        } catch {
            print("error writing data")
        }
    }

    func writeData(_ totals: [DayData]) -> Void {
        for data in totals {
            do {
                let fileURL = try FileManager.default
                    .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                    .appendingPathComponent(path(index: data.order))
                
                try JSONEncoder()
                    .encode(totals)
                    .write(to: fileURL)
            } catch {
                print("error writing data")
            }
        }
    }

    func readData() -> [DayData] {
        var array = [DayData]()
        for index in order {
            do {
                let fileURL = try FileManager.default
                    .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                    .appendingPathComponent(path(index: index))
                
                let data = try Data(contentsOf: fileURL)
                let parsedData = try JSONDecoder().decode(DayData.self, from: data)
                array.append(parsedData)
            } catch {
                print("error reading data")
                return initialization
            }
        }
        return array
    }

    var initialization: [DayData] {
        [
            .init(
                order: 0, 
                displayType: .image,
                name: "pencil.circle",
                bgColor: "blue",
                fgColor: "black"
            ),
            .init(
                order: 1, 
                displayType: .text,
                name: "Mon",
                bgColor: "gray",
                fgColor: "black"
            ),
            .init(
                order: 2,
                displayType: .text,
                name: "Tue",
                bgColor: "gray",
                fgColor: "black"
            ),
            .init(
                order: 3,
                displayType: .text,
                name: "Wed",
                bgColor: "gray",
                fgColor: "black"
            ),
            .init(
                order: 4,
                displayType: .text,
                name: "Thu",
                bgColor: "gray",
                fgColor: "black"
            ),
            .init(
                order: 5,
                displayType: .text,
                name: "Fri",
                bgColor: "gray",
                fgColor: "black"
            ),
            .init(
                order: 6,
                displayType: .text,
                name: "Sat",
                bgColor: "gray",
                fgColor: "black"
            ),
            .init(
                order: 7,
                displayType: .text,
                name: "Sun",
                bgColor: "gray",
                fgColor: "black"
            )
        ]
    }
}
