//
//  ListProtocol.swift
//  VIPER
//
//  Created by Aravind on 11/09/23.
//

import Foundation
import UIKit

// MARK: VIPER - Protocol for single V I P E R. 🐍

protocol PresenterProtocol: AnyObject{
    var view: ViewProtocol? {get set}
    var interactor: InteractorProtocol? {get set}
    var router: RouterProtocol? {get set}
    // Custom func - Change based on each View
    func updateData()
    var employeeData: [EmployeeData]! {get set}
}

protocol ViewProtocol: AnyObject{
    func updateUI<Model>(array: Array<Model>)
    func showError(_ error: AppError)
}

protocol RouterProtocol: AnyObject {
    func pushToScreen(viewController: UIViewController, viewController: UINavigationController)
    func performSegue(segueID: String, viewController: ListViewController)
}

protocol InteractorProtocol: AnyObject {
    var presenter: PresenterProtocol? {get set}
    var delegate: InteractoDelegate? {get set}
    func fetchData()
}

// MARK: Delegates
protocol InteractoDelegate: AnyObject {
    func fetchDataSuccess<Model>(noticeModelArray:Array<Model>)
    func fetchDataFailed(_ error: InteractorError)
}
