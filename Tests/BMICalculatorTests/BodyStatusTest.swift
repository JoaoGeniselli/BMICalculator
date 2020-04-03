//
//  BodyStatusTest.swift
//  BMICalculatorTests
//
//  Created by João Geniselli on 02/04/20.
//

import XCTest
@testable import BMICalculator


class BodyStatusTest: XCTestCase {

    func testRanges() {
        XCTAssertEqual(.underweight, BodyStatus.by(bmi: 0.00))
        XCTAssertEqual(.underweight, BodyStatus.by(bmi: 18.49))
        XCTAssertEqual(.normal, BodyStatus.by(bmi: 18.50))
        XCTAssertEqual(.normal, BodyStatus.by(bmi: 24.99))
        XCTAssertEqual(.overweight, BodyStatus.by(bmi: 25.00))
        XCTAssertEqual(.overweight, BodyStatus.by(bmi: 29.99))
        XCTAssertEqual(.obeseI, BodyStatus.by(bmi: 30.00))
        XCTAssertEqual(.obeseI, BodyStatus.by(bmi: 34.99))
        XCTAssertEqual(.obeseII, BodyStatus.by(bmi: 35.00))
        XCTAssertEqual(.obeseII, BodyStatus.by(bmi: 39.99))
        XCTAssertEqual(.obeseIII, BodyStatus.by(bmi: 40.00))
        XCTAssertEqual(.obeseIII, BodyStatus.by(bmi: 90.0))
        XCTAssertEqual(.unknown, BodyStatus.by(bmi: -1.0))
    }

}
