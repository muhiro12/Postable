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
    @State private var isPresented = false
    @State private var text = ""
    @State private var output: String?

    private let api = API()

    var body: some View {
        Form {
            Section(header: Text("URL")) {
                TextField("URL", text: $text)
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
            Button(action: {
                self.tapButton()
            }, label: {
                Text("Button")
            })
        }.sheet(isPresented: $isPresented) {
            OutputView(self.output)
        }
    }
}

extension InputView {
    private func tapButton() {
        guard let url = URL(string: text) else {
            return
        }

        let target = Target(baseURL: url,
                            path: "",
                            method: .get,
                            task: .requestPlain)
        var output: String?
        _ = async { _ in
            let result = try await(self.api.request(target: target))
            switch result {
            case .success(let response):
                output = String(data: response.data, encoding: .utf8)
            case .failure(let error):
                output = error.errorDescription
            }
        }.then {
            self.output = output
            self.isPresented.toggle()
        }
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView()
    }
}
