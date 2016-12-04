//
//  NSError+Helpers.swift
//  VideoCarousel
//
//  Created by Danis Ziganshin on 04/12/2016.
//  Copyright © 2016 Danis Ziganshin. All rights reserved.
//

import Foundation

extension NSError {
    
    static let DomainName = "com.zigdanis.videocarousel"
        
    static var parsingError: NSError {
        get {
            return NSError(domain: DomainName, code: 900, userInfo: ["title": "Parsing Error"])
        }
    }
}
