//
//  File.swift
//  
//
//  Created by João Geniselli on 01/04/20.
//

import Foundation

public enum BodyStatus : CaseIterable {
    case unknown
    case underweight
    case normal
    case overweight
    case obeseI
    case obeseII
    case obeseIII
    
    public func range() -> (lower: Float, upper: Float) {
        switch self {
        case .underweight:
            return (lower: 0.0, upper: 18.5)
        case .normal:
            return (lower: 18.5, upper: 25)
        case .overweight:
            return (lower: 25, upper: 30)
        case .obeseI:
            return (lower: 30, upper: 35)
        case .obeseII:
            return (lower: 35, upper: 40)
        case .obeseIII:
            return (lower: 40, upper: .greatestFiniteMagnitude)
        default:
            return (lower: -.greatestFiniteMagnitude, upper: 0.0)
        }
    }
    
    public func rangeContains(_ bmi: Float) -> Bool {
        let r = range()
        return bmi >= r.lower && bmi < r.upper
    }
    
    public static func by(bmi: Float) -> BodyStatus {
        let filtered = BodyStatus.allCases.filter {
            (status) -> Bool in status.rangeContains(bmi)
        }
        return filtered.first ?? .unknown
    }
}
