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
    @State fileprivate var themeColor: Color = ThemeColors.first!
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
            VStack(spacing: 0) {
                VStack {
                    Group {
                        Text("1")
                        Text("2")
                        Text("3")
                        Text("4")
                        Text("5")
                    }
                    
                    Group {
                        Text("6")
                        Text("7")
                        Text("8")
                        Text("9")
                        Text("10")
                        Text("11")
                    }
                }
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
                            themeColor: $themeColor)
                    .frame(height: 140)
                
                
                if showContent {
                    List {
                        
                        Section(header: Text("Category")) {
                            HStack {
                                Spacer()
                                ShakeImageView(imageName: self.systemNames.first!)
                                    .padding()
                                    .frame(height: 100, alignment: .center)
                                Spacer()
                            }
                        }
                        
                        Section(header: Text("Symbols")) {
                            
                            ForEach(systemNames, id: \.self) { (item) -> NavigationLink<RowView, SFSymbolView> in
                                NavigationLink(destination: SFSymbolView(id: item)) {
                                    RowView(name: item)
                                }
                            }
                        }
                    }
                    .transition(.move(edge: .bottom))
                } else {
                    Spacer()
                        .layoutPriority(0)
                }
            }
            .background(themeColor)
            .navigationBarTitle(Text("\(userData.name)"))
            .navigationBarItems(trailing: ProfilePresentingButton())
            .foregroundColor(themeColor)
        }
    }
}

struct ShakeImageView: View {
    var imageName: String
    @GestureState fileprivate var isDetectingLongPress = false
    @State fileprivate var shack = false
    
    var body: some View {

        let press = LongPressGesture()
            .updating($isDetectingLongPress) { (currentState, gestureState, transaction) in
                gestureState = currentState
                
        }
        .onChanged { (_) in
            withAnimation {
                self.shack = self.isDetectingLongPress
            }
        }
        .onEnded { (_) in
            self.shack = self.isDetectingLongPress
        }
        
        return Image(systemName: imageName)
            .resizable()
            .scaledToFit()
            .accessibility(label: Text(imageName))
            .padding()
            .frame(height: 100, alignment: .center)
            .gesture(press)
            .modifier(Shake(animatableData: CGFloat( shack ? 1 : 0)))
        
    }
}

struct ProfilePresentingButton: View {
    @State fileprivate var present: Bool = false
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        Button(action: {
            self.present.toggle()
        }) {
            Image(systemName: "person.crop.circle")
                .imageScale(.large)
                .accessibility(label: Text("User Profile"))
                .padding()
        }
        .sheet(isPresented: $present) {
            ProfileView()
                .environmentObject(self.userData)
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
