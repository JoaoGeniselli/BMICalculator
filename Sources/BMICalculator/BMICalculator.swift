public class BMICalculator {
    
    public init() {
        
    }
    
    public func calculate(forWeightInKg weight: Float, andHeighInMeters height: Float) -> Result {
        guard isValidWeight(weight), isValidHeight(height) else {
            return Result.error(reason: .invalidMetrics)
        }
        let bmi = (weight / (height * height)).roundToTwoDecimals()
        let status = BodyStatus.by(bmi: bmi)
        return Result.success(bodyMassIndex: bmi, bodyStatus: status)
    }
    
    private func isValidWeight(_ weight: Float) -> Bool {
        return weight >= 0.0 && weight <= 500.0
    }
    
    private func isValidHeight(_ height: Float) -> Bool {
        return height >= 0.0 && height <= 3.0
    }
}

extension Float {
    
    fileprivate func roundToTwoDecimals() -> Float {
        return (self * 100).rounded() / 100
    }
}
