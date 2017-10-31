//
//  MLLocation.swift
//  My Location
//
//  Created by Brent Morgan on 10/30/17.
//  Copyright © 2017 Brent Morgan. All rights reserved.
//

import Foundation

class MLLocation: NSObject, NSCoding {

    var name = ""
    var latitudes = [Double]()
    var longitudes = [Double]()
    
    func addLatitude(lat: Double) {
        latitudes.append(lat)
        print("New latitude: \(lat)")
    }
    
    func addLongitude(lon: Double) {
        longitudes.append(lon)
        print("New longitude: \(lon)")
        print(showSavedDataPoints())

    }
    
    func showSavedDataPoints() -> String? {
        var text = ""
        for i in 0..<latitudes.count {
            text += "[\(latitudes[i]), \(longitudes[i])], "
        }
        return text
    }
    
    init(name: String, latitudes: [Double], longitudes: [Double]) {
        self.name = name
        self.latitudes = latitudes
        self.longitudes = longitudes
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(latitudes, forKey: "latitudes")
        aCoder.encode(longitudes, forKey: "longitudes")
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObject(forKey: "name") as! String
        let latitudes = aDecoder.decodeObject(forKey: "latitudes") as! [Double]
        let longitudes = aDecoder.decodeObject(forKey: "longitudes") as! [Double]
        self.init(name: name, latitudes: latitudes, longitudes: longitudes)
    }
}














