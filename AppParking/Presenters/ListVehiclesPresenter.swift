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
    var vehicleAPI: VehicleAPI?
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    init(_ iListVehicles: IListVehicles) {
        self.iListVehicles = iListVehicles
    }
    
    func resolveDependencies() {
        self.vehicleAPI = delegate.container.resolve(IRepositoryVehicle.self) as! VehicleAPI
    }
    
    func callServiceGetVehicles() {
        self.vehicleAPI!.getVehicles(iListVehicles)
    }
    
    
}
