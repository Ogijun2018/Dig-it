//
//  CommonButton.swift
//  dig-it
//
//  Created by Jun Ogino on 2024/03/09.
//

import SwiftUI

/// アプリ内で使用される共通のボタン
struct CommonButton: View {
    /// ボタンタイトル
    var title: String
    /// ボタンの周辺の色
    var color: Color
    /// ボタンを押した時のクロージャ
    var buttonDidTapHandler: () -> Void

    enum Const {
        /// ボタンの角丸
        static let cornerRadius: CGFloat = 5
    }

    var body: some View {
        Button(action: buttonDidTapHandler) {
            Text(title)
                .font(.system(size: 20, weight: .semibold))
                .frame(maxWidth: .infinity, minHeight: 60)
                .background(.white)
                .foregroundStyle(.black)
                .clipShape(.rect(cornerRadius: Const.cornerRadius))
                .overlay(
                    RoundedRectangle(cornerRadius: Const.cornerRadius)
                        .stroke(color, lineWidth: 2)
                        .shadow(color: color, radius: 1, x: 0, y: 0)
                )
        }
    }
}

#Preview {
    CommonButton(title: "Login", color: .blue) {
        print("hoge")
    }
}
