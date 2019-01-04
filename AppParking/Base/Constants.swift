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
    
    // LABELS
    static let LIST_VEHICLES_VIEW_TITLE = "Vehiculos en el parqueadero"
    static let DELETE_VEHICLE_VIEW_TITLE = "Elimina un vehículo"
    static let LABEL_HOUR_IN_TITLE = "Hora de ingreso"
    static let DELETE_VEHICLE_VIEW_DESCRIPTION = "Para cobrar la salida un vehículo, debes ingresar la placa:"
    static let EXAMPLE_PLATE = "ITZ 678"
    
    // ALERTS
    static let ALERT_ERROR_TITLE = "Error!"
    static let ALERT_WARNING_TITLE = "Alerta!"
    static let ALERT_SUCCESSFUL_ACTION_TITLE = "Enhorabuena!"
    static let ALERT_BUTTON_ACCEPT = "Aceptar"
    static let ERROR_COMUNICATION_BACKEND = "Ocurrió un error de comunicación"
    static let EMPTY_FIELD_ALERT = "Ups!, debes llenar todos los campos."
    static let PARKING_EMPTY = "No hay vehículos en el parqueadero"

    
    
    // BUTTONS
    static let BUTTON_DELETE_VIEW_TITLE = "Eliminar vehículo"


}



