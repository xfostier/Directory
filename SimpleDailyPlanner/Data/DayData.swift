//
//  DayData.swift
//  SimpleDailyPlanner
//
//  Created by Xavier Fostier on 01/04/2024.
//  

import SwiftUI
import Combine
import UIKit

class DayData: ObservableObject, Codable {
    let order: Int
    var displayType: DisplayType
    var name: String
    var bgColor: String
    var fgColor: String
    var menu: String
    var comment: String


    enum CodingKeys: String, CodingKey {
        case order
        case displayType = "display_type"
        case name = "name"
        case bgColor = "bg_color"
        case fgColor = "text_color"
        case menu
        case comment
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.order = try container.decode(Int.self, forKey: .order)
        self.displayType = try container.decode(DisplayType.self, forKey: .displayType)
        self.name = try container.decode(String.self, forKey: .name)
        self.bgColor = try container.decode(String.self, forKey: .bgColor)
        self.fgColor = try container.decode(String.self, forKey: .fgColor)
        self.menu = try container.decode(String.self, forKey: .menu)
        self.comment = try container.decode(String.self, forKey: .comment)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(order, forKey: .order)
        try container.encode(displayType, forKey: .displayType)
        try container.encode(name, forKey: .name)
        try container.encode(bgColor, forKey: .bgColor)
        try container.encode(fgColor, forKey: .fgColor)
        try container.encode(menu, forKey: .menu)
        try container.encode(comment, forKey: .comment)
    }

    init(order: Int, displayType: DisplayType, name: String, bgColor: String, fgColor: String, icon: String = "", menu: String = "", comment: String = "") {
        self.order = order
        self.displayType = displayType
        self.name = name
        self.bgColor = bgColor
        self.fgColor = fgColor
        self.menu = menu
        self.comment = comment
    }
}
