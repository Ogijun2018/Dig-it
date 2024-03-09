//
//  LogInView.swift
//  dig-it
//
//  Created by Jun Ogino on 2024/03/09.
//

import SwiftUI

struct LogInView: View {
    var body: some View {
        VStack {
            Rectangle()
                .frame(width: 50, height: 50)
            Text("Sign in to your account")
            CommonButton(title: "Sign in with Google", color: .gray) {
                print("sign in with google")
            }
            CommonButton(title: "Sign in with Apple", color: .gray) {
                print("Sign in with Apple")
            }
            Text("or continue with")
            Text("Email address")
            Text("Password")
            Button(action: {}, label: {
                Text("forgot password?")
            })
            CommonButton(title: "Continue", color: .black) {
                print("Continue")
            }
        }
        // 内側にpaddingを縦横30pt追加
        .padding(.horizontal, 30)
        .padding(.vertical, 30)
        .background(.blue)
        // 外側にmarginを横に30pt追加
        .padding(.horizontal, 30)
        .clipShape(RoundedRectangle(cornerRadius: 5))
    }
}

#Preview {
    LogInView()
}
