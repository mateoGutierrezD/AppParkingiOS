//
//  Vehicle.swift
//  AppParking
//
//  Created by Mateo Gutiérrez Díaz - Ceiba Software on 1/3/19.
//  Copyright © 2019 Mateo Gutiérrez Díaz - Ceiba Software. All rights reserved.
//

import Foundation
import ObjectMapper

class Vehicle: NSObject, Mappable {
    var typeVehicleCode: Int?
    var plate: String?
    var owner: String?
    var cylinder: Int?
    var dateIn: String?
    var typeVehicleDescription: String?
    
    override init(){
        super.init()
    }
    
    convenience required init? (map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        typeVehicleCode <- map["typeVehicleCode"]
        plate <- map["plate"]
        owner <- map["owner"]
        cylinder <- map["cylinder"]
        dateIn <- map["dateIn"]
        typeVehicleDescription <- map["type"]
    }
}
