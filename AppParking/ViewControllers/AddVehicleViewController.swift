//
//  AddVehicleViewController.swift
//  AppParking
//
//  Created by Mateo Gutiérrez Díaz - Ceiba Software on 1/3/19.
//  Copyright © 2019 Mateo Gutiérrez Díaz - Ceiba Software. All rights reserved.
//

import UIKit

class AddVehicleViewController: BaseViewController, IAddVehicle, UITextFieldDelegate {

    // MARK: IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var pickerVehicleTypes: UIPickerView!
    @IBOutlet weak var plateTextField: UITextField!
    @IBOutlet weak var ownerTextField: UITextField!
    @IBOutlet weak var cylinderTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    // MARK: Variables
    fileprivate var addVehiclePresenter : AddVehiclePresenter!
    var vehicle = Vehicle()
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
        self.plateTextField.delegate = self
        self.ownerTextField.delegate = self
        self.cylinderTextField.delegate = self
        self.plateTextField.placeholder = "Placa (Ejm+ \(Constants.EXAMPLE_PLATE))"
        self.ownerTextField.placeholder = "Dueño"
        self.cylinderTextField.placeholder = "Cilidraje de la moto"
    }
    
    func initializeDelegates() {
        addVehiclePresenter = AddVehiclePresenter(self)
        addVehiclePresenter.callServiceTGetTypeVehicles()
    }
    
    func errorService(_ error: String) {
        let alert = UIAlertController(title: Constants.ALERT_ERROR_TITLE, message: Constants.ERROR_COMUNICATION_BACKEND, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: Constants.ALERT_BUTTON_ACCEPT, style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        cleanFields()
        print(error)
    }
    
    func presentMessage(_ message: String) {
        let alert = UIAlertController(title: Constants.ALERT_WARNING_TITLE, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: Constants.ALERT_BUTTON_ACCEPT, style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        cleanFields()
    }
    
    func showVehicleTypes(_ listVehicleTypes: [TypeVehicle]) {
        self.vehicleTypes = listVehicleTypes
    }
    
    @IBAction func registerVehicle(_ sender: Any) {
        self.vehicle.typeVehicleCode = 1
        self.vehicle.plate = plateTextField.text!
        self.vehicle.owner = ownerTextField.text!
        self.vehicle.cylinder = Int(cylinderTextField.text!)
        self.vehicle.typeVehicleDescription = "Carro"
        
        addVehiclePresenter.callServiceAddVehicle(vehicle)
    }
    
    func cleanFields() {
        self.plateTextField.text = ""
        self.ownerTextField.text = ""
        self.cylinderTextField.text = ""
    }

}
