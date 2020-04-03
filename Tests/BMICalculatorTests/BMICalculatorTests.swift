import XCTest
@testable import BMICalculator

final class BMICalculatorTests: XCTestCase {
    
    /*
     
     abaixo do peso
     normal
     sobrepeso
     obeso 1
     obeso 2
     obeso 3
     peso inválido
     altura inválida
     
     */
    
    var calculator: BMICalculator!
    
    override func setUp() {
        calculator = BMICalculator()
    }
    
    func testInvalidWeight() {
        let expectedError = Result.error(reason: .invalidMetrics)
        let result1 = calculator.calculate(forWeightInKg: -1.0, andHeighInMeters: 1.75)
        let result2 = calculator.calculate(forWeightInKg: 500.1, andHeighInMeters: 1.75)

        XCTAssertEqual(expectedError, result1)
        XCTAssertEqual(expectedError, result2)
    }
    
    func testInvalidHeight() {
        let expectedError = Result.error(reason: .invalidMetrics)
        let result1 = calculator.calculate(forWeightInKg: 75.0, andHeighInMeters: -1.0)
        let result2 = calculator.calculate(forWeightInKg: 75.0, andHeighInMeters: 3.1)
        
        XCTAssertEqual(expectedError, result1)
        XCTAssertEqual(expectedError, result2)
    }
    
    func testUnderweight() {
        let result = calculator.calculate(forWeightInKg: 50.0, andHeighInMeters: 1.75)
        assertSuccess(result, 16.33, .underweight)
    }
    
    func assertSuccess(_ result: Result, _ expectedBmi: Float, _ expectedStatus: BodyStatus) {
        if case .success(let bmi, let status) = result {
            XCTAssertEqual(expectedBmi, bmi)
            XCTAssertEqual(expectedStatus, status)
        } else {
            XCTFail()
        }
    }

    func testNormalWeight() {
        let result = calculator.calculate(forWeightInKg: 70.0, andHeighInMeters: 1.75)
        assertSuccess(result, 22.86, .normal)
    }
}
