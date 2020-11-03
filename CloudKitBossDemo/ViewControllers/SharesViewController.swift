//
//  SharesViewController.swift
//  CloudKitBossDemo
//
//  Created by Alex Nagy on 03/11/2020.
//

import Foundation
import UIKit

class SharesViewController: UIViewController {
    
    // TODO: 25 - CKUser
//    var users = [CKUser]()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        // TODO: 27 - tableView
//        tableView.dataSource = self
//        tableView.delegate = self
        tableView.registerCell(UserTableViewCell.self)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        setupViews()
        fetchData()
    }
    
    fileprivate func setupNavigation() {
    }
    
    fileprivate func setupViews() {
        view.addSubview(tableView)
        tableView.edgeTo(view)
    }
    
    fileprivate func fetchData() {
        fetchMyData()
    }
    
    // TODO: 26 - show user
//    fileprivate func show(_ user: CKUser) {
//        let controller = NotesViewController()
//        controller.title = "Shares from \(user.fullName)"
//        controller.isShared = true
//        controller.user = user
//        navigationController?.pushViewController(controller, animated: true)
//    }
    
    fileprivate func fetchMyData() {
        // TODO: 29 - fetchMyData
//        let predicate = NSPredicate(format: "%K != %@", CKBConstant.CKBField.ownerName, CKManager.userRecordId?.recordName ?? "")
//
//        CKBOperation<Category>.fetch(CKBConstant.EntityName.Category, ofType: CDCategory.self, predicate: predicate) { (result) in
//            switch result {
//            case .success(let categories):
//                var usersSet = Set<CKUser>()
//                categories.forEach { (category) in
//                    guard let ownerName = category.ownerName, let ownerFullName = category.ownerFullName else { return }
//                    var fullName = ownerFullName
//                    let noSpacesFullName = fullName.replacingOccurrences(of: " ", with: "")
//                    if noSpacesFullName == "" {
//                        fullName = "Unknown"
//                    }
//                    let user = CKUser(recordName: ownerName, fullName: fullName)
//                    if !usersSet.contains(user) {
//                        usersSet.insert(user)
//                    }
//                }
//
//                var usersArray = [CKUser]()
//                usersSet.forEach { (user) in
//                    usersArray.append(user)
//                }
//
//                let orderedUsers = usersArray.sorted { (u0, u1) -> Bool in
//                    u1.fullName < u1.fullName
//                }
//                self.users = orderedUsers
//                self.tableView.reloadData()
//
//            case .failure(let err):
//                CKBAlert.show(error: err, on: self)
//            }
//        }
        
    }
}

// TODO: 28 - UITableViewDelegate & UITableViewDataSource
//extension SharesViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let user = users[indexPath.row]
//        show(user)
//    }
//}
//
//extension SharesViewController: UITableViewDataSource {
//    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        1
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        users.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as UserTableViewCell
//        let user = users[indexPath.row]
//        cell.textLabel?.text = user.fullName
//        cell.detailTextLabel?.text = user.recordName
//        return cell
//    }
//    
//}
