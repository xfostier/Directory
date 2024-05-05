//
//  PageViewModel.swift
//  SimpleDailyPlanner
//
//  Created by Xavier Fostier on 30/04/2024.
//

import Combine
import SwiftUI

class PageViewModel: ObservableObject {
    @Published var menu: String = ""
    @Published var comment: String = ""
    @Published var foreground: Color
    @Published var background: Color
    private var cancellables = Set<AnyCancellable>()
    
    
    init(dayData: DayData) {
        self.dayData = dayData
        self.foreground = dayData.fgColor.color!
        self.background = dayData.bgColor.color!
    }
    
    @Published var dayData: DayData {
        didSet {
            menu = dayData.menu
            comment = dayData.comment
            $menu.eraseToAnyPublisher().debounce(
                for: 0.5,
                scheduler: RunLoop.main
            ).sink(receiveValue: { [weak self] value in
                DispatchQueue.global(qos: .userInteractive).async { [weak self] in
                    guard let self else { return }
                    self.dayData.menu = self.menu
                    StorageEngine.save(day: self.dayData)
                }
            }).store(in: &cancellables)
            
            $comment.eraseToAnyPublisher().debounce(
                for: 0.5,
                scheduler: RunLoop.main
            ).sink(receiveValue: { [weak self] value in
                DispatchQueue.global(qos: .userInteractive).async { [weak self] in
                    guard let self else { return }
                    self.dayData.comment = self.comment
                    StorageEngine.save(day: self.dayData)
                }
            }).store(in: &cancellables)
        }
    }
    
    @ViewBuilder
    var marker: some View {
        if dayData.displayType == .image {
            Image(systemName: dayData.name)
                .imageScale(.large)
        } else {
            Text(dayData.name)
        }
    }
}
