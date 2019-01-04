//
//  ListVehiclesPresenter.swift
//  AppParking
//
//  Created by Mateo Gutiérrez Díaz - Ceiba Software on 1/3/19.
//  Copyright © 2019 Mateo Gutiérrez Díaz - Ceiba Software. All rights reserved.
//

import Foundation

class ListVehiclesPresenter {
    
    fileprivate var iListVehicles: IListVehicles
    fileprivate var vehicleRepository: VehicleRepository
    
    init(_ iListVehicles: IListVehicles) {
        self.iListVehicles = iListVehicles
        self.vehicleRepository = VehicleRepository()
    }
    
    func callServiceGetVehicles() {
        self.vehicleRepository.callServiceGetVehicles(iListVehicles)
    }
}
