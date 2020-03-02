//
//  EnvironmentConfig.swift
//  demo-ios-app
//
//  Created by Ronak Shastri on 2020-02-24.
//  Copyright © 2020 Digital Craft. All rights reserved.
//

import Foundation

struct EnvironmentConfig {

    struct ConfigKey {
        static var swiftNews: String {return "swift_news"}
    }

    static var apiList:[String: String] {
        return NSDictionary(contentsOfFile: apiFilePath) as? [String:String] ?? [:]
    }

    private static var apiFilePath: String {
        return Bundle.main.path(forResource: "Apis", ofType: "plist")!
    }
}
