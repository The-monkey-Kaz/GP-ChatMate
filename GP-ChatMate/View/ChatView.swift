//
//  ContentView.swift
//  ChatViewTutorial
//
//  Created by Duy Bui on 2/2/20.
//  Copyright © 2020 Duy Bui. All rights reserved.
//

import SwiftUI

struct ChatView: View {
    @State var typingMessage: String = ""
    @EnvironmentObject var chatHelper: ChatHelper
    @ObservedObject private var keyboard = KeyboardResponder()
    
    init() {
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().tableFooterView = UIView()
    }
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollViewReader { scrollViewProxy in
                    ScrollView {
                        VStack(alignment: .leading, spacing: 6) {
                            ForEach(Array(chatHelper.realTimeMessages.enumerated()), id: \.element) {index, msg in
                                MessageView(currentMessage: msg)
                                    .id(index)
                            }
                        }
                        .padding()
                        .onChange(of: chatHelper.realTimeMessages) { _ in
                            if let lastIndex = chatHelper.realTimeMessages.indices.last {
                                scrollViewProxy.scrollTo(lastIndex, anchor: .bottom)
                            }
                        }
                    }
                }
                HStack {
                    TextField("入力してください...", text: $typingMessage)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(minHeight: CGFloat(30))
                        .onSubmit {
                            sendMessage()
                        }
                    Button(action: sendMessage) {
                        Text("送信")
                            .font(.system(size: 17))
                            .foregroundColor(Color.white)
                            .padding(9)
                            .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.blue))
                            
                        
                        
                    }
                }.frame(minHeight: CGFloat(50)).padding()
            }.navigationBarTitle(Text("GP-ChatMate"), displayMode: .inline)
                .background(Color("PaleBlue"))
                .offset(y: -keyboard.currentHeight)
                .edgesIgnoringSafeArea(keyboard.currentHeight == 0.0 ? .leading: .bottom)
        }.onTapGesture {
                self.endEditing(true)
        }
    }
    
    func sendMessage() {
        chatHelper.sendMessage(Message(content: typingMessage, user: DataSource.secondUser))
        typingMessage = ""
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
            ChatView().environmentObject(ChatHelper())
    }
}
