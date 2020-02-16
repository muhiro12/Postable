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
    @State var data: String?
    @State private var isLoading = false

    private let api = API()

    let url: String?

    init(url: String?) {
        self.url = url
    }

    var body: some View {
        ZStack {
            GeometryReader { geometry in
                Form {
                    TextView(text: self.$data, isEditable: false)
                        .frame(height: geometry.size.height)
                }
            }
            ActivityIndicator(isAnimating: $isLoading, style: .large)
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
        var output: String?
        _ = async { _ in
            self.isLoading = true
            let result = try await(self.api.request(target: target))
            switch result {
            case .success(let response):
                output = String(data: response.data, encoding: .utf8)
            case .failure(let error):
                output = error.errorDescription
            }
        }.then {
            self.data = output
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
