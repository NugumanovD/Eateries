//
//  EateryDetailViewController.swift
//  Eateries
//
//  Created by Nugumanov on 8/21/18.
//  Copyright © 2018 Nugumanov Dima. All rights reserved.
//

import UIKit

class EateryDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var imageView: UIImageView!
    var restaraunt: Restaurant?
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 38
        tableView.rowHeight = UITableViewAutomaticDimension
        
        imageView.image = UIImage(named: restaraunt!.image)
//        tableView.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
//        tableView.separatorColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        title = restaraunt!.name
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! EateryDetailTableViewCell
        
        switch indexPath.row {
        case 0:
            cell.keyLabel.text = "Name"
            cell.valueLabel.text = restaraunt!.name
        case 1:
            cell.keyLabel.text = "Type"
            cell.valueLabel.text = restaraunt!.type
        case 2:
            cell.keyLabel.text = "Adress"
            cell.valueLabel.text = restaraunt!.location
        case 3:
            cell.keyLabel.text = "I was there"
            cell.valueLabel.text = restaraunt!.isVisited ? "Yes" : "No"
        default:
            break
        }
        cell.backgroundColor = UIColor.clear
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
