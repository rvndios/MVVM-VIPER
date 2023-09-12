//
//  Presenter.swift
//  VIPER
//
//  Created by Aravind on 09/09/23.
//

import Foundation
import UIKit

class Presenter: PresenterProtocol {
    var view: ViewProtocol?
    var interactor: InteractorProtocol?
    var router: RouterProtocol?
    // Custom
    var selectedEmpDta: EmployeeData!
    var employeeData: [EmployeeData]!
    static func bind(_ view: ListViewController) -> PresenterProtocol  {
        let presenter: PresenterProtocol & InteractoDelegate = Presenter()
        let interactor: InteractorProtocol = Interactor()
        interactor.delegate = presenter
        let router: RouterProtocol = Router()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        return presenter
    }
    func updateData() {
        self.interactor?.fetchData()
    }
}

extension Presenter: InteractoDelegate {
    func fetchDataSuccess<Model>(noticeModelArray: Array<Model>) {
        self.employeeData = noticeModelArray.compactMap({ $0 as! EmployeeData })
        view?.updateUI(array: noticeModelArray)
    }
    func fetchDataFailed(_ error: InteractorError) {
        view?.showError(AppError.interactorError(error))
    }
}

