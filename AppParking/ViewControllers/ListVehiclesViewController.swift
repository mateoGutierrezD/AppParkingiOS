//
//  ListVehiclesViewController.swift
//  AppParking
//
//  Created by Mateo Gutiérrez Díaz - Ceiba Software on 1/3/19.
//  Copyright © 2019 Mateo Gutiérrez Díaz - Ceiba Software. All rights reserved.
//

import UIKit

class ListVehiclesViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource, IListVehicles {
    
    // MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleViewLabel: UILabel!
    
    // MARK: Variables
    fileprivate var listVehiclesPresenter : ListVehiclesPresenter!
    var vehiclesList: [Vehicle]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        initializeDelegates()
    }
    
    func initializeDelegates() {
        listVehiclesPresenter = ListVehiclesPresenter(self)
        listVehiclesPresenter.callServiceGetVehicles()
    }
    
    func setUpView() {
        self.titleViewLabel.text = Constants.LIST_VEHICLES_VIEW_TITLE;
    }
    
    func showListVehicles(_ vehiclesList: [Vehicle]!) {
        self.vehiclesList = vehiclesList
        self.tableView.reloadData()
    }
    
    func errorService(_ error: String) {
        print(error)
    }
    
    func presentMessage(_ message: String) {
        print(message)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (vehiclesList != nil) {
            return vehiclesList!.count
        } else {
            return 0
        }
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VehicleCell") as! VehicleCell
        
        cell.vehicle = self.vehiclesList?[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
