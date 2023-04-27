//
//  Message.swift
//  ChatViewTutorial
//
//  Created by Duy Bui on 2/2/20.
//  Copyright © 2020 Duy Bui. All rights reserved.
//

import Foundation

struct Message: Hashable {
    var content: String
    var user: User
}

struct DataSource {
    static let firstUser = User(name: "AI", avatar: "robot")
    static var secondUser = User(name: "Me", avatar: "MeAvatar", isCurrentUser: true)
    static let messages = [
        Message(content: "ようこそ！私はあなた専属のAIチャットアシスタントです。何かお手伝いできることがあれば教えてくださいね。", user: DataSource.firstUser),
//        Message(content: "Thanks, nice to hear that, can I have your email please?", user: DataSource.secondUser),
//        Message(content: "😇", user: DataSource.firstUser),
//        Message(content: "Oh actually, I have just purchased the chat template, so please check your email, you might see my order", user: DataSource.firstUser),
//        Message(content: "Great, wait me a sec, let me check", user: DataSource.secondUser),
//        Message(content: "Sure", user: DataSource.firstUser)
    ]
}
