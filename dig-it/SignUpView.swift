//
//  SignUpView.swift
//  dig-it
//
//  Created by Jun Ogino on 2024/03/09.
//

import SwiftUI
import AuthenticationServices

struct SignUpView: View {

    @State var givenName: String?
    @State var familyName: String?
    @State var email: String?
    @State var error: String?

    var body: some View {
        VStack {
            Text("givenName: \(givenName ?? "is nil")")
            Text("familyName: \(familyName ?? "is nil")")
            Text("email: \(email ?? "is nil")")
        }

        SignInWithAppleButton(.signUp) { request in
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
    }
}

#Preview {
    SignUpView()
}
