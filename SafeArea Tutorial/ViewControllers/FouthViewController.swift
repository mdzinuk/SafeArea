//
//  FouthViewController.swift
//  SafeArea Tutorial
//
//  Created by Mohammad Arafat Hossain on 3/06/19.
//  Copyright © 2019 Mohammad Arafat Hossain. All rights reserved.
//

import UIKit

class FouthViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    override func loadView() {
        super.loadView()
        
        tableView.estimatedRowHeight = 50
        let header = ReusableHeaderFooter(text: "This is custom UITableView Header.")
        tableView.tableHeaderView = header
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        tableFooterView?.updateLayout(with: tableView?.bounds.width ?? 0)
    }
    
    private var tableFooterView: ReusableHeaderFooter? {
        return tableView?.tableHeaderView as? ReusableHeaderFooter
    }
    
    func numberOfSections(in tableView: UITableView) -> Int { return 1 }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return 15 }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "kTableViewCell", for: indexPath)
        cell.textLabel?.text = "Title"
        cell.detailTextLabel?.text = "Sub Title"
        return cell
    }
}
