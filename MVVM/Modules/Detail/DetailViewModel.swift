//
//  DetailViewModel.swift
//  iOSArch
//
//  Created by Aravind on 11/09/23.
//

import Foundation
import UIKit

class DetailViewModel: NSObject {
    var bindEmployeeDetailViewModelToController : (() -> ()) = {}
    var empData: EmployeeData!
    override init() {
        super.init()
    }
    required init(_ data: EmployeeData) {
        super.init()
        self.empData = data
        bindEmployeeDetailViewModelToController()
    }
    func getImageURL() -> URL {
        if let url = URL(string: (self.empData.profileImage ?? "https://avatars.githubusercontent.com/u/" + "\(Int.random(in: 10123...89342))?v=4")) {
            return url
        } else {
            return URL(string: "https://avatars.githubusercontent.com/u/26318?v=4")!
        }
            
    }
}

