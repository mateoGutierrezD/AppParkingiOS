//
//  IListVehicles.swift
//  AppParking
//
//  Created by Mateo Gutiérrez Díaz - Ceiba Software on 1/3/19.
//  Copyright © 2019 Mateo Gutiérrez Díaz - Ceiba Software. All rights reserved.
//

import Foundation

protocol IListVehicles {
    func showListVehicles(_ vehiclesList: [Vehicle]!)
    func errorService(_ error: String)
    func presentMessage(_ message: String)
}

