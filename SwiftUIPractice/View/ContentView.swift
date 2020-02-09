//
//  ContentView.swift
//  SwiftUIPractice
//
//  Created by Wayne Hsiao on 2020/2/4.
//  Copyright © 2020 Wayne Hsiao. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State fileprivate var showContent: Bool = false
    @State fileprivate var themeColor: Color = BackgroundColors.first!
    @State fileprivate var toggleProfileOn: Bool = false
    @State fileprivate var selectedCategory: String = Categories.allCases.map {
        $0.rawValue
    }.first!
    
    @EnvironmentObject var userData: UserData

    var categories: [String] {
        Categories.allCases.map {
            $0.rawValue
        }
    }
    
    var systemNames: [String] {
        (Categories(rawValue: self.selectedCategory)?.symbols)!
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                themeColor
                VStack(spacing: 0) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(alignment: .center) {
                            ForEach(categories, id: \.self) { (id) -> Button<Text> in
                                
                                let text = id == self.selectedCategory ? Text(id).bold().font(.title) : Text(id)
                                
                                return Button(action: {
                                    self.selectedCategory = id
                                }) {
                                    text
                                }
                            }
                            .padding(.horizontal)
                            .frame(height: 40)
                        }
                    }
                    .foregroundColor(.white)
                    
                    SettingView(showContent: $showContent,
                                backgroundColor: $themeColor)
                        .frame(height: 140)
                    
                    if showContent {
                        List {
                            Section(header: Text("Category")) {
                                HStack {
                                    Spacer()
                                    Image(systemName: self.systemNames.first!)
                                    .resizable()
                                    .scaledToFit()
                                    .accessibility(label: Text(systemNames.first!))
                                    .padding()
                                    .frame(height: 100, alignment: .center)
                                    Spacer()
                                }
                            }
                            
                            Section(header: Text("Symbols")) {
                                
                                ForEach(systemNames, id: \.self) { (item) -> NavigationLink<RowView, AvatarView> in
                                    NavigationLink(destination: AvatarView(id: item)) {
                                        RowView(name: item)
                                    }
                                }
                            }
                        }
                    } else {
                        Spacer()
                            .layoutPriority(0)
                    }
                }
                .sheet(isPresented: $toggleProfileOn) {
                    ProfileView()
                        .environmentObject(self.userData)
                }
                .navigationBarTitle(Text("\(userData.name)"))
                .navigationBarItems(trailing: Button(action: { self.toggleProfileOn.toggle() }) {
                    Image(systemName: "person.crop.circle")
                        .imageScale(.large)
                        .accessibility(label: Text("User Profile"))
                        .padding()
                })
                    .foregroundColor(themeColor)
            }
        }
    }
}

struct RowView: View {
    var name: String = ""
    var body: some View {
        HStack {
            Image(systemName: name)
                .imageScale(.large)
                .accessibility(label: Text(name))
                .padding()
            Text(name)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
            ContentView()
                .environmentObject(UserData())
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
