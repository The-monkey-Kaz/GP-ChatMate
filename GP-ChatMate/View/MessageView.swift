//
//  MessageView.swift
//  GP-ChatMate
//
//  Created by myruei on 2023/04/24.
//

import SwiftUI

struct MessageView: View {
    var body: some View {
         HStack(alignment: .bottom, spacing: 15) {
          Image("MeAvatar")
                    .resizable()
                    .frame(width: 40, height: 40, alignment: .center)
                    .cornerRadius(20)
          ContentMessageView(contentMessage: "There are a lot of premium iOS templates on iosapptemplates.com",
                             isCurrentUser: false)
       }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView()
    }
}
