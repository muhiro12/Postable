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
    @State private var urlText = ""
    @State private var methodSelection = 0
    @State private var headerCount = 0
    @State private var parametersCount = 0

    private let methods = ["GET", "POST"]

    var body: some View {
        Form {
            Section(header: Text("URL")) {
                TextField("https://example.com", text: $urlText)
                    .textContentType(.URL)
                    .autocapitalization(.none)
            }
            Section(header: Text("Method")) {
                Picker(selection: $methodSelection, label: Text("")) {
                    ForEach(0..<methods.count) { index in
                        Text(self.methods[index])
                    }
                }
            }
            Section(header:
                HStack {
                    Text("Header")
                    Spacer()
                    Button(action: {
                        if self.headerCount > 0 {
                            self.headerCount -= 1
                        }
                    }, label: {
                        Image(systemName: "minus")
                    })
                    Text(headerCount.description)
                    Button(action: {
                        self.headerCount += 1
                    }, label: {
                        Image(systemName: "plus")
                    })
                }
            ) {
                NavigationLink(destination:
                    KeyValueView(count: headerCount)
                        .navigationBarTitle("Header")
                ) {
                    Text("{key:value}")
                }
            }
            Section(header:
                HStack {
                    Text("Parameter")
                    Spacer()
                    Button(action: {
                        if self.parametersCount > 0 {
                            self.parametersCount -= 1
                        }
                    }, label: {
                        Image(systemName: "minus")
                    })
                    Text(parametersCount.description)
                    Button(action: {
                        self.parametersCount += 1
                    }, label: {
                        Image(systemName: "plus")
                    })
                }
            ) {
                NavigationLink(destination:
                    KeyValueView(count: parametersCount)
                        .navigationBarTitle("Parameter")
                ) {
                    Text("{key:value}")
                }
            }
            NavigationLink(destination:
                OutputView(url: urlText)
                    .navigationBarTitle("Response")
            ) {
                Text("Request")
                    .foregroundColor(.blue)
            }
        }
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView()
    }
}
