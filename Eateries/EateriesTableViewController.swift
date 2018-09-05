//
//  EateriesTableViewController.swift
//  Eateries
//
//  Created by Nugumanov on 14.08.18.
//  Copyright © 2018 Nugumanov Dima. All rights reserved.
//

import UIKit

class EateriesTableViewController: UITableViewController {
    
    var restaurants: [Restaurant] = [
        Restaurant(name: "Ogonek Grill&Bar", image: "ogonek.jpeg", type: "restaurant", location: "Dnipro bla bla bla bla bla bla bla bla bla bla bla bla asdasdasdasdasdasda", isVisited: false),
        Restaurant(name: "Eлу", image: "elu.jpeg", type: "restaurant", location: "Dnipro", isVisited: false),
        Restaurant(name: "Bonsai", image: "bonsai.jpeg", type: "restaurant", location: "Dnipro", isVisited: false),
        Restaurant(name: "Дастархан", image: "dastarhan.jpeg", type: "restaurant", location: "Dnipro", isVisited: false),
        Restaurant(name: "Индокитай", image: "indokitay.jpeg", type: "restaurant", location: "Dnipro", isVisited: false),
        Restaurant(name: "X.O.", image: "x.o..jpeg", type: "restaurant", location: "Dnipro", isVisited: false),
        Restaurant(name: "Балкан Гриль", image: "ogonek.jpeg", type: "restaurant", location: "Dnipro", isVisited: false),
        Restaurant(name: "Respublica", image: "respublica.jpeg", type: "restaurant", location: "Dnipro", isVisited: false),
        Restaurant(name: "Speak Easy", image: "speakeasy.jpeg", type: "restaurant", location: "Dnipro", isVisited: false),
        Restaurant(name: "Morris Pub", image: "morris.jpeg", type: "restaurant", location: "Dnipro", isVisited: false),
        Restaurant(name: "Вкусные Истории", image: "istorii.jpeg", type: "restaurant", location: "Dnipro", isVisited: false),
        Restaurant(name: "Классик", image: "klassik.jpeg", type: "restaurant", location: "Dnipro", isVisited: false),
        Restaurant(name: "Love&Life", image: "love.jpeg", type: "restaurant", location: "Dnipro", isVisited: false),
        Restaurant(name: "Шок", image: "shok.jpeg", type: "restaurant", location: "Dnipro", isVisited: false),
        Restaurant(name: "Бочка", image: "bochka.jpeg", type: "restaurant", location: "Dnipro", isVisited: false),
    ]
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.hidesBarsOnSwipe = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 85
        tableView.rowHeight = UITableViewAutomaticDimension
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurants.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! EateriesTableViewCell
        
        cell.thumbnailImageView.image = UIImage(named: restaurants[indexPath.row].image)
        cell.thumbnailImageView.layer.cornerRadius = 33.5
        cell.thumbnailImageView.clipsToBounds = true
        cell.nameLabel.text = restaurants[indexPath.row].name
        cell.typeLabel.text = restaurants[indexPath.row].type
        cell.locationLabel.text = restaurants[indexPath.row].location
        
        
        cell.accessoryType = self.restaurants[indexPath.row].isVisited ? .checkmark : .none
        
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        // First alert controller with action sheet style
//        let ac = UIAlertController(title: nil, message: "Select an action", preferredStyle: .actionSheet)
//        // First alert controller alert
//        let call = UIAlertAction(title: "Call: +38 (095) 458-85-8\(indexPath.row)", style: .default) {
//            (action: UIAlertAction) -> Void in
//            // Second alert controller inside first action
//            let alertC = UIAlertController(title: nil, message: "Call cannot be made", preferredStyle: .alert)
//            // Second alert action
//            let ok = UIAlertAction(title: "OK", style: .default)
//            // Add action to second alert controller
//            alertC.addAction(ok)
//            // Present second alert controller
//            self.present(alertC, animated: true)
//        }
//        // Second action
//        let isVisitedTitle = self.restaurantsIsVisited[indexPath.row] ? "I wasn't here" : "I was here"
//        let isVisited = UIAlertAction(title: isVisitedTitle, style: .default) { (action11) in
//            let cell = tableView.cellForRow(at: indexPath)
//            
//            self.restaurantsIsVisited[indexPath.row] = !self.restaurantsIsVisited[indexPath.row]
//            cell?.accessoryType = self.restaurantsIsVisited[indexPath.row] ? .checkmark : .none
//        }
//        // Third action
//        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
//        // Add all actions to first alert controller
//        ac.addAction(isVisited)
//        ac.addAction(cancel)
//        ac.addAction(call)
//        // Present fisrt alert controller
//        present(ac, animated: true)
//    }
    //
    //    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    //
    //        if editingStyle == .delete {
    //            self.restaurantNames.remove(at: indexPath.row)
    //            self.restaurantsImages.remove(at: indexPath.row)
    //            self.restaurantsIsVisited.remove(at: indexPath.row)
    //        }
    //        tableView.deleteRows(at: [indexPath], with: .fade)
    //    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let share = UITableViewRowAction(style: .default, title: "Share") { (action, indexPath) in
            let defaultText = "I'm here now" + self.restaurants[indexPath.row].name
            if let image = UIImage(named: self.restaurants[indexPath.row].image) {
                let activityController = UIActivityViewController(activityItems: [defaultText, image], applicationActivities: nil)
                self.present(activityController, animated: true)
            }
        }
        
        let delete = UITableViewRowAction(style: .default, title: "Delete") { (action, indexPath) in
            self.restaurants.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        share.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        delete.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        return [delete, share]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let dvc = segue.destination as? EateryDetailViewController
                dvc?.restaraunt = restaurants[indexPath.row]
            }
        }
    }
    
}









