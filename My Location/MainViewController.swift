//
//  ViewController.swift
//  My Location
//
//  Created by Brent Morgan on 10/30/17.
//  Copyright © 2017 Brent Morgan. All rights reserved.
//

import UIKit
import CoreLocation

class MainViewController: UIViewController, CLLocationManagerDelegate {

    var locationManager: CLLocationManager?
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var currentlyModifyingLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    var currentLocationForEditing: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        title = "Main"
        
        if currentLocationForEditing != nil {
            currentlyModifyingLabel.text = DataService.instance.locations[currentLocationForEditing!].name
        }
        
//        if let loc = currentLocationForEditing?.name {
//            currentlyModifyingLabel.text = loc
//        }
        
        if let lats = DataService.instance.locations[currentLocationForEditing!].latitudes, let longs = DataService.instance.locations[currentLocationForEditing!].longitudes {
            var text = ""
            for i in 0..<lats.count {
                text += "\(lats[i]), \(longs[i]) \r\n"
            }
            infoLabel.text = text
        }
        
        locationManager = CLLocationManager()
        
        locationManager?.requestWhenInUseAuthorization()
        
        locationManager?.delegate = self
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        locationManager?.startUpdatingLocation()
    }
    
    @IBAction func saveAction(_ sender: UIButton) {
        DataService.instance.locations[currentLocationForEditing!].latitudes?.append(locationManager?.location?.coordinate.latitude)
        DataService.instance.locations[currentLocationForEditing!].longitudes?.append(locationManager?.location?.coordinate.longitude)
        
        var text = ""
        for i in 0..<DataService.instance.locations.count {
            text += "\(lats[i]), \(longs[i]) \r\n"
        }
        infoLabel.text = text
        
    }
    

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        latitudeLabel.text = "\(locations[0].coordinate.latitude)"
        longitudeLabel.text = "\(locations[0].coordinate.longitude)"
    }

}














