//
//  Response.swift
//  AppParking
//
//  Created by Mateo Gutiérrez Díaz - Ceiba Software on 1/3/19.
//  Copyright © 2019 Mateo Gutiérrez Díaz - Ceiba Software. All rights reserved.
//

import Foundation
import ObjectMapper

class ResponseVehicles: NSObject, Mappable  {

    var message: String?
    var data: [Vehicle]?

    override init() {
        super.init()
    }

    convenience required init?(map: Map) {
        self.init()
    }

    func mapping(map: Map) {
        message <- map["message"]
        data <- map["data"]
    }
}


