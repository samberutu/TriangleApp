//
//  TriangleAppTests.swift
//  TriangleAppTests
//
//  Created by Samlo Berutu on 27/11/21.
//

import XCTest
@testable import TriangleApp

class TriangleAppTests: XCTestCase {
    
    func testInvalidInputSides() {
        XCTAssertThrowsError(try detectTriangle(-1,2,3)) { error in
            XCTAssertEqual(error as? TriangleError, TriangleError.invalidInput)
        }
    }
    func testDetectEquilateralTriangle() {
        XCTAssertEqual(try detectTriangle(1, 2, 2), "Segitiga Sama Kaki")
        XCTAssertEqual(try detectTriangle(1, 1, 2), "Segitiga Sama Kaki")
        XCTAssertEqual(try detectTriangle(1, 2, 1), "Segitiga Sama Kaki")
        XCTAssertEqual(try detectTriangle(1, 2, 2), "Segitiga Sama Kaki")
        XCTAssertEqual(try detectTriangle(2, 1, 2), "Segitiga Sama Kaki")
    }
    
    func testDetectRandomTriangle() {
        XCTAssertEqual(try detectTriangle(1, 6, 4), "Segitiga Sembarang")
    }
    
    func detectTriangle(
        _ sideA: Int,
        _ sideB: Int,
        _ sideC: Int
    ) throws -> String{
        let sides = [sideA, sideB, sideC].sorted();
       
        for side in sides {
          if side < 0 {
            throw TriangleError.invalidInput
          }
        }
       
        if sides[0] == sides[1] && sides[0] == sides[2] {
          return "Segitiga Sama Sisi"
        } else if sides[0] == sides[1] || sides[1] == sides[2] {
          return "Segitiga Sama Kaki"
        } else {
          return "Segitiga Sembarang"
        }
    }
}
enum TriangleError: Error {
    case invalidInput
    case inequalityInput
}
