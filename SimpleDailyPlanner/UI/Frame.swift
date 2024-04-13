//
//  Frame.swift
//  SimpleDailyPlanner
//
//  Created by Xavier Fostier on 01/04/2024.
//  
// 🎶 https://youtu.be/Fq1B3c5a9QM?si=A_j-1YegtKrScXOk

import SwiftUI

struct Frame: View {
    @StateObject var storage: Storage
    @State var menuIndex = 0
    private let cellsWidth: CGFloat = 70
    private let cellsSpacing: CGFloat = 1
    private static let mainColor = Color.darkGray

    init(storage: Storage) {
        self._storage = StateObject(wrappedValue: storage)
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
                .shadow(color: .black, radius: 10)
                
            }.frame(maxHeight: .infinity)
        }
        .onAppear {
            menuIndex = Date().weekday
        }
    }

    func page(geometry: GeometryProxy) -> some View {
        Page(
            geometry: geometry,
            data: storage.days[menuIndex],
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
            Frame.mainColor,
            in: RoundedRectangle(cornerRadius: 16)
        )
        .onTapGesture {
            menuIndex = 0
        }
        .onLongPressGesture {
            // TODO: Open settings for quick notes
        }
    }

    func buttonStack(geometry: GeometryProxy) -> some View {
        VStack (spacing: cellsSpacing) {
            ForEach (storage.days.dropFirst(), id: \.order) { (day: DayData) in
                VStack {
                    Text(day.name)
                        .bold()
                }
                .frame(width: cellsWidth, height: (geometry.size.height / CGFloat(storage.days.count)) - cellsSpacing)
                .background(
                    Frame.mainColor,
                    in: RoundedRectangle(cornerRadius: 16)
                )
                .onTapGesture {
                    menuIndex = day.order
                }
                .onLongPressGesture {
                    // TODO: Open settings for selected day
                }
            }
        }
    }
}
