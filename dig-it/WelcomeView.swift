//
//  WelcomeView.swift
//  dig-it
//
//  Created by Jun Ogino on 2024/03/09.
//

import SwiftUI

struct WelcomeView: View {
    private enum Path {
        case signUp
        case logIn
    }

    @State private var path = [Path]()

    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Text("Dig it!")
                    .font(.system(size: 64))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .trailing], 60)
                Text("Let's find your favorite dig.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .trailing], 60)
                    .padding(.bottom, 24)
                CommonButton(title: "Sign Up", color: .blue) {
                    path.append(.signUp)
                }
                .padding([.leading, .trailing], 60)
                .padding(.bottom, 10)
                CommonButton(title: "Log in", color: .green) {
                    path.append(.logIn)
                }
                .padding([.leading, .trailing], 60)
            }
            .navigationDestination(for: Path.self) { path in
                switch path {
                case .logIn:
                    LogInView()
                case .signUp:
                    SignUpView()
                }
            }
        }
    }
}

#Preview {
    WelcomeView()
}
