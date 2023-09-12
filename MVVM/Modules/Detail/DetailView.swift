//
//  DetailView.swift
//  iOSArch
//
//  Created by Aravind on 11/09/23.
//

import UIKit

class DetailView: UIViewController {
    
    private var viewModel: DetailViewModel!
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
        self.viewModel = DetailViewModel(self.displayData)
    }
    func updateUI() {
        self.imgView.downloaded(from: self.viewModel.getImageURL())
        self.lblDetails.text = "NAME: \(self.viewModel.empData.employeeName ?? "User") \n AGE: \(self.viewModel.empData.employeeAge ?? 21) \n SALARY: \(self.viewModel.empData.employeeSalary ?? 2300) \n"
    }

}
