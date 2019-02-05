//
//  ListVehiclesPresenter.swift
//  AppParking
//
//  Created by Mateo Gutiérrez Díaz - Ceiba Software on 1/3/19.
//  Copyright © 2019 Mateo Gutiérrez Díaz - Ceiba Software. All rights reserved.
//

import Foundation
import Swinject

class ListVehiclesPresenter {
    
    fileprivate var iListVehicles: IListVehicles
    fileprivate var vehicleAPI: VehicleAPI?
    
    init(_ iListVehicles: IListVehicles) {
        self.iListVehicles = iListVehicles
        self.vehicleAPI = AppDelegate.dependenciesManager.container.resolve(VehicleAPI.self)
    }
    
    func callServiceGetVehicles() {
        vehicleAPI!.getVehicles(iListVehicles)
    }
}
