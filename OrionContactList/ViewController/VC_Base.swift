//
//  VC_Base.swift
//  OrionContactList
//
//  Created by Ngo Yen Sern on 23/04/2019.
//  Copyright © 2019 ngoys. All rights reserved.
//

import Foundation
import UIKit

class VC_Base: UIViewController {
    
    let loadingIndicatorTag = 99999
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func showActivityIndicatory(uiView: UIView) {
        let container = UIView()
        container.tag = loadingIndicatorTag
        container.frame = uiView.frame
        container.center = uiView.center
        container.backgroundColor = UIColor(hexString: "0xffffff", alpha: 0.3)
        
        let loadingView = UIView()
        loadingView.frame = CGRect(x: 0, y: 0, width: 80.0, height: 80.0);
        loadingView.center = uiView.center
        loadingView.backgroundColor = UIColor(hexString: "0x444444", alpha: 0.7)
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10
        
        let actInd = UIActivityIndicatorView()
        actInd.frame = CGRect(x: 0, y: 0, width: 40.0, height: 40.0);
        actInd.style = .whiteLarge
        actInd.center = CGPoint(x: loadingView.frame.size.width / 2, y: loadingView.frame.size.height / 2);
        loadingView.addSubview(actInd)
        container.addSubview(loadingView)
        uiView.addSubview(container)
        actInd.startAnimating()
    }
    
    func hideActivityIndicatory() {
        let loadingContainer = self.view.viewWithTag(loadingIndicatorTag)
        loadingContainer?.isHidden = true;
        loadingContainer?.removeFromSuperview()
        
    }
}
