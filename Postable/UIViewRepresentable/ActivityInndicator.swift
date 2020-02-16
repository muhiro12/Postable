//
//  ActivityInndicator.swift
//  Postable
//
//  Created by Hiromu Nakano on 2020/02/15.
//  Copyright © 2020 Hiromu Nakano. All rights reserved.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
    typealias UIViewType = UIActivityIndicatorView

    @Binding var isAnimating: Bool

    let style: UIActivityIndicatorView.Style

    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> ActivityIndicator.UIViewType {
        return UIActivityIndicatorView(style: style)
    }

    func updateUIView(_ uiView: ActivityIndicator.UIViewType, context: UIViewRepresentableContext<ActivityIndicator>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}
