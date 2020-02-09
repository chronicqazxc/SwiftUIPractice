//
//  UserData.swift
//  SwiftUIPractice
//
//  Created by Wayne Hsiao on 2020/2/6.
//  Copyright © 2020 Wayne Hsiao. All rights reserved.
//

import Foundation

final class UserData: ObservableObject {
    @Published var name: String
    @Published var phoneNumber: String

    init(name: String = "", phoneNumber: String = "") {
        self.name = name
        self.phoneNumber = phoneNumber
    }
}
