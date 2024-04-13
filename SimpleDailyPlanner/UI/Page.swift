//
//  Page.swift
//  SimpleDailyPlanner
//
//  Created by xfostier on 01/04/2024.
//
// 🎶 https://youtu.be/rhlZY4D8jlQ?si=19v3chOJsY1wx600
// https://www.hackingwithswift.com/quick-start/swiftui/how-to-dismiss-the-keyboard-for-a-textfield


import Foundation
import SwiftUI

struct Page: View {

    private let geometry: GeometryProxy
    @StateObject var data: DayData
    private let start: CGPoint
    private let size: CGSize
    @FocusState private var menuIsFocused: Bool
    @FocusState private var commentIsFocused: Bool

    init(geometry: GeometryProxy, data: DayData, start: CGPoint, size: CGSize) {
        self.geometry = geometry
        self._data = StateObject(wrappedValue: data)
        self.start = start
        self.size = size
    }

    var body: some View {
        ZStack {
            VStack (spacing: 2) {
                TextField("", text: $data.menu, axis: .vertical)
                    .frame(maxHeight: geometry.size.height * 0.7, alignment: .top)
                    .lineLimit(nil)
                    .border(.green, width: 0.5)
                    .padding(5)
                    .focused($menuIsFocused)
                
                TextField("", text: $data.comment, axis: .vertical)
                    .frame(maxHeight: geometry.size.height * 0.3, alignment: .top)
                    .lineLimit(nil)
                    .border(.green, width: 0.5)
                    .padding(5)
                    .focused($commentIsFocused)
            }
            .background(PageWithBookmark(
                geometry: geometry,
                start: start,
                size: size))
            
            marker.position(processMarkerPosition())
            }
        }
    
    @ViewBuilder
    private var marker: some View {
        if data.displayType == .image {
            Image(systemName: data.name)
                .imageScale(.large)
        } else {
            Text(data.name)
        }
    }
    
    private func processMarkerPosition() -> CGPoint{
        .init(
            x: start.x - (size.width / 2),
            y: start.y + (size.height / 2)
        )
        
    }

    private struct PageWithBookmark: View {
        private let geometry: GeometryProxy
        private let start: CGPoint
        private let size: CGSize
        private let bottomCorrection: CGFloat = 1

        init(geometry: GeometryProxy, start: CGPoint, size: CGSize) {
            self.geometry = geometry
            self.start = start
            self.size = size
        }

        var body: some View {
            Path { path in
                let width = geometry.size.width - size.width
                let height = geometry.size.height

                // TOP LEFT CORNER
                if (start.y != 0) {
                    path.move(to: CGPoint(
                        x: 20,
                        y: 0
                    ))

                    path.addQuadCurve(
                        to: CGPoint(
                            x: 0,
                            y: 20
                        ),
                        control: CGPoint(
                            x: 0,
                            y: 0
                        )
                    )
                // In case bookmark is the first one
                } else {
                    path.move(to: .zero)
                }

                // BOOKMARK
                path.addLine(to: start)

                // Top left corner
                path.addLine(to: CGPoint(
                    x: start.x - size.width + 10,
                    y: start.y
                ))

                path.addQuadCurve(
                    to: CGPoint(
                        x: start.x - size.width,
                        y: start.y + 10
                    ),
                    control: CGPoint(
                        x: start.x - size.width,
                        y: start.y
                    )
                )

                // Bottom left corner
                path.addLine(to: CGPoint(
                    x: start.x - size.width,
                    y: start.y + size.height - 10
                ))

                path.addQuadCurve(
                    to: CGPoint(
                        x: start.x - size.width + 10,
                        y: start.y + size.height
                    ),
                    control: CGPoint(
                        x: start.x - size.width,
                        y: start.y + size.height
                    )
                )

                path.addLine(to: CGPoint(
                    x: start.x,
                    y: start.y + size.height
                ))

                //BOTTOM LEFT CORNER
                // We put a threshold in case the last cell and full height do not match
                if (start.y <= height - size.height - 10) {
                    path.addLine(to: CGPoint(
                        x: start.x,
                        y: height - 20
                    ))

                    path.addQuadCurve(
                        to: CGPoint(
                            x: start.x + 20,
                            y: height - bottomCorrection
                        ),
                        control: CGPoint(
                            x: start.x,
                            y: height - bottomCorrection
                        )
                    )
                    // In case bookmark is the last one
                } else {
                    path.addLine(to: CGPoint(
                        x: start.x,
                        y: height - bottomCorrection
                    ))
                }

                // BOTTOM RIGHT CORNER

                path.addLine(
                    to: CGPoint(
                        x: width - 20,
                        y: height - bottomCorrection
                    )
                )

                path.addQuadCurve(
                    to: CGPoint(
                        x: width,
                        y: height - 20
                    ),
                    control: CGPoint(
                        x: width,
                        y: height - bottomCorrection
                    )
                )

                // TOP RIGHT CORNER
                path.addLine(to: CGPoint(
                    x: width,
                    y: 20
                ))

                path.addQuadCurve(
                    to: CGPoint(
                        x: width - 20,
                        y: 0
                    ),
                    control: CGPoint(
                        x: width,
                        y: 0
                    )
                )

            }.fill(.gray)
        }
    }
}
