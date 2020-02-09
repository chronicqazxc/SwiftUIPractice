//
//  ProfileView.swift
//  SwiftUIPractice
//
//  Created by Wayne Hsiao on 2020/2/7.
//  Copyright © 2020 Wayne Hsiao. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var userData: UserData
    @Environment(\.editMode) var mode
    @Environment(\.presentationMode) var presentation
    @State fileprivate var draftUserData: UserData = UserData()
    
    var body: some View {
        VStack {
            HStack {
                EditButton()
                Spacer()
                Button(action: {
                    
                    if self.mode?.wrappedValue == .active {
                        self.mode?.wrappedValue = .inactive
                        self.userData.name = self.draftUserData.name
                        self.userData.phoneNumber = self.draftUserData.phoneNumber
                    } else {
                        self.presentation.wrappedValue.dismiss()
                    }
                }) {
                    Text("Cancel")
                }
            }
            
            List {
                HStack {
                    Text("Name:")
                        .multilineTextAlignment(.leading)
                        .frame(width: 120)
                    Divider()
                    if mode?.wrappedValue == .active {
                        TextField("User Name", text: $userData.name)
                    } else {
                        Text(userData.name)
                    }
                    
                }
                HStack {
                    Text("Phone Number:")
                        .frame(width: 120)
                    Divider()
                    
                    if mode?.wrappedValue == .active {
                        TextField("Phone Number", text: $userData.phoneNumber)
                    } else {
                        Text(userData.phoneNumber)
                    }
                }
                
            }
        }
        .onAppear {
            self.draftUserData.name = self.userData.name
            self.draftUserData.phoneNumber = self.userData.phoneNumber
        }
        .padding()
    }

}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
