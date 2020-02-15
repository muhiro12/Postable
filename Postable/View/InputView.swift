//
//  InputView.swift
//  Postable
//
//  Created by Hiromu Nakano on 2020/02/15.
//  Copyright © 2020 Hiromu Nakano. All rights reserved.
//

import SwiftUI
import Hydra

struct InputView: View {
    @State private var text = ""
    @State private var target: Target?

    var body: some View {
        Form {
            Section(header: Text("URL")) {
                TextField("URL", text: $text)
                    .textContentType(.URL)
                    .autocapitalization(.none)
            }
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
            NavigationLink(destination:
                OutputView(url: text)
                    .navigationBarTitle("Response")
            ) {
                Text("Request")
            }
        }
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView()
    }
}
