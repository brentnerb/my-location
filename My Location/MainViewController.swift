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
        
        locationManager = CLLocationManager()
        
        locationManager?.requestWhenInUseAuthorization()
        
        locationManager?.delegate = self
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        locationManager?.startUpdatingLocation()
        
//        if currentLocationForEditing != nil {
//            var location = DataService.instance.locations[currentLocationForEditing!]
//            currentlyModifyingLabel.text = location.name
//            infoLabel.text = location.showSavedDataPoints()
//        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateLabel()
    }
    
    @IBAction func saveAction(_ sender: UIButton) {
        
        var location = DataService.instance.locations[currentLocationForEditing!] as MLLocation
        location.addLatitude(lat: (locationManager?.location?.coordinate.latitude)!)
        location.addLongitude(lon: (locationManager?.location?.coordinate.longitude)!)
        
        updateLabel()
        
    }
    
    func updateLabel() {
        if currentLocationForEditing != nil {
            var location = DataService.instance.locations[currentLocationForEditing!]
            currentlyModifyingLabel.text = location.name
            infoLabel.text = location.showSavedDataPoints()
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        latitudeLabel.text = "\(locations[0].coordinate.latitude)"
        longitudeLabel.text = "\(locations[0].coordinate.longitude)"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ChooserTableViewController {
            vc.mainVC = self
        }
    }

}














