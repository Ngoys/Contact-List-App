//
//  ContactJSONFileManager.swift
//  OrionContactList
//
//  Created by Ngo Yen Sern on 23/04/2019.
//  Copyright © 2019 ngoys. All rights reserved.
//

import Foundation

struct ContactJSONFileManager {
    var localPath : String
    var storedURL : URL
    
    private init() {
        localPath = Bundle.main.path(forResource: Constant.JSONFile.name, ofType: Constant.JSONFile.type)!
        
        let docDirURL = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        storedURL = (docDirURL?.appendingPathComponent(Constant.JSONFile.name).appendingPathExtension(Constant.JSONFile.type))!
    }
    
    static let SHARED = ContactJSONFileManager()
    
    func writeJSON(contacts : [Contact]) {
        if let encodedData = try? JSONEncoder().encode(contacts) {
            do {
                try encodedData.write(to: storedURL)
                print("Write Successfully")
                
            } catch let error as NSError {
                print("Failed writing to URL: \(storedURL), Error: " + error.localizedDescription)
            }
        }
    }
    
    func readJSON() -> [Contact] {
        var contacts = [Contact]()
        
        do {
            
            let data = try Data(contentsOf: URL(fileURLWithPath: localPath), options: .mappedIfSafe)
            contacts = try JSONDecoder().decode([Contact].self, from: data)
            
            writeJSON(contacts: contacts)
            
            
        } catch let error as NSError {
            print("Failed reading from URL: \(storedURL), Error: " + error.localizedDescription)
        }
        
        
        return contacts
    }
}
