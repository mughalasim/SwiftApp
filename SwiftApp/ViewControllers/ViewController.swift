//
//  ViewController.swift
//  SwiftApp
//
//  Created by Asim Mughal on 20/12/2020.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var txtNoResults: UILabel!
    var refreshControl = UIRefreshControl()
    
    
    // MARK: - CLASS OVERRIDE METHODS ---------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up the tableview
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = UIColor.white
        tableView.register(UINib(nibName: "MainTableViewCell", bundle: nil), forCellReuseIdentifier: "MainTableViewCell")
        
        // Add a refresh control to swipe down and refetch the data
        refreshControl.addTarget(self, action: #selector(self.refreshPulled(_:)), for: .valueChanged)
        tableView.addSubview(refreshControl)
        
        // Fetch the data from the API once
        fetchData()
        
        
    }
    
    @objc func refreshPulled(_ sender: AnyObject) {
        fetchData()
    }
    
    func fetchData(){
        refreshControl.beginRefreshing()
        NetworkManager.shared.getData(self) {
            self.refreshControl.endRefreshing()
            self.tableView.reloadData()
        }
    }
    
    
    
    // MARK: - TABLE METHODS ------------------------------------------------------------------
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (MainResult.shared?.sections.count ?? 0 < 1){
            self.txtNoResults.alpha = 1
            return 0
        } else {
            self.txtNoResults.alpha = 0
            return MainResult.shared?.sections.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Settings.shared.HORIZONTAL_ITEMS_HEIGHT
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell") as! MainTableViewCell
        let i = indexPath.row
        cell.txtSectionName.text = MainResult.shared?.sections[i].name ?? "No section name"
        if (MainResult.shared?.sections[i].item?.count ?? 0 > Settings.shared.MAX_HORIZONTAL_ITEMS){
            cell.viewMore.alpha = 1
        } else {
            cell.viewMore.alpha = 0
        }
        return cell
        
    }
    
    
    
}

