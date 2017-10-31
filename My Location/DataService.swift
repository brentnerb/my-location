//
//  DataService.swift
//  My Location
//
//  Created by Brent Morgan on 10/30/17.
//  Copyright © 2017 Brent Morgan. All rights reserved.
//

import UIKit

class DataService {
    
    public static let instance = DataService()
    
    private(set) public var locations = [MLLocation]()
    
    func loadLocations() {
        if UserDefaults.standard.object(forKey: "savedLocations") != nil {
            let data = UserDefaults.standard.object(forKey: "savedLocations") as! Data
            locations = NSKeyedUnarchiver.unarchiveObject(with: data) as! [MLLocation]
            
            print("Loaded locations. \(locations)")
        }
    }
    
    func saveLocations() {
//        UserDefaults.standard.set(locations, forKey: "savedLocations")
        let locationData: Data = NSKeyedArchiver.archivedData(withRootObject: locations)
        UserDefaults.standard.set(locationData, forKey: "savedLocations")
//        UserDefaults.synchronize()
        print("Saving locations...\(locations)")
    }
    
    func newLocation(named: String) {
//        let locationToAdd = MLLocation(name: named, latitudes: [], longitudes: [])
        var locationToAdd = MLLocation(name: named, latitudes: [], longitudes: [])
//        locationToAdd.name = named
        locations.append(locationToAdd)
    }
    
//    func newPointAt(_ latitude: Double, _ longitude: Double, location: MLLocation) {
//        location.addLatitude(lat: latitude)
//        location.addLongitude(lon: longitude)
//    }
    
}
