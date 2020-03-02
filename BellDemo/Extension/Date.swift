//
//  Date.swift
//  BellDemo
//
//  Created by Ronak Shastri on 2020-03-02.
//  Copyright © 2020 Ronak. All rights reserved.
//

import Foundation

extension Date {
    
    func showOnlyDate(dateStr: String, format:String = "yyyy-MM-dd'T'HH:mm:ssZ") -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        
        let date = formatter.date(from: dateStr)

        formatter.dateFormat = "MMMM dd, yyyy"
        let formattedDate = formatter.string(from: date!)
        
        return formattedDate
    }
}

