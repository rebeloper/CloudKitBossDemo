//
//  NotesViewController.swift
//  CloudKitBossDemo
//
//  Created by Alex Nagy on 03/11/2020.
//

import UIKit
import CloudKit
import CoreData

class NotesViewController: UIViewController {
    
    var isShared = false
    
    // TODO: 07 - CKUser
//    var user: CKUser?
    
    var notes: [Note] = [] {
        didSet {
            combineNoteWithCategory()
        }
    }
    
    var categories: [Category] = [] {
        didSet {
            combineNoteWithCategory()
        }
    }
    
    var combinedCategories: [Category] = []
    
    var isCategoriesFetched = false
    var isNotesFetched = false
    
    var deepLinkNote: Note?
    
    var shareTitle: String?
    
    lazy var optionsBarButtonItem: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(systemName: "sparkles")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleOptions))
        return button
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerCell(NoteTableViewCell.self)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        setupViews()
        // TODO: 08 - fetchData
//        if user == nil {
//            CKManager.discoverUserIdentity { (result) in
//                if let recordName = CKManager.userRecordId?.recordName {
//                    let fullName = CKManager.userFullName ?? ""
//                    self.user = CKUser(recordName: recordName, fullName: fullName)
//                    self.fetchData()
//                }
//            }
//        } else {
//            fetchData()
//        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // TODO: 36 - addObserver
//        NotificationCenter.default.addObserver(self, selector: #selector(onDidReceiveRecordChanged(_:)), name: .didReceiveRecordChanged, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(onDidReceiveRecordDeleted(_:)), name: .didReceiveRecordDeleted, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    // TODO: 37 - onDidReceiveRecordChanged
//    @objc func onDidReceiveRecordChanged(_ notification:Notification) {
//        if let data = notification.userInfo as? [String: CKRecord] {
//            for (_, record) in data {
//                let model = Note(record: record)
//                CDObjectOperation.save(model) { (result) in
//                    DispatchQueue.main.async {
//                        switch result {
//                        case .success(let model):
//                            print("Saved: \(model.recordName)")
//                            self.fetchData()
//                        case .failure(let err):
//                            CKBAlert.show(error: err, on: self)
//                        }
//                    }
//                }
//            }
//        }
//    }
    
    // TODO: 38 - onDidReceiveRecordDeleted
//    @objc func onDidReceiveRecordDeleted(_ notification:Notification) {
//        if let data = notification.userInfo as? [CKRecord.ID: CKRecord.RecordType] {
//            for (recordId, recordType) in data {
//                let recordName = recordId.recordName
//                switch recordType {
//                case CKBConstant.RecordType.Note:
//                    CDObjectOperation<Note>.delete(recordName, entityName: CKBConstant.EntityName.Note, ofType: CDNote.self) { (result) in
//                        DispatchQueue.main.async {
//                            switch result {
//                            case .success(let finished):
//                                if finished {
//                                    self.fetchData()
//                                } else {
//                                    CKBAlert.showErrorSomethingWentWrong(on: self)
//                                }
//                            case .failure(let err):
////                                Alert.show(error: err, on: self)
//                                print(err.localizedDescription)
//                            }
//                        }
//                    }
//                case CKBConstant.RecordType.Category:
//                    CDObjectOperation<Category>.delete(recordName, entityName: CKBConstant.EntityName.Category, ofType: CDCategory.self) { (result) in
//                        DispatchQueue.main.async {
//                            switch result {
//                            case .success(let finished):
//                                if finished {
//                                    self.fetchData()
//                                } else {
//                                    CKBAlert.showErrorSomethingWentWrong(on: self)
//                                }
//                            case .failure(let err):
////                                Alert.show(error: err, on: self)
//                                print(err.localizedDescription)
//                            }
//                        }
//                    }
//                default:
//                    print("Invalid recordType: \(recordType)")
//                }
//            }
//        }
//    }
    
    fileprivate func setupNavigation() {
        navigationItem.setRightBarButton(optionsBarButtonItem, animated: false)
    }
    
    fileprivate func setupViews() {
        view.addSubview(tableView)
        tableView.edgeTo(view)
    }
    
    fileprivate func fetchData() {
        isFetched(false)
        // TODO: 09 - fetchData
//        let predicate = NSPredicate(format: "%K == %@", CKBConstant.CKBField.ownerName, user?.recordName ?? "")
//
//        CKBOperation<Note>.fetch(CKBConstant.EntityName.Note, ofType: CDNote.self, predicate: predicate) { (result) in
//            self.isNotesFetched = true
//            switch result {
//            case .success(let notes):
//                self.notes = notes
//                self.tableView.reloadData()
//            case .failure(let err):
//                CKBAlert.show(error: err, on: self)
//            }
//        }
//
//        CKBOperation<Category>.fetch(CKBConstant.EntityName.Category, ofType: CDCategory.self, predicate: predicate) { (result) in
//            self.isCategoriesFetched = true
//            switch result {
//            case .success(let categories):
//                self.categories = categories
//                self.tableView.reloadData()
//            case .failure(let err):
//                CKBAlert.show(error: err, on: self)
//            }
//        }
        
    }
    
    fileprivate func refreshData() {
        // TODO: 10 - refreshData
//        let predicate = NSPredicate(format: "%K == %@", CKBConstant.CKBField.ownerName, user?.recordName ?? "")
//        CKBOperation<Note>.refresh(recordType: CKBConstant.RecordType.Note,
//                                    entityName: CKBConstant.EntityName.Note,
//                                    predicate: predicate,
//                                    database: CKManager.privateDatabase,
//                                    zoneId: CKRecordZone.ID(zoneName: CKBConstant.Zone.Notes)) { (result) in
//            switch result {
//            case .success(let notes):
//                self.notes = notes
//                self.tableView.reloadData()
//            case .failure(let err):
//                CKBAlert.show(error: err, on: self)
//            }
//        }
//
//        CKBOperation<Category>.refresh(recordType: CKBConstant.RecordType.Category,
//                                        entityName: CKBConstant.EntityName.Category,
//                                        predicate: predicate,
//                                        database: CKManager.privateDatabase,
//                                        zoneId: CKRecordZone.ID(zoneName: CKBConstant.Zone.Notes)) { (result) in
//            switch result {
//            case .success(let categories):
//                self.categories = categories
//                self.tableView.reloadData()
//            case .failure(let err):
//                CKBAlert.show(error: err, on: self)
//            }
//        }
    }
    
    fileprivate func refreshAllSharedData() {
        // TODO: 31 - refreshAllSharedData
//        let sharedData = CKContainer.default().sharedCloudDatabase
//        sharedData.fetchAllRecordZones { (recordZones, err) in
//            if let err = err {
//                CKBAlert.show(error: err, on: self)
//                return
//            }
//            if let recordZones = recordZones {
//                for i in 0..<recordZones.count {
//                    let zone = recordZones[i]
//                    let zoneId = zone.zoneID
//                    let zoneName = zoneId.zoneName
//                    let zoneOwnerName = zoneId.ownerName
//                    if zoneName == CKBConstant.Zone.Notes {
//                        let predicate = NSPredicate(format: "%K == %@", CKBConstant.CKBField.ownerName, zoneOwnerName)
//                        CKBOperation<Note>.refresh(recordType: CKBConstant.RecordType.Note,
//                                                    entityName: CKBConstant.EntityName.Note,
//                                                    predicate: predicate,
//                                                    database: CKManager.sharedDatabase,
//                                                    zoneId: zoneId) { (result) in
//                            switch result {
//                            case .success(let notes):
//                                self.notes = notes
//                                self.tableView.reloadData()
//                            case .failure(let err):
//                                CKBAlert.show(error: err, on: self)
//                            }
//                        }
//
//                        CKBOperation<Category>.refresh(recordType: CKBConstant.RecordType.Category,
//                                                        entityName: CKBConstant.EntityName.Category,
//                                                        predicate: predicate,
//                                                        database: CKManager.sharedDatabase,
//                                                        zoneId: zoneId) { (result) in
//                            switch result {
//                            case .success(let categories):
//                                self.categories = categories
//                                self.tableView.reloadData()
//                            case .failure(let err):
//                                CKBAlert.show(error: err, on: self)
//                            }
//                        }
//                    }
//                }
//            }
//        }
    }
    
    fileprivate func refreshSharedData() {
        // TODO: 32 - refreshSharedData
//        let sharedData = CKContainer.default().sharedCloudDatabase
//        sharedData.fetchAllRecordZones { (recordZones, err) in
//            if let err = err {
//                CKBAlert.show(error: err, on: self)
//                return
//            }
//            if let recordZones = recordZones {
//                for i in 0..<recordZones.count {
//                    let zone = recordZones[i]
//                    let zoneId = zone.zoneID
//                    let zoneName = zoneId.zoneName
//                    let zoneOwnerName = zoneId.ownerName
//                    if let userRecordName = self.user?.recordName, userRecordName == zoneOwnerName {
//                        if zoneName == CKBConstant.Zone.Notes {
//                            let predicate = NSPredicate(format: "%K == %@", CKBConstant.CKBField.ownerName, zoneOwnerName)
//                            CKBOperation<Note>.refresh(recordType: CKBConstant.RecordType.Note,
//                                                        entityName: CKBConstant.EntityName.Note,
//                                                        predicate: predicate,
//                                                        database: CKManager.sharedDatabase,
//                                                        zoneId: zoneId) { (result) in
//                                switch result {
//                                case .success(let notes):
//                                    self.notes = notes
//                                    self.tableView.reloadData()
//                                case .failure(let err):
//                                    CKBAlert.show(error: err, on: self)
//                                }
//                            }
//
//                            CKBOperation<Category>.refresh(recordType: CKBConstant.RecordType.Category,
//                                                            entityName: CKBConstant.EntityName.Category,
//                                                            predicate: predicate,
//                                                            database: CKManager.sharedDatabase,
//                                                            zoneId: zoneId) { (result) in
//                                switch result {
//                                case .success(let categories):
//                                    self.categories = categories
//                                    self.tableView.reloadData()
//                                case .failure(let err):
//                                    CKBAlert.show(error: err, on: self)
//                                }
//                            }
//                        }
//                    }
//                }
//            }
//        }
    }
    
    func sharedRecords(zoneID: CKRecordZone.ID, recordType: String){
        // TODO: 30 - sharedRecords
//        let sharedDatabase = CKManager.sharedDatabase
//
//        let predicate = NSPredicate(value: true)
//        let query = CKQuery(recordType: recordType, predicate: predicate)
//
//        sharedDatabase.perform(query, inZoneWith: zoneID){( results , error) in
//            guard error == nil else{
//                print("Error: \(String(describing: error?.localizedDescription))")
//                return
//            }
//            if let itemsFromResults = results{
//                print("Items: \(itemsFromResults)")
//            }
//        }
    }
    
    fileprivate func combineNoteWithCategory() {
        
        guard isNotesFetched && isCategoriesFetched else { return }
        
        combinedCategories.removeAll()
        
        for var category in categories {
            category.notes = notes.filter { $0.parentRecordName == category.recordName }
            combinedCategories.append(category)
        }
        
        // TODO: 11 - noCategoryNotes
//        let noCategoryNotes = notes.filter { $0.parentRecordName == nil }
//        var category = Category(name: "No Categories")
//        category.notes = noCategoryNotes
//
//        combinedCategories.append(category)
        
        if let note = deepLinkNote {
            deepLinkNote = nil
            show(note)
        }
    }
    
    func show(_ note: Note? = nil) {
        guard isNotesFetched && isCategoriesFetched else { return }
        let controller = NoteViewController()
        controller.isShared = isShared
        controller.note = note
        controller.categories = categories
        controller.delegate = self
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func isFetched(_ value: Bool = true) {
        isNotesFetched = value
        isCategoriesFetched = value
    }
    
    @objc
    func handleOptions() {
        // TODO: 12 - handleOptions
//        var actions = [UIAlertAction]()
//
//        let refreshAction = UIAlertAction(title: "Refresh", style: .default) { (action) in
//            self.handleRefresh()
//        }
//        let addAction = UIAlertAction(title: "Add", style: .default) { (action) in
//            self.handleAdd()
//        }
//        let shareAction = UIAlertAction(title: "Share", style: .default) { (action) in
//            self.handleShare()
//        }
//        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//
//        actions.append(addAction)
//        actions.append(refreshAction)
//        if let userRecordName = user?.recordName,
//           let currentUserRecordName = CKManager.userRecordId?.recordName,
//           userRecordName == currentUserRecordName {
//            actions.append(shareAction)
//        }
//        actions.append(cancelAction)
//        CKBAlert.show(.actionSheet, title: nil, message: nil, actions: actions, on: self)
    }
    
    func handleRefresh() {
        if isShared {
            refreshSharedData()
        } else {
            refreshData()
        }
    }
    
    func handleAdd() {
        show()
    }
    
    func handleShare() {
        // TODO: 20 - handleShare
//        CDObjectOperation<Category>.fetch(CKBConstant.EntityName.Category, ofType: CDCategory.self) { (result) in
//            switch result {
//            case .success(let categories):
//                if categories.count == 0 {
//                    CKBAlert.showError(message: "No categroies to share", on: self)
//                } else {
//                    var actions = [UIAlertAction]()
//
//                    categories.forEach { (category) in
//                        let title = category.name
//                        self.shareTitle = title
//                        let alertAction = UIAlertAction(title: title, style: .default) { (action) in
//                            CKShareOperation.share(category,
//                                                   title: title,
//                                                   thumbnailImageData: UIImage(systemName: "doc")!,
//                                                   zoneName: CKBConstant.Zone.Notes,
//                                                   delegate: self)
//                        }
//                        actions.append(alertAction)
//                    }
//
//                    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//                    actions.append(cancelAction)
//                    CKBAlert.show(.actionSheet, title: "Share", message: "Choose the category you want to share", actions: actions, on: self)
//                }
//            case .failure(let err):
//                CKBAlert.show(error: err, on: self)
//            }
//        }
    }
    
}

extension NotesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = combinedCategories[indexPath.section]
        let note = category.notes?[indexPath.row]
        show(note)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return combinedCategories[section].name
    }
}

extension NotesViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        combinedCategories.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        combinedCategories[section].notes?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as NoteTableViewCell
        
        let category = combinedCategories[indexPath.section]
        let note = category.notes?[indexPath.row]
        cell.textLabel?.text = note?.text
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let category = combinedCategories[indexPath.section]
            
            guard let note = category.notes?[indexPath.row] else { return }
            guard let index = notes.map({ $0.recordName }).firstIndex(of: note.recordName) else {
                return
            }
            
            notes.remove(at: index)
            tableView.deleteRows(at: [indexPath], with: .fade)
            // TODO: 14 - delete
//            var database = CKManager.privateDatabase
//            if isShared {
//                database = CKManager.sharedDatabase
//            }
//            CKBOperation<Note>.delete(note, entityName: CKBConstant.EntityName.Note, ofType: CDNote.self, database: database) { (result) in
//                switch result {
//                case .success(let id):
//                    CKBAlert.showSuccess(message: "Successfully deleted: \(id.recordName)", on: self)
//                case .failure(let err):
//                    CKBAlert.show(error: err, on: self)
//                }
//            }
            
            if category.notes?.count == 1 {
                guard let index = categories.map({ $0.recordName }).firstIndex(of: category.recordName) else {
                    return
                }
                
                categories.remove(at: index)
                tableView.deleteSections([indexPath.section], with: .fade)
                // TODO: 13 - delete
//                var database = CKManager.privateDatabase
//                if isShared {
//                    database = CKManager.sharedDatabase
//                }
//                CKBOperation<Category>.delete(category, entityName: CKBConstant.EntityName.Category, ofType: CDCategory.self, database: database) { (result) in
//                    switch result {
//                    case .success(let id):
//                        CKBAlert.showSuccess(message: "Successfully deleted: \(id.recordName)", on: self)
//                    case .failure(let err):
//                        CKBAlert.show(error: err, on: self)
//                    }
//                }
            }
            
        }
    }
    
}

extension NotesViewController: NoteViewControllerDelegate {
    
    func didAdd(_ note: Note, categories: [Category]) {
        // TODO: 16 - didAdd
//        var database = CKManager.privateDatabase
//        if isShared {
//            database = CKManager.sharedDatabase
//        }
//        CKBOperation.save(note, database: database) { (result) in
//            switch result {
//            case .success(let note):
//                self.notes.append(note)
//                self.categories = categories
//                self.tableView.reloadData()
//                CKBAlert.showSuccess(message: "Successfully saved note: \(note.text)", on: self)
//            case .failure(let err):
//                CKBAlert.show(error: err, on: self)
//            }
//        }
    }
    
    func didChange(_ note: Note, categories: [Category]) {
        guard let index = notes.map({ $0.recordName }).firstIndex(of: note.recordName) else {
            return
        }
        // TODO: 15 - didChange
//        var database = CKManager.privateDatabase
//        if isShared {
//            database = CKManager.sharedDatabase
//        }
//        CKBOperation.update(note, database: database) { (result) in
//            switch result {
//            case .success(let note):
//                self.notes[index] = note
//                self.categories = categories
//                self.tableView.reloadData()
//                CKBAlert.showSuccess(message: "Successfully updated note: \(note.text)", on: self)
//            case .failure(let err):
//                CKBAlert.show(error: err, on: self)
//            }
//        }
    }
}

extension NotesViewController: UICloudSharingControllerDelegate {
    func cloudSharingController(_ csc: UICloudSharingController, failedToSaveShareWithError error: Error) {
        // TODO: 21 - showError
//        CKBAlert.showError(message: error.localizedDescription, on: self)
    }
    
    func itemTitle(for csc: UICloudSharingController) -> String? {
        shareTitle
    }
    
    func itemThumbnailData(for csc: UICloudSharingController) -> Data? {
        UIImage(systemName: "doc")!.pngData()
    }
    
    func itemType(for csc: UICloudSharingController) -> String? {
        "keep"
    }
    
    func cloudSharingControllerDidSaveShare(_ csc: UICloudSharingController) {
        // TODO: 22 - showSuccess
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
//            CKBAlert.showSuccess(message: "Successfully shared", on: self)
//        }
    }
    
    func cloudSharingControllerDidStopSharing(_ csc: UICloudSharingController) {
        // TODO: 23 - showInfo
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
//            CKBAlert.showInfo(message: "Stopped sharing", on: self)
//        }
    }
    
}


