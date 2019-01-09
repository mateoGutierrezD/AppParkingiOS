//
//  AddVehicleViewController.swift
//  AppParking
//
//  Created by Mateo Gutiérrez Díaz - Ceiba Software on 1/3/19.
//  Copyright © 2019 Mateo Gutiérrez Díaz - Ceiba Software. All rights reserved.
//

import UIKit
import DropDown

class AddVehicleViewController: BaseViewController, IAddVehicle, UITextFieldDelegate {

    // MARK: IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var typeView: UIView!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var plateTextField: UITextField!
    @IBOutlet weak var ownerTextField: UITextField!
    @IBOutlet weak var cylinderTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var cylinderView: UIView!
    
    // MARK: Variables
    fileprivate var addVehiclePresenter : AddVehiclePresenter!
    var vehicle = Vehicle()
    var vehicleTypes: [TypeVehicle]?
    let dropDown = DropDown()
    
    var codeType: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        initializeDelegates()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        initializeDelegates()
        cleanFields()
    }
    
    func setUpView() {
        self.plateTextField.delegate = self
        self.ownerTextField.delegate = self
        self.cylinderTextField.delegate = self
        self.plateTextField.placeholder = Constants.PLATE_PLACEHOLDER
        self.ownerTextField.placeholder = Constants.OWNER_PLACEHOLDER
        self.cylinderTextField.placeholder = Constants.CYLINDER_PLACEHOLDER
        self.cylinderTextField.text = Constants.DEFAULT_CYLINDER_VALUE
        viewDecoration(1, typeView, "#C3C8D1")
        initializeGestures()
    }
    
    func initializeDelegates() {
        addVehiclePresenter = AddVehiclePresenter(self)
        addVehiclePresenter.callServiceTGetTypeVehicles()
    }
    
    func initializeGestures() {
        typeView.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(openTypeVehiclesOptions)))
    }
    
    func showVehicleTypes(_ listVehicleTypes: [TypeVehicle]) {
        self.vehicleTypes = listVehicleTypes
    }
    
    @objc func openTypeVehiclesOptions(_ sender: UITapGestureRecognizer) {
        var typeVehiclesDescription = [String]()
        var typeVehicleCode = [String]()
        for item in self.vehicleTypes! {
            typeVehicleCode.append(item.code!)
            typeVehiclesDescription.append(item.type!)
        }
        
        dropDown.dataSource = typeVehiclesDescription
        dropDown.anchorView = typeView
        dropDown.selectionBackgroundColor = .blue
        dropDown.show()
        dropDown.selectionAction = { [weak self] (index, item) in
            self?.typeLabel.text = item
            self?.typeLabel.textColor = .black
            self?.codeType = typeVehicleCode[index]
            self?.validateTypeVehicleToSelectCylinder(item)
        }
    }
    
    func validateTypeVehicleToSelectCylinder(_ item: String?) {
        if item == "Carro" {
            self.cylinderView.isHidden = true
            self.cylinderTextField.text = Constants.DEFAULT_CYLINDER_VALUE
        } else {
            self.cylinderView.isHidden = false
            self.cylinderTextField.text = ""
            self.cylinderTextField.placeholder = Constants.CYLINDER_PLACEHOLDER
        }
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
    
    @IBAction func registerVehicle(_ sender: Any) {
        if fieldsAreNotEmpty() {
            self.vehicle.typeVehicleCode = Int(self.codeType!)
            self.vehicle.plate = plateTextField.text!.replacingOccurrences(of: " ", with: "").uppercased()
            self.vehicle.owner = ownerTextField.text!
            self.vehicle.cylinder = Int(cylinderTextField.text!)
            self.vehicle.typeVehicleDescription = self.typeLabel.text!
            addVehiclePresenter.callServiceAddVehicle(vehicle)
        }
    }
    
    func fieldsAreNotEmpty() -> Bool {
        if self.typeLabel.text == "" || self.plateTextField.text == "" || self.ownerTextField.text == "" || self.cylinderTextField.text == "" {
            AlertForEmptyField()
            return false
        } else {
            return true
        }
    }
    
    func cleanFields() {
        self.plateTextField.text = ""
        self.ownerTextField.text = ""
        self.typeLabel.text = ""
        if self.cylinderTextField.text == Constants.DEFAULT_CYLINDER_VALUE{
            self.cylinderTextField.text = ""
        }
        self.cylinderView.isHidden = true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = plateTextField.text else { return true }
        let count = text.count + string.count - range.length
        return count <= Constants.PLATE_CHARACTERS_RANGE
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
