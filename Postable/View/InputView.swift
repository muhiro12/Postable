//
//  InputView.swift
//  Postable
//
//  Created by Hiromu Nakano on 2020/02/15.
//  Copyright © 2020 Hiromu Nakano. All rights reserved.
//

import SwiftUI

struct InputView: View {
    @State private var isPresented = false
    @State private var text = ""

    var body: some View {
        Form {
            Section(header: Text("Header")) {
                HStack {
                    TextField("key", text: $text)
                    Divider()
                    TextField("value", text: $text)
                }
                HStack {
                    TextField("key", text: $text)
                    Divider()
                    TextField("value", text: $text)
                }
                HStack {
                    TextField("key", text: $text)
                    Divider()
                    TextField("value", text: $text)
                }
            }
            Section(header: Text("Parameter")) {
                HStack {
                    TextField("key", text: $text)
                    Divider()
                    TextField("value", text: $text)
                }
                HStack {
                    TextField("key", text: $text)
                    Divider()
                    TextField("value", text: $text)
                }
                HStack {
                    TextField("key", text: $text)
                    Divider()
                    TextField("value", text: $text)
                }
            }
            Button(action: {
                self.isPresented.toggle()
            }, label: {
                Text("Button")
            })
        }.sheet(isPresented: $isPresented) {
            OutputView()
        }
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView()
    }
}
