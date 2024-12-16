//
//  UnitandUITestingTests.swift
//  UnitandUITestingTests
//
//  Created by FCI on 04/12/24.
//

import XCTest
@testable import UnitandUITesting

final class UnitandUITestingTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    // testing functions
    func testString() {
        let v1 = ViewController()
        XCTAssert(v1.isStringLong(mystring: "welcome"))
    }
    func testAddTwoNumbers() {
        let v2 = ViewController()
        let addvalue = 20
        let resultvalue = v2.isAddingTwoNumbers()
        XCTAssertEqual(addvalue, resultvalue)
    }
    func testComparingTwoStrings() {
        let v3 = ViewController()
        XCTAssertTrue(v3.ComparingTwoStrings())
    }

}
