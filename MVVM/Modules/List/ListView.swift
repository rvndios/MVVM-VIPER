//
//  ViewController.swift
//  MVVM
//
//  Created by Aravind on 09/09/23.
//

import UIKit

class ListViewController: UIViewController {
    private var viewModel: ListViewModel!
    private var dataSource : EmployeeTableViewDataSource<EmployeeTableViewCell,EmployeeData>!
    private var delegate : EmployeeTableViewDelegate!

    @IBOutlet weak var employeeTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        bind()
        self.title = "MVVM List"
    }
    func bind() {
        self.viewModel = ListViewModel()
        self.viewModel.bindEmployeeViewModelToController = {
            self.updateDataSource()
            self.updateDelegate()
        }
    }
    func updateDataSource(){
        self.dataSource = EmployeeTableViewDataSource(cellIdentifier: "EmployeeTableViewCell", items: self.viewModel.empData.data ?? [], configureCell: { (cell, evm) in
            cell.textLabel?.text = "\(evm.id ?? 0) - \(evm.employeeName ?? "User") - \(evm.employeeAge ?? 21)"
        })
        DispatchQueue.main.async {
            self.employeeTableView.dataSource = self.dataSource
            self.employeeTableView.reloadData()
        }
    }
    func updateDelegate(){
        self.delegate = EmployeeTableViewDelegate( { index in  // Delegate with action closure
            print("Cell Selected: \(index)")
            self.navigateToDetailPage()
        })
        //        self.delegate = EmployeeTableViewDelegate()    // Delegate without action closure
        DispatchQueue.main.async {
            self.employeeTableView.delegate = self.delegate
        }
    }
}
// MARK: navigation
extension ListViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("Navigating to segue: \(segue.identifier ?? "")")
        if segue.identifier ==  SegueId.detailPageFromListSegue, let detailView = segue.destination as? DetailView {
            detailView.displayData = self.viewModel.empData.data?[self.employeeTableView.indexPathForSelectedRow?.row ?? 0]
        }
    }
    func navigateToDetailPage() {
        self.performSegue(withIdentifier: SegueId.detailPageFromListSegue, sender: nil)
    }
}
