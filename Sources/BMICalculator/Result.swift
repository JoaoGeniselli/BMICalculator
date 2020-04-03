//
//  File.swift
//  
//
//  Created by João Geniselli on 01/04/20.
//

import Foundation

enum Result : Equatable {
    case success(bodyMassIndex: Float, bodyStatus: BodyStatus)
    case error(reason: CalculatorError)
}
