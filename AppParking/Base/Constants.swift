//
//  Constants.swift
//  AppParking
//
//  Created by Mateo Gutiérrez Díaz - Ceiba Software on 1/3/19.
//  Copyright © 2019 Mateo Gutiérrez Díaz - Ceiba Software. All rights reserved.
//

import Foundation
import UIKit


struct Constants {
    
    // URLS
    static let URL_BASE = "http://localhost:8080/"
    
    static let TYPE_VEHICLES_PATH = "typeVehicles/"
    static let LIST_TYPE_VEHICLES_PATH = "all"
    
    static let VEHICLE_PATH = "vehicle/"
    static let GET_VEHICLES_PATH = "allRegisteredVehicles"
    static let REGISTER_VEHICLE_PATH = "register"
    static let DELETE_VEHICLE_PATH = "delete?plate="
    
    // TITLES
    static let LIST_VEHICLES_VIEW_TITLE = "Vehiculos en el parqueadero"
    static let LABEL_HOUR_IN_TITLE = "Hora de ingreso"
    
    // ERRORS
    static let ERROR_COMUNICATION_BACKEND = "Ocurrió un error de comunicación"


}



