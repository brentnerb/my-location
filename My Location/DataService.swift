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
        guard let savedLocations = (UserDefaults.standard.array(forKey: "savedLocations") as? [MLLocation]) else { return }
        locations = savedLocations
    }
    
    func saveLocations() {
        UserDefaults.standard.set(locations, forKey: "savedLocations")
        print("Saving locations...")
    }
    
    func newLocation(named: String) {
        let locationToAdd = MLLocation(name: named, latitudes: nil, longitudes: nil)
        locations.append(locationToAdd)
    }
    
}
