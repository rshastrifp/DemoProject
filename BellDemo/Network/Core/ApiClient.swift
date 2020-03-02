//
//  ApiClient.swift
//  demo-ios-app
//
//  Created by Ronak Shastri on 2020-02-24.
//  Copyright © 2020 Digital Craft. All rights reserved.
//

import Foundation
import Alamofire

typealias SuccessData = (_ data: Data) -> Void

class ApiClient {
    
    //I may like to use RXSwift instead of completion handler. But used Completion handeler for demo purpose. 
    public func execute(api: Api, success: @escaping SuccessData, failure: @escaping Failure) {
        
        guard let url = URL(string: api.uri) else { return }

        //Almofire can also be used for more advanced functions. 
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let dataPrm = data else { return }
            success(dataPrm)
            }.resume()
    }
}

