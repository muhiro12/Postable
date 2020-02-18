//
//  OutputView.swift
//  Postable
//
//  Created by Hiromu Nakano on 2020/02/15.
//  Copyright © 2020 Hiromu Nakano. All rights reserved.
//

import SwiftUI
import Hydra

struct OutputView: View {
    @State var text: String = ""
    @State private var isLoading = false

    private let api = API()

    let url: String?

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Form {
                    TextView(text: self.$text, isEditable: false)
                        .frame(height: geometry.size.height - geometry.frame(in: .global).minY)
                }
                ActivityIndicator(isAnimating: self.$isLoading, style: .large)
            }
        }.onAppear {
            self.request()
        }
    }
}

extension OutputView {
    func request() {
        guard let url = URL(string: url ?? "") else {
            return
        }

        let target = Target(baseURL: url,
                            path: "",
                            method: .get,
                            task: .requestPlain)

        _ = async { _ in
            self.isLoading = true
            let result = try await(self.api.request(target: target))
            switch result {
            case .success(let response):
                self.text = String(data: response.data, encoding: .utf8) ?? "Unsupported format (Only UTF-8 is supported.)"
            case .failure(let error):
                self.text = error.errorDescription ?? "Error"
            }
        }.always {
            self.isLoading = false
        }
    }
}

struct OutputView_Previews: PreviewProvider {
    static var previews: some View {
        OutputView(url: nil)
    }
}
