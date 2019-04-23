//
//  VC_ContactDetail.swift
//  OrionContactList
//
//  Created by Ngo Yen Sern on 23/04/2019.
//  Copyright © 2019 ngoys. All rights reserved.
//

import Foundation
import UIKit

class VC_ContactDetail: VC_Base {
    @IBOutlet weak var svDetail: UIScrollView!
    @IBOutlet weak var ivProfile: UIImageView!
    @IBOutlet weak var tfFirstName: UITextField!
    @IBOutlet weak var tfLastName: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPhone: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        self.ivProfile.layer.cornerRadius = self.ivProfile.frame.size.height / 2
        
        registerForKeyboardWillShowNotification(self.svDetail)
        registerForKeyboardWillHideNotification(self.svDetail)
        
    }
    
    @IBAction func save(_ sender: Any) {
        guard let fName = tfFirstName.text, !fName.isEmpty else {
            return
        }
        guard let lName = tfLastName.text, !lName.isEmpty else {
            return
        }
        
        
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func cancel(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension VC_ContactDetail: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        var tag = textField.tag
        tag += 1
        if let tf = self.view.viewWithTag(tag) as? UITextField {
            tf.becomeFirstResponder()
        }
        else {
            self.view.endEditing(true)
        }
        
        return true;
    }
}

extension VC_ContactDetail: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.view.endEditing(true)
    }
}
