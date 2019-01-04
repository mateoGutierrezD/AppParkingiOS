//
//  Response.swift
//  AppParking
//
//  Created by Mateo Gutiérrez Díaz - Ceiba Software on 1/3/19.
//  Copyright © 2019 Mateo Gutiérrez Díaz - Ceiba Software. All rights reserved.
//

import Foundation
import ObjectMapper

class ResponseObject: NSObject, Mappable  {

    var message: String?
    var data: NSObject?

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

//class ResponseObject<T: Mappable>: Mappable {
//
//    var message: String?
//    var data: T?
//
//    required init?(map: Map){
//
//    }
//
//    func mapping(map: Map) {
//        message <- map["message"]
//        data <- map["data"]
//    }
//}

