//
//  DetailProtocol.swift
//  VIPER
//
//  Created by Aravind on 11/09/23.
//

import Foundation
import UIKit

protocol DetailPresenterProtocol: AnyObject {
    // Custom func - Change based on each View
    var view: DetailViewProtocol? {get set}
    var empData: EmployeeData! {get set}
    func getImageURL() -> URL
}

protocol DetailViewProtocol: AnyObject{
    func updateUI<Model>(array: Array<Model>)
    func showError(_ error: AppError)
}

protocol DetailRouterProtocol: AnyObject {
    func pushToScreen(viewController: UIViewController, viewController: UINavigationController)
    func performSegue(segueID: String, viewController: DetailView)
}

protocol DetailInteractorProtocol: AnyObject {
    var presenter: PresenterProtocol? {get set}
    var delegate: InteractoDelegate? {get set}
    func fetchData()
}

// MARK: Delegates
protocol DetailInteractoDelegate: AnyObject {
    func fetchDataSuccess<Model>(noticeModelArray:Array<Model>)
    func fetchDataFailed(_ error: InteractorError)
}

