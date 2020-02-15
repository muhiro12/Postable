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
    @State private var url = ""
    @State private var headersCount = 0
    @State private var parametersCount = 0

    var body: some View {
        Form {
            Section(header: Text("URL")) {
                TextField("https://example.com", text: $url)
                    .textContentType(.URL)
                    .autocapitalization(.none)
            }
            Section(header: Text("Method")) {
                NavigationLink(destination:
                    Form {
                        Text("GET")
                        Text("POST")
                    }.navigationBarTitle("Header")
                ) {
                    Text("GET")
                }
            }
            Section(header:
                HStack {
                    Text("Header")
                    Spacer()
                    Button(action: {
                        if self.headersCount > 0 {
                            self.headersCount -= 1
                        }
                    }, label: {
                        Image(systemName: "minus")
                    })
                    Text(headersCount.description)
                    Button(action: {
                        self.headersCount += 1
                    }, label: {
                        Image(systemName: "plus")
                    })
                }
            ) {
                NavigationLink(destination:
                    KeyValueView(count: headersCount)
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
                OutputView(url: url)
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
