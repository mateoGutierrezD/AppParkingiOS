//
//  IRepository.swift
//  AppParking
//
//  Created by Mateo Gutiérrez Díaz - Ceiba Software on 2/4/19.
//  Copyright © 2019 Mateo Gutiérrez Díaz - Ceiba Software. All rights reserved.
//

import Foundation

protocol IRepositoryVehicle {
    func getVehicles(_ iListVehicles: IListVehicles)
    func addVehicle(_ iAddVehicle: IAddVehicle, _ vehicle: Vehicle)
    func deleteVehicle(_ iDeleteVehicle: IDeleteVehicle, _ plate: String)
}
