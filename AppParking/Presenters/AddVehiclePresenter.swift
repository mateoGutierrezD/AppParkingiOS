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
    fileprivate var vehicleAPI: VehicleAPI
    fileprivate var typeVehicleAPI: TypeVehicleAPI
    
    init(_ iAddVehicle: IAddVehicle) {
        self.iAddVehicle = iAddVehicle
        self.vehicleAPI = VehicleAPI()
        self.typeVehicleAPI = TypeVehicleAPI()
    }
    
    func callServiceAddVehicle(_ vehicle: Vehicle) {
        self.vehicleAPI.addVehicle(iAddVehicle, vehicle)
    }
    
    func callServiceTGetTypeVehicles() {
        self.typeVehicleAPI.getTypeVehicles(iAddVehicle)
    }
}

