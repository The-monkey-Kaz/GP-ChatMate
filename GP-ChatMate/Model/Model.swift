//
//  Model.swift
//  GP-ChatMate
//
//  Created by myruei on 2023/04/20.
//

import Foundation

struct Message {
    var content: String
    var user: User
}
struct User {
    var name: String
    var avatar: String
    var isCurrentUser: Bool = false
}
