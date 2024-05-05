//
//  Frame.swift
//  SimpleDailyPlanner
//
//  Created by Xavier Fostier on 01/04/2024.
//  
// 🎶 https://youtu.be/Fq1B3c5a9QM?si=A_j-1YegtKrScXOk
// https://stackoverflow.com/questions/56518868/how-to-apply-shadow-to-interior-views-in-swiftui

import SwiftUI

struct Home: View {
    @State var menuIndex = 0 {
        didSet {
            pageViewModel.dayData = storage.days[menuIndex]
        }
    }
    @State var displaySettings: Bool = false
    let storage: Storage
    private let cellsWidth: CGFloat = 70
    private let cellsSpacing: CGFloat = 1
    private static let mainColor = Color.darkGray
    private var pageViewModel: PageViewModel

    init() {
        self.storage = Storage()
        self.pageViewModel = PageViewModel(dayData: storage.days[Date().weekday])
    }

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {

            VStack(spacing: cellsSpacing) {
                quickNotes(geometry: geometry)
                buttonStack(geometry: geometry)
            }
            .frame(alignment: .leading)
            .ignoresSafeArea(.keyboard)

            page(geometry: geometry)
                .id(menuIndex)
                .offset(x: cellsWidth - 5)
                .frame(maxWidth: geometry.size.width - cellsWidth - 5)

            }.frame(maxHeight: .infinity)
        }
        .onAppear {
            menuIndex = Date().weekday
        }.sheet(
            isPresented: $displaySettings,
            onDismiss: {
                StorageEngine.save(day: storage.days[menuIndex])
        }, content: {
            Settings(data: storage.days[menuIndex])
        })
    }
    
    func page(geometry: GeometryProxy) -> some View {
        Page(
            geometry: geometry,
            pageViewModel: pageViewModel,
            start: .init(x: 0, y: CGFloat(menuIndex) * (geometry.size.height / CGFloat(storage.days.count) - cellsSpacing) + cellsSpacing * (CGFloat(menuIndex))),
            size: .init(width: cellsWidth - 5, height: (geometry.size.height / CGFloat(storage.days.count)) - cellsSpacing)
        )
    }

    func quickNotes(geometry: GeometryProxy) -> some View {
        VStack(spacing: 0) {
            Image(systemName: storage.days.first?.name ?? "pencil.circle")
                .imageScale(.large)
        }
        .frame(width: cellsWidth, height: (geometry.size.height / CGFloat(storage.days.count)) - cellsSpacing)
        .background(
            storage.days[0].bgColor.color!,
            in: RoundedRectangle(cornerRadius: 16)
        )
        .onTapGesture {
            menuIndex = 0
        }
        .onLongPressGesture {
            menuIndex = 0
            displaySettings.toggle()
        }
    }

    func buttonStack(geometry: GeometryProxy) -> some View {
        VStack (spacing: cellsSpacing) {
            ForEach (storage.days.dropFirst(), id: \.order) { (day: DayData) in
                VStack {
                    Text(day.name)
                        .bold()
                        .foregroundStyle(day.fgColor.color!)
                }
                .frame(width: cellsWidth, height: (geometry.size.height / CGFloat(storage.days.count)) - cellsSpacing)
                .background(
                    day.bgColor.color!,
                    in: RoundedRectangle(cornerRadius: 16)
                )
                .onTapGesture {
                    menuIndex = day.order
                }
                .onLongPressGesture {
                    menuIndex = day.order
                    displaySettings.toggle()
                }
            }
        }
    }
}
