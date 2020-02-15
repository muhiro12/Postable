//
//  KeyValueView.swift
//  Postable
//
//  Created by Hiromu Nakano on 2020/02/16.
//  Copyright © 2020 Hiromu Nakano. All rights reserved.
//

import SwiftUI

struct KeyValueView: View {
    @State private var text = ""
    @State var count: Int

    var body: some View {
        Form {
            ForEach(0..<count) { _ in
                HStack {
                    TextField("key", text: self.$text)
                    Divider()
                    TextField("value", text: self.$text)
                }
            }
        }
    }
}

struct KeyValueView_Previews: PreviewProvider {
    static var previews: some View {
        KeyValueView(count: 5)
    }
}
