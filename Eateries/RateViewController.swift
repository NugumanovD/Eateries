//
//  RateViewController.swift
//  Eateries
//
//  Created by Nugumanov Dmitry on 06.09.2018.
//  Copyright © 2018 Nugumanov Dima. All rights reserved.
//

import UIKit

class RateViewController: UIViewController {
    
    @IBOutlet weak var ratingStackView: UIStackView!
    
    @IBOutlet weak var badButton: UIButton!
    @IBOutlet weak var goodButton: UIButton!
    @IBOutlet weak var exellentButton: UIButton!
    var restRating: String?
    
    @IBAction func rateRestaurant(_ sender: UIButton) {
        switch sender.tag {
        case 0: restRating = "bad"
        case 1: restRating = "good"
        case 2: restRating = "exellent"
        default: break
        }
        performSegue(withIdentifier: "unwindSegueToDVC", sender: sender)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //        UIView.animate(withDuration: 0.4) {
        //            self.ratingStackView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        //        }
        let buttonArray = [badButton, goodButton, exellentButton]
        
        for (index, button) in buttonArray.enumerated() {
            let delay = Double(index) * 0.3
            UIView.animate(withDuration: 0.6, delay: delay, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                button?.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            }, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        badButton.transform = CGAffineTransform(scaleX: 0, y: 0)
        goodButton.transform = CGAffineTransform(scaleX: 0, y: 0)
        exellentButton.transform = CGAffineTransform(scaleX: 0, y: 0)
        
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.view.bounds
        blurEffectView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.view.insertSubview(blurEffectView, at: 1)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
