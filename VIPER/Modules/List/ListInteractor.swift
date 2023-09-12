//
//  Interactor.swift
//  VIPER
//
//  Created by Aravind on 09/09/23.
//

import Foundation

class Interactor: InteractorProtocol {
    var delegate: InteractoDelegate?
    var presenter: PresenterProtocol?
    func fetchData() {
        APIServices.shared.getEmpData { employeesData in
            if employeesData != nil, let returnData = employeesData?.data, returnData.count > 0 {
                self.delegate?.fetchDataSuccess(noticeModelArray: returnData)
            } else {
                self.delegate?.fetchDataFailed(.dataCorrupted("Data is in incorrect format"))
            }
        }
    }
}
