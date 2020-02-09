//
//  SettingView.swift
//  SwiftUIPractice
//
//  Created by Wayne Hsiao on 2020/2/5.
//  Copyright © 2020 Wayne Hsiao. All rights reserved.
//

import SwiftUI
import Foundation

struct SettingView: View {
    @Binding var showContent: Bool
    @Binding var backgroundColor: Color
    
    @EnvironmentObject var userData: UserData

    var body: some View {
        ZStack {
            Form {
                Section(header: Text("Display")){
                    Toggle(isOn: $showContent) {
                        Text("Show Content")
                    }
                    
                    HStack {
                        Text("Theme")
                            .frame(width: 80)
                        Divider()
                        
                        Picker("Background Color", selection: $backgroundColor) {
                            ForEach(BackgroundColors, id: \.self) { color in
                                Text(DescriptionFromColor(color))
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                }
            }
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView(showContent: .constant(false),
                    backgroundColor: .constant(.blue))
        .environmentObject(UserData())
    }
}
