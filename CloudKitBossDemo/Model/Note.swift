//
//  Note.swift
//  CloudKitBossDemo
//
//  Created by Alex Nagy on 03/11/2020.
//

import Foundation
import CloudKit
import CoreData

struct Note {
    var recordName: String
    var ownerName: String?
    var creationDate: Date?
    var modificationDate: Date?
    var shareRecordName: String?
    var parentRecordName: String?
    var parentRecordType: String?
    
    var text: String
    var images: [Data]?
}

//extension Note: CKBRecord {
//    
//    init(text: String, ownerName: String? = CKManager.userRecordId?.recordName) {
//        self.recordName = UUID().uuidString
//        self.ownerName = ownerName
//        self.creationDate = Date()
//        self.modificationDate = Date()
//        
//        self.text = text
//    }
//    
//    init(record: CKRecord) {
//        self.recordName = record.recordID.recordName
//        self.ownerName = record.object(forKey: CKBConstant.CKBField.ownerName) as? String
//        self.creationDate = record.creationDate
//        self.modificationDate = record.modificationDate
//        self.shareRecordName = record.object(forKey: CKBConstant.CKBField.shareRecordName) as? String
//        if let reference = record.object(forKey: CKBConstant.CKBField.parentRecordName) as? CKRecord.Reference {
//            self.parentRecordName = reference.recordID.recordName
//        }
//        self.parentRecordType = record.object(forKey: CKBConstant.CKBField.parentRecordType) as? String ?? ""
//        
//        // other
//        self.text = record.object(forKey: CKBConstant.Field.text) as? String ?? ""
//        
//        if let assets = record.object(forKey: CKBConstant.Field.images) as? [CKAsset] {
//            var images = [Data]()
//            for i in 0..<assets.count {
//                let asset = assets[i]
//                if let dataURL = asset.fileURL, let data = try? Data(contentsOf: dataURL) {
//                    images.append(data)
//                }
//            }
//            self.images = images
//        }
//    }
//    
//    func getRecordZone() -> CKRecordZone {
//        CKRecordZone(zoneID: CKRecordZone.ID(zoneName: CKBConstant.Zone.Notes, ownerName: ownerName ?? ""))
//    }
//    
//    func getRecordType() -> String {
//        CKBConstant.RecordType.Note
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
//        record.setReferenceTo(parentRecordName, inZone: getRecordZone(), forKey: CKBConstant.CKBField.parentRecordName)
//        record.setValue(parentRecordType, forKey: CKBConstant.CKBField.parentRecordType)
//        
//        // other
//        record.setValue(text, forKey: CKBConstant.Field.text)
//        record.setCKAssets(from: images, forKey: CKBConstant.Field.images) { (record) in
//            completion(.success(record))
//        }
//        
//    }
//    
//    init(object: NSManagedObject) {
//        self.recordName = object.value(forKey: CKBConstant.CKBField.recordName) as? String ?? ""
//        self.ownerName = object.value(forKey: CKBConstant.CKBField.ownerName) as? String ?? ""
//        self.creationDate = object.value(forKey: CKBConstant.CKBField.creationDate) as? Date ?? Date()
//        self.modificationDate = object.value(forKey: CKBConstant.CKBField.modificationDate) as? Date ?? Date()
//        self.shareRecordName = object.value(forKey: CKBConstant.CKBField.shareRecordName) as? String ?? ""
//        self.parentRecordName = object.value(forKey: CKBConstant.CKBField.parentRecordName) as? String ?? ""
//        self.parentRecordType = object.value(forKey: CKBConstant.CKBField.parentRecordType) as? String ?? ""
//        
//        // other
//        self.text = object.value(forKey: CKBConstant.Field.text) as? String ?? ""
//        self.images = object.value(forKey: CKBConstant.Field.images) as? [Data] ?? [Data]()
//    }
//    
//    func saveToCoreData(completion: @escaping (Result<Bool, Error>) -> () = {_ in}) {
//        CDObjectOperation<Note>.getObject(CKBConstant.EntityName.Note, ofType: CDNote.self, recordName: recordName) { (result) in
//            switch result {
//            case .success(let object):
//                object.recordName = recordName
//                object.ownerName = ownerName
//                object.creationDate = creationDate
//                object.modificationDate = modificationDate
//                object.shareRecordName = shareRecordName
//                object.parentRecordName = parentRecordName
//                object.parentRecordType = parentRecordType
//                object.text = text
//                object.images = images as NSArray?
//                CDManager.save(completion: completion)
//            case .failure(let err):
//                completion(.failure(err))
//            }
//        }
//    }
//    
//}
//
