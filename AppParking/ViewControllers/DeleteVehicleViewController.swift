//
//  DeleteVehicleViewController.swift
//  AppParking
//
//  Created by Mateo Gutiérrez Díaz - Ceiba Software on 1/3/19.
//  Copyright © 2019 Mateo Gutiérrez Díaz - Ceiba Software. All rights reserved.
//

import UIKit

class DeleteVehicleViewController: BaseViewController, UITextFieldDelegate, IDeleteVehicle {

    // MARK: IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var plateTextField: UITextField!
    @IBOutlet weak var deleteButton: UIButton!
    
    // MARK: Variables
    fileprivate var deleteVehiclePresenter : DeleteVehiclePresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        initializeDelegates()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        initializeDelegates()
    }
    
    func setUpView() {
        self.titleLabel.text = Constants.DELETE_VEHICLE_VIEW_TITLE
        self.descriptionLabel.text = Constants.DELETE_VEHICLE_VIEW_DESCRIPTION
        self.plateTextField.placeholder = Constants.EXAMPLE_PLATE
        self.plateTextField.delegate = self
        self.deleteButton.titleLabel?.text = Constants.BUTTON_DELETE_VIEW_TITLE
    }
    
    func initializeDelegates() {
        deleteVehiclePresenter = DeleteVehiclePresenter(self)
    }
    
    func errorService(_ error: String) {
        let alert = UIAlertController(title: Constants.ALERT_ERROR_TITLE, message: Constants.ERROR_COMUNICATION_BACKEND, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: Constants.ALERT_BUTTON_ACCEPT, style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        print(error)
    }
    
    func presentMessage(_ message: String) {
        let alert = UIAlertController(title: Constants.ALERT_WARNING_TITLE, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: Constants.ALERT_BUTTON_ACCEPT, style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func deleteVehicle(_ sender: Any) {
        let plate = self.plateTextField.text
        if fieldIsNotEmpty(plate!){
            self.deleteVehiclePresenter.callServiceDeleteVehicle(plate!)
        } else {
            
        }
    }
    
    func presentAlertForEmptyField() {
        let alert = UIAlertController(title: Constants.ALERT_WARNING_TITLE, message: Constants.EMPTY_FIELD_ALERT, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: Constants.ALERT_BUTTON_ACCEPT, style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func fieldIsNotEmpty(_ textfield: String) -> Bool {
        if textfield.count > 0 {
             return true;
        } else {
            return false
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        let count = text.count + string.count - range.length
        return count <= 7
    }
}
