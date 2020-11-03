//
//  AppDelegate.swift
//  CloudKitBossDemo
//
//  Created by Alex Nagy on 03/11/2020.
//

//
//  AppDelegate.swift
//  CloudKitMasterDemo
//
//  Created by Alex Nagy on 14/10/2020.
//

import UIKit
import CloudKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
//        CKBManager.launch(application: application, delegate: self)
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
//    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
//        CKManager.handleUserInfo(userInfo, fetchCompletionHandler: completionHandler)
//    }

}

//extension AppDelegate: UNUserNotificationCenterDelegate {
//    
//    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
//        CKManager.handle(response: response, withCompletionHandler: completionHandler)
//    }
//    
//}
//
//extension AppDelegate: CKManagerDelegate {
//    
//    func saveSubscriptions() {
//        CKSubscriptionOperation.save(CKBConstant.Subscription.NoteCreated, recordType: CKBConstant.RecordType.Note, options: [.firesOnRecordCreation], title: "A new note has been created", titleArguments: nil, body: "%1$@", bodyArguments: [CKBConstant.Field.text], soundName: "default", database: CKManager.privateDatabase) { (result) in
//            switch result {
//            case .success(let subscription):
//                print("Private database -> Saved subscription: \(subscription.subscriptionID)")
//            case .failure(let err):
//                print(err.localizedDescription)
//            }
//        }
//        
//        CKSubscriptionOperation.save(CKBConstant.Subscription.NoteUpdated, recordType: CKBConstant.RecordType.Note, options: [.firesOnRecordUpdate], title: "A note has been updated", titleArguments: nil, body: "Updated text: %1$@", bodyArguments: [CKBConstant.Field.text], soundName: "default", database: CKManager.privateDatabase) { (result) in
//            switch result {
//            case .success(let subscription):
//                print("Private database -> Saved subscription: \(subscription.subscriptionID)")
//            case .failure(let err):
//                print(err.localizedDescription)
//            }
//        }
//        
//        CKSubscriptionOperation.save(CKBConstant.Subscription.NoteDeleted, recordType: CKBConstant.RecordType.Note, options: [.firesOnRecordDeletion], title: "Note '%1$@' has been deleted", titleArguments: [CKBConstant.Field.text], body: nil, bodyArguments: nil, soundName: "default", database: CKManager.privateDatabase) { (result) in
//            switch result {
//            case .success(let subscription):
//                print("Private database -> Saved subscription: \(subscription.subscriptionID)")
//            case .failure(let err):
//                print(err.localizedDescription)
//            }
//        }
//        
//        CKSubscriptionOperation.save(CKBConstant.Subscription.CategoryCreated, recordType: CKBConstant.RecordType.Category, options: [.firesOnRecordCreation], title: "A new category has been created", titleArguments: nil, body: "%1$@", bodyArguments: [CKBConstant.Field.name], soundName: "default", database: CKManager.privateDatabase) { (result) in
//            switch result {
//            case .success(let subscription):
//                print("Private database -> Saved subscription: \(subscription.subscriptionID)")
//            case .failure(let err):
//                print(err.localizedDescription)
//            }
//        }
//        
//        CKSubscriptionOperation.save(CKBConstant.Subscription.CategoryUpdated, recordType: CKBConstant.RecordType.Category, options: [.firesOnRecordUpdate], title: "A category has been updated", titleArguments: nil, body: "Updated name: %1$@", bodyArguments: [CKBConstant.Field.name], soundName: "default", database: CKManager.privateDatabase) { (result) in
//            switch result {
//            case .success(let subscription):
//                print("Private database -> Saved subscription: \(subscription.subscriptionID)")
//            case .failure(let err):
//                print(err.localizedDescription)
//            }
//        }
//        
//        CKSubscriptionOperation.save(CKBConstant.Subscription.CategoryDeleted, recordType: CKBConstant.RecordType.Category, options: [.firesOnRecordDeletion], title: "Category '%1$@' has been deleted", titleArguments: [CKBConstant.Field.name], body: nil, bodyArguments: nil, soundName: "default", database: CKManager.privateDatabase) { (result) in
//            switch result {
//            case .success(let subscription):
//                print("Private database -> Saved subscription: \(subscription.subscriptionID)")
//            case .failure(let err):
//                print(err.localizedDescription)
//            }
//        }
//        
////        CKSubscriptionOperation.deleteAll(database: CKManager.sharedDatabase) { (result) in
////            switch result {
////            case .success(let ids):
////                print("Deleted subscription ids: \(ids)")
////            case .failure(let err):
////                print(err.localizedDescription)
////            }
////        }
//        
//        CKSubscriptionOperation.save(CKBConstant.Subscription.SharedNote, recordType: CKBConstant.RecordType.Note, database: CKManager.sharedDatabase) { (result) in
//            switch result {
//            case .success(let subscription):
//                print("Shared database -> Saved subscription: \(subscription.subscriptionID)")
//            case .failure(let err):
//                print(err.localizedDescription)
//            }
//        }
//
//        CKSubscriptionOperation.save(CKBConstant.Subscription.SharedCategory, recordType: CKBConstant.RecordType.Category, database: CKManager.sharedDatabase) { (result) in
//            switch result {
//            case .success(let subscription):
//                print("Shared database -> Saved subscription: \(subscription.subscriptionID)")
//            case .failure(let err):
//                print(err.localizedDescription)
//            }
//        }
//    }
//    
//    func handleSubscriptionId(_ subscriptionId: CKSubscription.ID, recordId: CKRecord.ID) {
//        switch subscriptionId {
//        case CKBConstant.Subscription.NoteCreated:
//            CKBOperation<Note>.syncCreated(recordId) { (result) in
//                switch result {
//                case .success(let note):
//                    print("Synced created note: \(note.text) - \(note.recordName)")
//                case .failure(let err):
//                    print(err.localizedDescription)
//                }
//            }
//        case CKBConstant.Subscription.NoteUpdated:
//            CKBOperation<Note>.syncUpdated(recordId) { (result) in
//                switch result {
//                case .success(let note):
//                    print("Synced updated note: \(note.text) - \(note.recordName)")
//                case .failure(let err):
//                    print(err.localizedDescription)
//                }
//            }
//        case CKBConstant.Subscription.NoteDeleted:
//            CKBOperation<Note>.syncDeleted(recordId, entityName: CKBConstant.EntityName.Note, ofType: CDNote.self) { (result) in
//                switch result {
//                case .success(let finished):
//                    print("Synced deleted note: \(finished) - \(recordId.recordName)")
//                case .failure(let err):
//                    print(err.localizedDescription)
//                }
//            }
//        case CKBConstant.Subscription.CategoryCreated:
//            CKBOperation<Category>.syncCreated(recordId) { (result) in
//                switch result {
//                case .success(let category):
//                    print("Synced created category: \(category.name) - \(category.recordName)")
//                case .failure(let err):
//                    print(err.localizedDescription)
//                }
//            }
//        case CKBConstant.Subscription.CategoryUpdated:
//            CKBOperation<Category>.syncUpdated(recordId) { (result) in
//                switch result {
//                case .success(let category):
//                    print("Synced updated category: \(category.name) - \(category.recordName)")
//                case .failure(let err):
//                    print(err.localizedDescription)
//                }
//            }
//        case CKBConstant.Subscription.CategoryDeleted:
//            CKBOperation<Category>.syncDeleted(recordId, entityName: CKBConstant.EntityName.Category, ofType: CDCategory.self) { (result) in
//                switch result {
//                case .success(let finished):
//                    print("Synced deleted category: \(finished) - \(recordId.recordName)")
//                case .failure(let err):
//                    print(err.localizedDescription)
//                }
//            }
//        default:
//            print("Invalid subscriptionID: \(subscriptionId)")
//        }
//    }
//    
//    func handle(record: CKRecord, on viewController: UIViewController) {
//        switch record.recordType {
//        case CKBConstant.RecordType.Note:
//            let mainController = NotesViewController()
//            mainController.title = "Deep Notes"
//            mainController.deepLinkNote = Note(record: record)
//            let mainNavController = UINavigationController(rootViewController: mainController)
//            viewController.present(mainNavController, animated: true)
//            
//        default:
//            CKBAlert.showError(message: "No such record type: \(record.recordType)", on: viewController)
//        }
//    }
//}
//
//
