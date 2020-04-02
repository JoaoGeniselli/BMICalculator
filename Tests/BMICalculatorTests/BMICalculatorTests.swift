import XCTest
@testable import BMICalculator

final class BMICalculatorTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(BMICalculator().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
