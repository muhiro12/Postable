//
//  OutputView.swift
//  Postable
//
//  Created by Hiromu Nakano on 2020/02/15.
//  Copyright © 2020 Hiromu Nakano. All rights reserved.
//

import SwiftUI

struct OutputView: View {
    let data: String?

    init(_ data: String?) {
        self.data = data
    }

    var body: some View {
        ScrollView {
            Text(data ?? "Response is empty.")
        }
    }
}

struct OutputView_Previews: PreviewProvider {
    static var previews: some View {
        OutputView("Test")
    }
}
