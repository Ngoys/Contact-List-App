//
//  Constant.swift
//  OrionContactList
//
//  Created by Ngo Yen Sern on 23/04/2019.
//  Copyright © 2019 ngoys. All rights reserved.
//

import Foundation

struct Constant {
    
    struct JSONFile {
        static let name = "data"
        static let type = "json"
        
        static let fullFileName = name + "." + type
        
        static let commonErrorMessage = "Something wrong happened, please report it to our customer service."
    }
    
    struct Text {
        static let done = "Done!"
        static let error = "Error"
        static let noResult = "No Result Found"
    }
}

struct NotificationName {
    static let didSuccessUpdateContactDetails = "didSuccessUpdateContactDetails"
}

struct Status {
    static let success = "OK"
    static let error = "error"
}

