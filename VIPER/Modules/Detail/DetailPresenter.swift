//
//  DetailInteractor.swift
//  VIPER
//
//  Created by Aravind on 11/09/23.
//

import Foundation


class DetailPresenter: DetailPresenterProtocol {
    var view: DetailViewProtocol?
    var empData: EmployeeData!
    static func bind(_ view: DetailView) -> DetailPresenterProtocol  {
        let presenter: DetailPresenterProtocol = DetailPresenter()
        view.presenter = presenter
        presenter.view = view
        return presenter
    }
    func getImageURL() -> URL {
        if let url = URL(string: (self.empData.profileImage ?? "https://avatars.githubusercontent.com/u/" + "\(Int.random(in: 10123...89342))?v=4")) {
            return url
        } else {
            return URL(string: "https://avatars.githubusercontent.com/u/26318?v=4")!
        }
    }

}

