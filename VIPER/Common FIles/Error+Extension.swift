//
//  Error+Extension.swift
//  VIPER
//
//  Created by Aravind on 11/09/23.
//

import Foundation

// MARK: Error
enum InteractorError: Error {
    case internet(String)
    case runTime(String)
    case dataCorrupted(String)
    case unknown(String)
}

// Common App Error
enum AppError: Error {
    case memory(String)
    case runTime(String)
    case internet(String)
    case custom(String)
    case permission(String)
    case unknown(String)
    case interactorError(InteractorError)
}
