//
//  VC_ContactList.swift
//  OrionContactList
//
//  Created by Ngo Yen Sern on 23/04/2019.
//  Copyright © 2019 ngoys. All rights reserved.
//

import Foundation
import UIKit

class VC_ContactList: VC_Base {
    @IBOutlet weak var add: UIBarButtonItem!
    @IBOutlet weak var search: UIBarButtonItem!
    @IBOutlet weak var tvContact: UITableView!
    
    
    var refreshControl: UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setuptvContact()
        
        refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(getContactList), for: .valueChanged)
        tvContact.addSubview(refreshControl)
    }
    
    @objc func getContactList() {
        if (refreshControl.isRefreshing) {
            refreshControl.endRefreshing()
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Segue-Contact-Detail" {
            let viewController : VC_ContactDetail = segue.destination as! VC_ContactDetail
        }
    }
}

extension VC_ContactList: UITableViewDelegate,UITableViewDataSource {
    func setuptvContact() {
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        let row = indexPath.row
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell-Contact", for: indexPath)
        
        let lbPicture = cell.viewWithTag(101) as! UIImageView
        let lbTitle = cell.viewWithTag(102) as! UILabel
        
        lbPicture.layer.cornerRadius = lbPicture.frame.size.height / 2
        lbTitle.text = "asdasd"
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "Segue-Contact-Detail", sender: nil)
    }
}

