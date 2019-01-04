//
//  TypeVehicleRepository.swift
//  AppParking
//
//  Created by Mateo Gutiérrez Díaz - Ceiba Software on 1/3/19.
//  Copyright © 2019 Mateo Gutiérrez Díaz - Ceiba Software. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

class TypeVehicleRepository {
    
    func callServiceGetTypeVehicles(_ iAddVehicle: IAddVehicle) {
        Alamofire.request(Constants.URL_BASE + Constants.VEHICLE_PATH + Constants.GET_VEHICLES_PATH, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseObject(completionHandler: { (response: DataResponse<ResponseTypeVehicles>) in
            
            switch response.result {
            case .success:
                if (response.result.value?.data != nil) {
                    iAddVehicle.showVehicleTypes((response.result.value?.data!)!)
                } else {
                    iAddVehicle.presentMessage((response.result.value?.message!)!)
                }
            case .failure(let error):
                iAddVehicle.errorService(error.localizedDescription)
            }
        })
    }
}
