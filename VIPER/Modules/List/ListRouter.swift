//
//  Router.swift
//  VIPER
//
//  Created by Aravind on 09/09/23.
//

import Foundation
import UIKit
// Navigations



class Router: RouterProtocol {
    func performSegue(segueID: String, viewController: ListViewController) {
        viewController.performSegue(withIdentifier: segueID, sender: self)
    }
    func pushToScreen(viewController: UIViewController, viewController navigationConroller: UINavigationController) {
        navigationConroller.pushViewController(viewController, animated: true)
    }
}
