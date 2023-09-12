//
//  EmployeeTableViewDataSource.swift
//  MVVM
//
//  Created by Aravind on 09/09/23.
//

import Foundation
import UIKit
// MARK: Table View Data source
class EmployeeTableViewDataSource<CELL: UITableViewCell, T> : NSObject, UITableViewDataSource {
    private var cellIdentifier : String!
    private var items : [T]!
    var configureCell : (CELL, T) -> () = {_,_ in }
    init(cellIdentifier : String, items : [T], configureCell : @escaping (CELL, T) -> ()) {
        self.cellIdentifier = cellIdentifier
        self.items =  items
        self.configureCell = configureCell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CELL
        let item = self.items[indexPath.row]
        self.configureCell(cell, item)
        return cell
    }
}
// MARK: Table View Delegate
typealias tableViewDelgateCompletion = ((IndexPath) -> ())?
class EmployeeTableViewDelegate: NSObject, UITableViewDelegate {
    var selectionAction : tableViewDelgateCompletion = nil
    init(_ selectionAction: tableViewDelgateCompletion = nil) {
        self.selectionAction =  selectionAction
    }
    func then(onFulfilled: ()->(), onReject: (()->())? = nil) {
      onReject?()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let action = self.selectionAction { action(indexPath) } // Call only if not nil
    }
}

