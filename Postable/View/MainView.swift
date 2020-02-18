//
//  MainView.swift
//  Postable
//
//  Created by Hiromu Nakano on 2020/02/16.
//  Copyright © 2020 Hiromu Nakano. All rights reserved.
//

import SwiftUI

struct MainView: View {
    @State private var urlText = ""
    @State private var methodSelection = 0
    @State private var headerText = ""
    @State private var parameterText = ""

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
            Section(header: Text("Header")) {
                NavigationLink(destination:
                    InputView(text: $headerText)
                        .navigationBarTitle("Header")
                ) {
                    Text(headerText)
                }
            }
            Section(header: Text("Parameter")) {
                NavigationLink(destination:
                    InputView(text: $parameterText)
                        .navigationBarTitle("Parameter")
                ) {
                    Text(parameterText)
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

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
