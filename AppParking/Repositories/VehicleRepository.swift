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
        Alamofire.request(Constants.URL_BASE + Constants.VEHICLE_PATH + Constants.GET_VEHICLES_PATH, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseObject(completionHandler: { (response: DataResponse<ResponseObject>) in
            
            switch response.result {
            case .success:
                iListVehicles.showListVehicles(response.result.value?.data! as! [Vehicle]!)
            case .failure(let error):
                iListVehicles.errorService(error.localizedDescription)
            }
        })
    }
}
