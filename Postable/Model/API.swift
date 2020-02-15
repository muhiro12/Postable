//
//  API.swift
//  Postable
//
//  Created by Hiromu Nakano on 2020/02/15.
//  Copyright © 2020 Hiromu Nakano. All rights reserved.
//

import Foundation
import Moya
import Result
import Hydra

struct API {
    typealias MoyaResult = Result<Moya.Response, MoyaError>
    let provider = MoyaProvider<Target>()

    func request(target: Target) -> Promise<MoyaResult> {
        return Promise<MoyaResult>(in: .background) { resolve, _, _ in
            self.provider.request(target) {
                resolve($0)
            }
        }
    }
}

struct Target: TargetType {
    var baseURL: URL

    var path: String

    var method: Moya.Method

    var sampleData: Data

    var task: Task

    var headers: [String: String]?
}
