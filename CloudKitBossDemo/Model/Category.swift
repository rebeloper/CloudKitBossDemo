//
//  Category.swift
//  CloudKitBossDemo
//
//  Created by Alex Nagy on 03/11/2020.
//

import Foundation
import CloudKit
import CoreData

struct Category {
    let recordName: String
    let ownerName: String?
    let creationDate: Date?
    let modificationDate: Date?
    var shareRecordName: String?
    var parentRecordName: String?
    var parentRecordType: String?
    let ownerFullName: String?
    
    let name: String
    var notes: [Note]?
}

// TODO: 06 - Category CKBRecord
//extension Category: CKBRecord {
//
//    init(name: String, ownerName: String? = CKManager.userRecordId?.recordName) {
//        self.recordName = UUID().uuidString
//        self.ownerName = ownerName
//        self.creationDate = Date()
//        self.modificationDate = Date()
//        self.ownerFullName = CKManager.userFullName
//
//        self.name = name
//    }
//
//    init(record: CKRecord) {
//        self.recordName = record.recordID.recordName
//        self.ownerName = record.object(forKey: CKBConstant.CKBField.ownerName) as? String
//        self.creationDate = record.creationDate
//        self.modificationDate = record.modificationDate
//        self.shareRecordName = record.object(forKey: CKBConstant.CKBField.shareRecordName) as? String
//        self.ownerFullName = record.object(forKey: CKBConstant.CKBField.ownerFullName) as? String
//
//        self.name = record.object(forKey: CKBConstant.Field.name) as? String ?? ""
//    }
//
//    func getRecordZone() -> CKRecordZone {
//        CKRecordZone(zoneID: CKRecordZone.ID(zoneName: CKBConstant.Zone.Notes, ownerName: ownerName ?? ""))
//    }
//
//    func getRecordType() -> String {
//        CKBConstant.RecordType.Category
//    }
//
//    func getRecordID() -> CKRecord.ID {
//        CKRecord.ID(recordName: recordName, zoneID: getRecordZone().zoneID)
//    }
//
//    func convertToCKRecord(completion: @escaping (Result<CKRecord, Error>) -> ()) {
//        let record = CKRecord(recordType: getRecordType(), recordID: getRecordID())
//        record.setValue(ownerName, forKey: CKBConstant.CKBField.ownerName)
//        record.setValue(shareRecordName, forKey: CKBConstant.CKBField.shareRecordName)
//        record.setValue(ownerFullName, forKey: CKBConstant.CKBField.ownerFullName)
//
//        record.setValue(name, forKey: CKBConstant.Field.name)
//
//        completion(.success(record))
//    }
//
//    init(object: NSManagedObject) {
//        self.recordName = object.value(forKey: CKBConstant.CKBField.recordName) as? String ?? ""
//        self.ownerName = object.value(forKey: CKBConstant.CKBField.ownerName) as? String ?? ""
//        self.creationDate = object.value(forKey: CKBConstant.CKBField.creationDate) as? Date ?? Date()
//        self.modificationDate = object.value(forKey: CKBConstant.CKBField.modificationDate) as? Date ?? Date()
//        self.shareRecordName = object.value(forKey: CKBConstant.CKBField.shareRecordName) as? String ?? ""
//        self.ownerFullName = object.value(forKey: CKBConstant.CKBField.ownerFullName) as? String ?? ""
//
//        self.name = object.value(forKey: CKBConstant.Field.name) as? String ?? ""
//    }
//
//    func saveToCoreData(completion: @escaping (Result<Bool, Error>) -> () = {_ in}) {
//        CDObjectOperation<Category>.getObject(CKBConstant.EntityName.Category, ofType: CDCategory.self, recordName: recordName) { (result) in
//            switch result {
//            case .success(let object):
//                object.recordName = recordName
//                object.ownerName = ownerName
//                object.creationDate = creationDate
//                object.modificationDate = modificationDate
//                object.shareRecordName = shareRecordName
//                object.ownerFullName = ownerFullName
//                object.name = name
//                CDManager.save(completion: completion)
//            case .failure(let err):
//                completion(.failure(err))
//            }
//        }
//    }
//
//}
//
