//
//  DetailView.swift
//  VIPER
//
//  Created by Aravind on 11/09/23.
//

import Foundation
import UIKit
class DetailView: UIViewController {
    
//    private var viewModel: DetailViewModel!
    var presenter: DetailPresenterProtocol!
    var displayData: EmployeeData!
    @IBOutlet weak var lblDetails: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        bind()
        updateUI()
    }
    func bind() {
        self.presenter = DetailPresenter.bind(self)
        self.presenter.empData = displayData
    }
    func updateUI() {
        self.imgView.downloaded(from: self.presenter.getImageURL())
        self.lblDetails.text = "NAME: \(self.displayData.employeeName ?? "User") \n AGE: \(self.displayData.employeeAge ?? 21) \n SALARY: \(self.displayData.employeeSalary ?? 2300) \n"
    }

}
extension DetailView: DetailViewProtocol {
    func updateUI<Model>(array: Array<Model>) {
         
    }
    
    func showError(_ error: AppError) {
         
    }
    
    
}
