//
//  TypeVehicle.swift
//  AppParking
//
//  Created by Mateo Gutiérrez Díaz - Ceiba Software on 1/3/19.
//  Copyright © 2019 Mateo Gutiérrez Díaz - Ceiba Software. All rights reserved.
//

import Foundation
import ObjectMapper

class TypeVehicle: NSObject, Mappable {
    var code: String?
    var type: String?
    
    override init(){
        super.init()
    }
    
    convenience required init? (map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        code <- map["code"]
        type <- map["type"]
    }
}
