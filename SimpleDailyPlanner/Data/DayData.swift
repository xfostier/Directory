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
    let name: String
    let bgColor: String
    let textColor: String
    let icon: String
    var menu: String
    var comment: String

    enum CodingKeys: String, CodingKey {
        case order
        case name
        case bgColor = "bg_color"
        case textColor = "text_color"
        case icon
        case menu
        case comment
    }

    init(order: Int, name: String, bgColor: String, textColor: String, icon: String = "", menu: String = "", comment: String = "") {
        self.order = order
        self.name = name
        self.bgColor = bgColor
        self.textColor = textColor
        self.icon = icon
        self.menu = menu
        self.comment = comment
    }
}
