//
//  ViewController.swift
//  VIPER
//
//  Created by Aravind on 09/09/23.
//

import UIKit

class ListViewController: UIViewController {
    private var dataSource : EmployeeTableViewDataSource<EmployeeTableViewCell,EmployeeData>!
    private var delegate : EmployeeTableViewDelegate!
    var presentor: PresenterProtocol!
    @IBOutlet weak var employeeTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "VIPER List"
        self.bind()
    }
    func bind() {
        self.presentor = Presenter.bind(self)
        self.presentor.updateData()
        self.updateDelegate()
        
    }
    func updateDataSource(_ data: Array<EmployeeData>){
        self.dataSource = EmployeeTableViewDataSource(cellIdentifier: "EmployeeTableViewCell", items: data, configureCell: { (cell, evm) in
            cell.textLabel?.text = "\(evm.id ?? 0) - \(evm.employeeName ?? "User") - \(evm.employeeAge ?? 21)"
        })
        DispatchQueue.main.async {
            self.employeeTableView.dataSource = self.dataSource
            self.employeeTableView.reloadData()
        }
    }
    func updateDelegate(){
        self.delegate = EmployeeTableViewDelegate( { index in  // Delegate with action closure
            self.moveToDetailPage()
        })
        DispatchQueue.main.async {
            self.employeeTableView.delegate = self.delegate
        }
    }
}

// MARK: navigation
extension ListViewController: ViewProtocol {
    func updateUI<Model>(array: Array<Model>) {
       print("Updating UI")
       DispatchQueue.main.async {
           self.updateDataSource(array.map({ $0 as! EmployeeData }))
       }
   }
    func showError(_ error: AppError) {
       print("Error: \(error)")
   }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("Navigating to segue: \(segue.identifier ?? "")")
        if segue.identifier ==  SegueId.detailPageFromListSegue, let detailView = segue.destination as? DetailView {
            detailView.displayData = self.presentor.employeeData[self.employeeTableView.indexPathForSelectedRow?.row ?? 0]
        }
    }
    func moveToDetailPage() {
        self.performSegue(withIdentifier: SegueId.detailPageFromListSegue, sender: nil)
    }
}
