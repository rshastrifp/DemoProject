//
//  API.swift
//  demo-ios-app
//
//  Created by Ronak Shastri on 2020-02-24.
//  Copyright © 2020 Digital Craft. All rights reserved.
//

import Foundation

protocol ApiProtocol: class {
    var uri: String { get }
}

class Api: ApiProtocol {
    var uri: String {
        fatalError("API uri Has to be overridden.")
    }
    
}
