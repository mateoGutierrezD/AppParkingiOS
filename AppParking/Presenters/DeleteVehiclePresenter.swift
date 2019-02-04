//
//  DeleteVehiclePresenter.swift
//  AppParking
//
//  Created by Mateo Gutiérrez Díaz - Ceiba Software on 1/4/19.
//  Copyright © 2019 Mateo Gutiérrez Díaz - Ceiba Software. All rights reserved.
//

import Foundation

class DeleteVehiclePresenter {
    
    fileprivate var iDeleteVehicle: IDeleteVehicle
    fileprivate var vehicleRepository: VehicleRepository
    
    init(_ iDeleteVehicle: IDeleteVehicle) {
        self.iDeleteVehicle = iDeleteVehicle
        self.vehicleRepository = VehicleRepository()
    }
    
    func callServiceDeleteVehicle(_ string: String) {
        let plate = string.replacingOccurrences(of: " ", with: "").uppercased() 
        self.vehicleRepository.callServiceDeleteVehicle(iDeleteVehicle, plate)
    }
}
