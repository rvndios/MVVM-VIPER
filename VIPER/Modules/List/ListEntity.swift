//
//  Entity.swift
//  VIPER
//
//  Created by Aravind on 09/09/23.
//

import Foundation
struct Employees: Codable {
    var status: String?
    var data: [EmployeeData]?
    var message: String?
}

// MARK: - Datum
struct EmployeeData: Codable {
    var id: Int?
    var employeeName: String?
    var employeeSalary, employeeAge: Int?
    var profileImage: String?

    enum CodingKeys: String, CodingKey {
        case id
        case employeeName = "employee_name"
        case employeeSalary = "employee_salary"
        case employeeAge = "employee_age"
        case profileImage = "profile_image"
    }
}
