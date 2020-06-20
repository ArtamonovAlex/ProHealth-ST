//
//  ProHealthUITests.swift
//  ProHealthUITests
//
//  Created by Aleksandr Artamonov on 20.06.2020.
//  Copyright © 2020 Aleksandr Artamonov. All rights reserved.
//

import XCTest

class ProHealthUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCreatingOrder() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        let elementsQuery = app.scrollViews.otherElements
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        XCUIApplication().tabBars.buttons["Заказ лекарств"].tap()
        
        app.buttons["bag"].tap()
        XCTAssertFalse(app.buttons["Оформить заказ"].isEnabled)
        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element(boundBy: 0).swipeDown()
        app.staticTexts["Бепантен"].tap()
        
        app.buttons["Добавить в корзину"].tap()
        app.buttons["Добавить в корзину"].tap()
        app.buttons["Добавить в корзину"].tap()
        app.buttons["Добавить в корзину"].tap()
        

        elementsQuery.images["bepanten"].swipeDown()
        
        app.staticTexts["Афобазол"].tap()
        app.buttons["Добавить в корзину"].tap()
        elementsQuery.images["afobazol"].swipeDown()
        
        app.buttons["bag"].tap()
        
        
        XCTAssertTrue(app.staticTexts["Бепантен"].exists)
        XCTAssertTrue(elementsQuery.staticTexts["4"].exists)
        
        elementsQuery.buttons.element(boundBy: 1).tap()
        elementsQuery.buttons.element(boundBy: 1).tap()
        XCTAssertTrue(elementsQuery.staticTexts["6"].exists)
        
        XCTAssertTrue(elementsQuery.staticTexts["Афобазол"].exists)
        elementsQuery.buttons.element(boundBy: 2).tap()
        XCTAssertFalse(elementsQuery.staticTexts["Афобазол"].exists)

        XCTAssertTrue(app.buttons["Оформить заказ"].isEnabled)
        elementsQuery.buttons["Оформить заказ"].tap()
        app.tabBars.buttons["Главная"].tap()
        XCTAssertTrue(elementsQuery.scrollViews.otherElements.buttons.element.label.hasPrefix("Заказ"))
        XCTAssertTrue(elementsQuery.scrollViews.otherElements.buttons.element.label.hasSuffix("Бепантен x6"))
    }
    
    func testAppointmentCreation() throws {
       let app = XCUIApplication()
        app.launch()
        app.tabBars.buttons["Запись на приём"].tap()
        app.tables/*@START_MENU_TOKEN@*/.scrollViews/*[[".cells.scrollViews",".scrollViews"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.otherElements.buttons["Петр Трифонов"].tap()
        
        let elementsQuery = app.scrollViews.otherElements
        elementsQuery.buttons["22.06"].tap()
        elementsQuery.buttons["10:00"].tap()
        
        elementsQuery.buttons["Записаться на прием"].tap()
        app.tables/*@START_MENU_TOKEN@*/.scrollViews/*[[".cells.scrollViews",".scrollViews"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.otherElements.buttons["Александр Павлов"].tap()
        elementsQuery.buttons["25.06"].tap()
        elementsQuery.buttons["15:00"].tap()
        elementsQuery.buttons["Записаться на прием"].tap()
        
        app.tabBars.buttons["Главная"].tap()
        
        let elementsQuery1 = app.scrollViews.otherElements.scrollViews.otherElements
        XCTAssertTrue(elementsQuery1.staticTexts["10:00 пн, 22 июня"].exists)
        XCTAssertTrue(elementsQuery1.staticTexts["15:00 чт, 25 июня"].exists)
        XCTAssertTrue(elementsQuery1.staticTexts["Петр Трифонов"].exists)
        XCTAssertTrue(elementsQuery1.staticTexts["Александр Павлов"].exists)
    }
    
    func testActiveAppointmentButton() throws {
        let app = XCUIApplication()
        app.launch()
        app.tabBars.buttons["Запись на приём"].tap()

        let elementsQuery = app.tables/*@START_MENU_TOKEN@*/.scrollViews/*[[".cells.scrollViews",".scrollViews"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.otherElements
        elementsQuery.buttons["Петр Трифонов"].tap()
        
        let elementsQuery2 = app.scrollViews.otherElements

        XCTAssertFalse(elementsQuery2.buttons["Записаться на прием"].isEnabled)

        elementsQuery2.buttons["21.06"].tap()
        XCTAssertFalse(elementsQuery2.buttons["Записаться на прием"].isEnabled)

        elementsQuery2.buttons["16:00"].tap()

        XCTAssertTrue(elementsQuery2.buttons["Записаться на прием"].isEnabled)
        app.navigationBars.buttons["Запись на приём"].tap()

        elementsQuery.buttons["Анна Трифонова"].tap()
        elementsQuery2.buttons["27.06"].tap()
        XCTAssertFalse(elementsQuery2.buttons["Записаться на прием"].isEnabled)
        
        elementsQuery2.buttons["10:00"].tap()
        XCTAssertTrue(elementsQuery2.buttons["Записаться на прием"].isEnabled)
        
        XCUIApplication().scrollViews.otherElements.buttons["28.06"].tap()
        XCTAssertFalse(elementsQuery2.buttons["Записаться на прием"].isEnabled)
    }
    
}
