//
//  AddVehiclePresenter.swift
//  AppParking
//
//  Created by Mateo Gutiérrez Díaz - Ceiba Software on 1/4/19.
//  Copyright © 2019 Mateo Gutiérrez Díaz - Ceiba Software. All rights reserved.
//

import Foundation

class AddVehiclePresenter {
    
    fileprivate var iAddVehicle: IAddVehicle
    fileprivate var vehicleRepository: VehicleRepository
    fileprivate var typeVehicleRepository: TypeVehicleRepository
    
    init(_ iAddVehicle: IAddVehicle) {
        self.iAddVehicle = iAddVehicle
        self.vehicleRepository = VehicleRepository()
        self.typeVehicleRepository = TypeVehicleRepository()
    }
    
    func callServiceAddVehicle(_ vehicle: Vehicle) {
        self.vehicleRepository.callServiceAddVehicle(iAddVehicle, vehicle)
    }
    
    func callServiceTGetTypeVehicles() {
        self.typeVehicleRepository.callServiceGetTypeVehicles(iAddVehicle)
    }
}

