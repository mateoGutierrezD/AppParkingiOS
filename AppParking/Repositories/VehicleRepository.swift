//
//  VehicleRepository.swift
//  AppParking
//
//  Created by Mateo Gutiérrez Díaz - Ceiba Software on 1/3/19.
//  Copyright © 2019 Mateo Gutiérrez Díaz - Ceiba Software. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

class VehicleRepository {
    
    func callServiceGetVehicles(_ iListVehicles: IListVehicles) {
        Alamofire.request(Constants.URL_BASE + Constants.VEHICLE_PATH + Constants.GET_VEHICLES_PATH, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseObject(completionHandler: { (response: DataResponse<ResponseVehicles>) in
            
            switch response.result {
            case .success:
                if (response.result.value?.data != nil) {
                    iListVehicles.showListVehicles(response.result.value?.data!)
                } else {
                    iListVehicles.presentMessage((response.result.value?.message!)!)
                }
            case .failure(let error):
                iListVehicles.errorService(error.localizedDescription)
            }
        })
    }
    
    func callServiceAddVehicle(_ iAddVehicle: IAddVehicle, _ vehicle: Vehicle) {
        let arrayparametros: [String: Any] = [
            "typeVehicleCode" : vehicle.typeVehicleCode!,
            "plate" : vehicle.plate!,
            "owner" : vehicle.owner!,
            "cylinder" : vehicle.cylinder!,
            "typeVehicleDescription" : vehicle.typeVehicleDescription!
        ]
        
        Alamofire.request(Constants.URL_BASE + Constants.VEHICLE_PATH + Constants.REGISTER_VEHICLE_PATH, method: .post, parameters: arrayparametros, encoding: JSONEncoding.default, headers: nil).responseObject(completionHandler: { (response:
                DataResponse<ResponseObject>) in
            
            switch response.result {
            case .success:
                iAddVehicle.presentMessage((response.result.value?.message)!)
            case .failure(let error):
                iAddVehicle.errorService(error.localizedDescription)
            }
        })
    }
    
    func callServiceDeleteVehicle(_ iDeleteVehicle: IDeleteVehicle, _ plate: String) {
        Alamofire.request(Constants.URL_BASE + Constants.VEHICLE_PATH + Constants.DELETE_VEHICLE_PATH + plate, method: .delete, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseObject(completionHandler: { (response:
            DataResponse<ResponseObject>) in
            switch response.result {
            case .success:
                if  response.result.value?.data != nil {
                    iDeleteVehicle.presentPayment(((response.result.value?.message)!), response.result.value?.data as! Int)
                } else {
                    iDeleteVehicle.presentMessage(((response.result.value?.message)!))
                }
            case .failure(let error):
                iDeleteVehicle.errorService(error.localizedDescription)
            }
        })
    }
}
