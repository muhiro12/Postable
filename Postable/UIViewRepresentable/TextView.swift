//
//  TextView.swift
//  Postable
//
//  Created by Hiromu Nakano on 2020/02/16.
//  Copyright © 2020 Hiromu Nakano. All rights reserved.
//

import SwiftUI

struct TextView: UIViewRepresentable {
    typealias UIViewType = UITextView

    @Binding var text: String?

    var font = UIFont.preferredFont(forTextStyle: .body)
    var isEditable = true
    var isSelectable = true

    func makeUIView(context: UIViewRepresentableContext<TextView>) -> TextView.UIViewType {
        let textView = UITextView()
        textView.font = font
        textView.isEditable = isEditable
        textView.isSelectable = isSelectable
        return textView
    }

    func updateUIView(_ uiView: TextView.UIViewType, context: UIViewRepresentableContext<TextView>) {
        uiView.text = text
    }
}
