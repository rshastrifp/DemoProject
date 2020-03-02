//
//  TsnApi.swift
//  demo-ios-app
//
//  Created by Ronak Shastri on 2020-02-24.
//  Copyright © 2020 Digital Craft. All rights reserved.
//

import Foundation

typealias SuccessResponseModel = (_ tsnResponseModel: TsnResponseModel) -> Void
typealias Failure = (_ error: Error) -> Void

class TsnApi: Api {
    override var uri: String {
        return EnvironmentConfig.apiList[EnvironmentConfig.ConfigKey.swiftNews] ?? ""
    }
    
    func fetchData(api: Api, success: @escaping SuccessResponseModel, failure: @escaping Failure) {
        ApiClient().execute(api: api, success: { (data) in
            let tsnResponse = try? JSONDecoder().decode(TsnResponseModel.self, from: data)
        }) { (error) in
            failure(error)
        }
    }
}
