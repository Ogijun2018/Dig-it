//
//  LogInView.swift
//  dig-it
//
//  Created by Jun Ogino on 2024/03/09.
//

import SwiftUI
import AuthenticationServices

struct LogInView: View {

    @State var givenName: String?
    @State var familyName: String?
    @State var email: String?
    @State var error: String?

    var body: some View {
        VStack {
            Rectangle()
                .frame(width: 50, height: 50)
            Text("Sign in to your account")
            CommonButton(title: "Sign in with Google", color: .gray) {
                print("sign in with google")
            }
            SignInWithAppleButton(.signIn) { request in
                request.requestedScopes = [.fullName, .email]
            } onCompletion: { results in
                switch results {
                case .success(let auth):
                    guard let credential = auth.credential as? ASAuthorizationAppleIDCredential else { return }
                    if let fullName = credential.fullName {
                        self.givenName = fullName.givenName
                        self.familyName = fullName.familyName
                    }
                    self.email = credential.email
                    print("sign in success, \(credential.fullName?.givenName), \(credential.email)")
                case .failure(let error):
                    self.error = error.localizedDescription
                }
            }
            .signInWithAppleButtonStyle(.black)
            .frame(height: 50)
            .padding()
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
