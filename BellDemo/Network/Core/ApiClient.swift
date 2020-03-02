//
//  ApiClient.swift
//  demo-ios-app
//
//  Created by Ronak Shastri on 2020-02-24.
//  Copyright © 2020 Digital Craft. All rights reserved.
//

import Foundation
import Alamofire

typealias Success = (_ data: Data) -> Void

class ApiClient {
    
    //I may like to use RXSwift instead of completion handler. But used Completion handeler for demo purpose. 
    public func execute(api: Api, success: @escaping Success, failure: @escaping Failure) {
        
        guard let url = URL(string: api.uri) else { return }

        URLSession.shared.dataTask(with: url) { (data, response, err) in

            guard let dataPrm = data else { return }
            
            success(dataPrm)

//            //let dataAsString = String(data: data, encoding: .utf8)
//
//            //print(dataAsString)
//
//            do {
//                let coins = try JSONDecoder().decode(Coins.self, from: data)
//                print(coins.id)
//
//            } catch let jsonErr {
//                print("error serializing json")
//                print()
//            }

            }.resume()
        
        AF.request(api.uri, method: .get,  parameters: nil, encoding: JSONEncoding.default)
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    if let json = value as? [String: Any] {
                        if let data = json["data"] as? [String: AnyObject] {
                            if let children = data["children"] as? [[String: AnyObject]] {
                                for element in children {
                                    
                                }
                                successJson(children)
                            }
                        }
                    }
                case .failure(let error):
                    print(error)
                }
        }
    }
}

