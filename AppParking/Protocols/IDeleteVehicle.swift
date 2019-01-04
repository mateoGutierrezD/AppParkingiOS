//
//  IDeleteVehicle.swift
//  AppParking
//
//  Created by Mateo Gutiérrez Díaz - Ceiba Software on 1/4/19.
//  Copyright © 2019 Mateo Gutiérrez Díaz - Ceiba Software. All rights reserved.
//

import Foundation

protocol IDeleteVehicle {
    func errorService(_ error: String)
    func presentMessage(_ message: String)
    func presentPayment(_ message: String, _ valueToPay: Int)
}
