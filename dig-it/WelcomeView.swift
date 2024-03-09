//
//  WelcomeView.swift
//  dig-it
//
//  Created by Jun Ogino on 2024/03/09.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack {
            Text("Dig it!")
                .font(.system(size: 64))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.leading, .trailing], 60)
            Text("Let's find your favorite dig.")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.leading, .trailing], 60)
                .padding(.bottom, 24)
            CommonButton(title: "Sign in", color: .blue) {
                print("sign in")
            }
            .padding([.leading, .trailing], 60)
            .padding(.bottom, 10)
            CommonButton(title: "Log in", color: .green) {
                print("Log in")
            }.padding([.leading, .trailing], 60)
        }
    }
}

#Preview {
    WelcomeView()
}
