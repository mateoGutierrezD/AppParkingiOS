//
//  AddVehicleViewController.swift
//  AppParking
//
//  Created by Mateo Gutiérrez Díaz - Ceiba Software on 1/3/19.
//  Copyright © 2019 Mateo Gutiérrez Díaz - Ceiba Software. All rights reserved.
//

import UIKit

class AddVehicleViewController: UIViewController, IAddVehicle {

    // MARK: IBOutlets
    
    // MARK: Variables
    fileprivate var addVehiclePresenter : AddVehiclePresenter!
    var vehicle: Vehicle?
    var vehicleTypes: [TypeVehicle]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        initializeDelegates()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        initializeDelegates()
    }
    
    func setUpView() {
        
    }
    
    func initializeDelegates() {
        addVehiclePresenter = AddVehiclePresenter(self)
        addVehiclePresenter.callServiceTGetTypeVehicles()
    }
    
    func errorService(_ error: String) {
        print(error)
    }
    
    func presentMessage(_ message: String) {
        print(message)
    }
    
    func showVehicleTypes(_ listVehicleTypes: [TypeVehicle]) {
        self.vehicleTypes = listVehicleTypes
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
