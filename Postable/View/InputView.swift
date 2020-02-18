//
//  InputView.swift
//  Postable
//
//  Created by Hiromu Nakano on 2020/02/15.
//  Copyright © 2020 Hiromu Nakano. All rights reserved.
//

import SwiftUI

struct InputView: View {
    @Binding var text: String

    var body: some View {
        GeometryReader { geometry in
            Form {
                TextView(text: self.$text)
                    .frame(height: geometry.size.height - geometry.frame(in: .global).minY)
            }
        }
    }
}

struct InputView_Previews: PreviewProvider {
    @State private static var text = ""
    static var previews: some View {
        InputView(text: $text)
    }
}
