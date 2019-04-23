//
//  Contact.swift
//  OrionContactList
//
//  Created by Ngo Yen Sern on 23/04/2019.
//  Copyright © 2019 ngoys. All rights reserved.
//

import Foundation

struct Contact: Codable {
    let id : String?
    var firstName, lastName, email, phone: String?
    
    enum CodingKeys: String, CodingKey {
        case id, firstName, lastName, email, phone
    }
}
