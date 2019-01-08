//
//  VehicleCell.swift
//  AppParking
//
//  Created by Mateo Gutiérrez Díaz - Ceiba Software on 1/3/19.
//  Copyright © 2019 Mateo Gutiérrez Díaz - Ceiba Software. All rights reserved.
//

import UIKit

class VehicleCell: UITableViewCell {

    // MARK: IBOutlets
    
    @IBOutlet weak var ownerLabel: UILabel!
    @IBOutlet weak var plateLabel: UILabel!
    @IBOutlet weak var hourInTitleLabel: UILabel!
    @IBOutlet weak var dateInLabel: UILabel!
    @IBOutlet weak var typeVehicleLabel: UILabel!
    
    // MARK: Variables
    var vehicle: Vehicle? {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI() {
        if vehicle != nil {
            self.ownerLabel.text = vehicle!.owner!
            self.plateLabel.text = vehicle!.plate!
            self.dateInLabel.text = vehicle!.dateIn!
            self.typeVehicleLabel.text = vehicle!.typeVehicleDescription!
            self.hourInTitleLabel.text = Constants.LABEL_HOUR_IN_TITLE
        }
    }
}
