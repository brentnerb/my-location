//
//  DetailViewController.swift
//  My Location
//
//  Created by Brent Morgan on 10/30/17.
//  Copyright © 2017 Brent Morgan. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var coordinatesLabel: UITextView!
    
    var selectedLocation: MLLocation!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        locationLabel.text = "\(selectedLocation.name)"
        
        coordinatesLabel.text = selectedLocation.showSavedDataPoints()
  
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
