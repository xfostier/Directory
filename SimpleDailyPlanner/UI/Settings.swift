//
//  Settings.swift
//  SimpleDailyPlanner
//
//  Created by Xavier Fostier on 30/04/2024.
//

import SwiftUI

struct Settings: View {
    @Environment(\.presentationMode)
    var presentationMode
    
    private var data: DayData

    @State private var fgColor: Color
    
    @State private var bgColor: Color
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 40) {
                fgColorPicker
                bgColorPicker
            }
            .frame(maxHeight: .infinity)
            .background(bgColor)
            .navigationBarTitle(Text("Settings"), displayMode: .inline)
            .navigationBarItems(
                leading: Button(
                    action: {
                        presentationMode.wrappedValue.dismiss()
                    },
                    label: {
                        Text("Cancel").bold()
                    }),
                trailing: Button(action: {
                    data.fgColor = fgColor.parse()!
                    data.bgColor = bgColor.parse()!
                    StorageEngine.save(day: data)
                    presentationMode.wrappedValue.dismiss()
                },
                 label: {
                     Text("Done").bold()
                 })
            )
        }
        .bold()
        .foregroundStyle(fgColor)
    }
    
    init(data: DayData) {
        self.data = data
        self._fgColor = State(wrappedValue: data.fgColor.color!)
        self._bgColor = State(wrappedValue: data.bgColor.color!)
    }

    var fgColorPicker: some View {
        VStack {
            ColorPicker("ForegroundColor", selection: $fgColor, supportsOpacity: false)
        }
    }
    
    var bgColorPicker: some View {
        HStack {
            ColorPicker("BackgroundColor", selection: $bgColor, supportsOpacity: false)
        }
    }
}
