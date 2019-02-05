//
//  DependenciesManager.swift
//  AppParking
//
//  Created by Mateo Gutiérrez Díaz - Ceiba Software on 2/5/19.
//  Copyright © 2019 Mateo Gutiérrez Díaz - Ceiba Software. All rights reserved.
//

import Foundation
import Swinject

class DependenciesManager {
    
    let container = Container()
    
    func injectDependences() {
        container.register(IRepositoryTypeVehicles.self) { _ in TypeVehicleAPI() }
        container.register(IRepositoryVehicle.self) { _ in VehicleAPI() }
    }
}
