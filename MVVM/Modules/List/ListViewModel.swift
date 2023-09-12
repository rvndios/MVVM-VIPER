//
//  ListViewModel.swift
//  MVVM
//
//  Created by Aravind on 09/09/23.
//

import Foundation

class ListViewModel: NSObject {
    private(set) var empData : Employees! {
        didSet {
            self.bindEmployeeViewModelToController()
        }
    }
    var bindEmployeeViewModelToController : (() -> ()) = {}
    override init() {
        super.init()
        getData()
    }
    func getData() {
        APIServices.shared.getEmpData { emp in
            self.empData = emp
        }
    }
    
}
