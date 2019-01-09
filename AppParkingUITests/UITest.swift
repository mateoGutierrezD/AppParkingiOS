//
//  RegisterVehicleSucessfullyTest.swift
//  AppParkingUITests
//
//  Created by Mateo Gutiérrez Díaz - Ceiba Software on 1/8/19.
//  Copyright © 2019 Mateo Gutiérrez Díaz - Ceiba Software. All rights reserved.
//

import XCTest

class UITest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        XCUIApplication().terminate()
    }

    func testRegisterVehicleSucessfully() {
        let app = XCUIApplication()
        app.tabBars.buttons["Registrar"].tap()
        
        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 1).children(matching: .other).element.tap()
        app.tables.staticTexts["Carro"].tap()
       
        let plateTextfield = app.textFields["Placa (Ejm+ ITZ 678)"]
        plateTextfield.tap()
        plateTextfield.typeText(PLATE_TO_TEST)
        
        let ownerTextfield = app.textFields["Dueño"]
        ownerTextfield.tap()
        ownerTextfield.typeText(OWNER_TO_REGISTER)
        
        app.buttons["Continuar"].tap()
        app.buttons["Registrar vehículo"].tap()
        
        let alert = app.alerts["Alerta!"]
        XCTAssertTrue(alert.staticTexts["Vehículo registrado!"].exists)
        app.buttons["Aceptar"].tap()
    }
    
    func testRegisterVehicleFailedBecauseIsAlreadyInParking() {
        let app = XCUIApplication()
        app.tabBars.buttons["Registrar"].tap()
        
        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 1).children(matching: .other).element.tap()
        app.tables.staticTexts["Carro"].tap()
        
        let plateTextfield = app.textFields["Placa (Ejm+ ITZ 678)"]
        plateTextfield.tap()
        plateTextfield.typeText(PLATE_TO_TEST)
        
        let ownerTextfield = app.textFields["Dueño"]
        ownerTextfield.tap()
        ownerTextfield.typeText(OWNER_TO_REGISTER)
        
        app.buttons["Continuar"].tap()
        app.buttons["Registrar vehículo"].tap()
        
        let alert = app.alerts["Alerta!"]
        XCTAssertTrue(alert.staticTexts["Este vehículo ya está en el parqueadero"].exists)
        app.buttons["Aceptar"].tap()
    }
    
    func testRegisterVehicleFailedBecauseOnlyCanParkOnMondaysAndSundays() {
        let app = XCUIApplication()
        app.tabBars.buttons["Registrar"].tap()
        
        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 1).children(matching: .other).element.tap()
        app.tables.staticTexts["Carro"].tap()
        
        let plateTextfield = app.textFields["Placa (Ejm+ ITZ 678)"]
        plateTextfield.tap()
        plateTextfield.typeText(PLATE_ONLY_MONDAYS_AND_SUNDAYS)
        
        let ownerTextfield = app.textFields["Dueño"]
        ownerTextfield.tap()
        ownerTextfield.typeText(OWNER_TO_REGISTER)
        
        app.buttons["Continuar"].tap()
        app.buttons["Registrar vehículo"].tap()
        
        let alert = app.alerts["Alerta!"]
        XCTAssertTrue(alert.staticTexts["Este vehículo no está autorizado para ingresar; sólo puede hacerlo los días domingo y lunes"].exists)
        app.buttons["Aceptar"].tap()
    }
    
    func testShouldListVehicleInParking() {
        let app = XCUIApplication()
        app.tabBars.buttons["Vehículos"].tap()
        
        XCTAssertTrue(app.staticTexts["Vehiculos en el parqueadero"].exists)
        XCTAssertTrue(app.tables.cells.count >= 1)
    }
    
    func testDeleteVehicleFailedBecauseItIsNotInParking() {
        let app = XCUIApplication()
        app.tabBars.buttons["Eliminar"].tap()
        
        let plateTextfield = app.textFields["Placa (Ejm+ ITZ 678)"]
        plateTextfield.tap()
        plateTextfield.typeText(PLATE_NON_EXIST)
        
        app.buttons["Continuar"].tap()
        app.buttons["Eliminar vehículo"].tap()
        
        let alert = app.alerts["Alerta!"]
        XCTAssertTrue(alert.staticTexts["Este vehículo no está en el parqueadero"].exists)
        app.buttons["Aceptar"].tap()
    }
    
    func testDeleteVehicleSucessfully() {
        let app = XCUIApplication()
        app.tabBars.buttons["Eliminar"].tap()
        
        let plateTextfield = app.textFields["Placa (Ejm+ ITZ 678)"]
        plateTextfield.tap()
        plateTextfield.typeText(PLATE_TO_TEST)
        
        app.buttons["Continuar"].tap()
        app.buttons["Eliminar vehículo"].tap()
        
        let alert = app.alerts["Alerta!"]
        XCTAssertTrue(alert.staticTexts.element.exists)
        app.buttons["Aceptar"].tap()
    }

}
