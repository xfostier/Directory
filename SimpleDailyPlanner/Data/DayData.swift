//
//  DayData.swift
//  SimpleDailyPlanner
//
//  Created by xfostier on 01/04/2024.
//  


import Foundation
import SwiftUI
import UIKit

class DayData: ObservableObject, Codable {
    let order: Int
    let displayType: DisplayType
    let name: String
    let bgColor: String
    let textColor: String
    var menu: String
    var comment: String

    enum CodingKeys: String, CodingKey {
        case order
        case displayType = "display_type"
        case name = "name"
        case bgColor = "bg_color"
        case textColor = "text_color"
        case menu
        case comment
    }

    init(order: Int, displayType: DisplayType, name: String, bgColor: String, textColor: String, icon: String = "", menu: String = "", comment: String = "") {
        self.order = order
        self.displayType = displayType
        self.name = name
        self.bgColor = bgColor
        self.textColor = textColor
        self.menu = menu
        self.comment = comment
    }
}
