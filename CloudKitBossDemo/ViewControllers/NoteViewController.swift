//
//  NoteViewController.swift
//  CloudKitBossDemo
//
//  Created by Alex Nagy on 03/11/2020.
//

import UIKit

protocol NoteViewControllerDelegate {
    func didAdd(_ note: Note, categories: [Category])
    func didChange(_ note: Note, categories: [Category])
}

class NoteViewController: UIViewController {
    
    var isShared = false
    
    var note: Note?
    private var category: Category?
    var categories: [Category] = []
    
    var noteImage: Data?
    
    var delegate: NoteViewControllerDelegate?
    
    lazy var categoryBarButtonItem: UIBarButtonItem = {
        let button = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(handleCategory))
        return button
    }()
    
    lazy var imageBarButtonItem: UIBarButtonItem = {
        let button = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(handleImage))
        return button
    }()
    
    lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Category: nil"
        return label
    }()
    
    lazy var noteTextView: UITextView = {
        let textView = UITextView()
        textView.layer.borderColor = UIColor.lightGray.cgColor
        textView.layer.borderWidth = 0.5
        textView.layer.cornerRadius = 5
        textView.font = UIFont.systemFont(ofSize: 17)
        
        textView.delegate = self
        return textView
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = .systemGray5
        return imageView
    }()
    
    lazy var saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Save Note", for: .normal)
        button.addTarget(self, action: #selector(handleSave), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        getCategory()
        setupNavigation()
        setupViews()
        fetchData()
    }
    
    fileprivate func getCategory() {
        categories.forEach { category in
            if category.recordName == note?.parentRecordName {
                setCategory(category)
            }
        }
    }
    
    fileprivate func setCategory(_ category: Category) {
        self.category = category
        categoryLabel.text = "Category: \(category.name)"
        enableDisableSaveBarButtonItem()
    }
    
    fileprivate func setupNavigation() {
        navigationItem.setRightBarButtonItems([categoryBarButtonItem, imageBarButtonItem], animated: false)
    }
    
    fileprivate func setupViews() {
        view.addSubview(categoryLabel)
        view.addSubview(noteTextView)
        view.addSubview(imageView)
        view.addSubview(saveButton)
        
        categoryLabel.pinToTop(of: view, height: 40)
        noteTextView.pinToBottom(of: categoryLabel)
        imageView.pinToBottom(of: noteTextView)
        saveButton.pinToBottom(of: imageView, height: 50)
        
        enableDisableSaveBarButtonItem()
        
    }
    
    fileprivate func fetchData() {
        guard let note = note else { return }
        noteTextView.text = note.text
        noteTextView.becomeFirstResponder()
        if let data = note.images?.first {
            imageView.image = UIImage(data: data)
            noteImage = data
        }
    }
    
    fileprivate func enableDisableSaveBarButtonItem() {
        saveButton.isEnabled = !noteTextView.text.isEmpty && imageView.image != nil && category != nil
    }
    
    @objc
    func handleCategory() {
        if categories.count != 0 {
            let alert = UIAlertController(title: "Choose Category", message: nil, preferredStyle: .actionSheet)
            
            categories.forEach { (category) in
                let action = UIAlertAction(title: category.name, style: .default) { (action) in
                    self.setCategory(category)
                }
                alert.addAction(action)
            }
            
            let addAction = UIAlertAction(title: "\(note != nil ? "Rename\(category != nil ? " '\(category!.name)'" : "")" : "Add new")", style: .default) { (action) in
                self.showAddNewCategoryAlert()
            }
            alert.addAction(addAction)
            
            let cancleAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
                self.showAddNewCategoryAlert()
            }
            alert.addAction(cancleAction)
            
            alert.popoverPresentationController?.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
            self.present(alert, animated: true, completion: nil)
        } else {
            showAddNewCategoryAlert()
        }
        
    }
    
    func showAddNewCategoryAlert() {
        let alert = UIAlertController(title: "Create Category", message: nil, preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Category name"
            textField.autocapitalizationType = .words
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            
        }
        alert.addAction(cancelAction)
        let confirmAction = UIAlertAction(title: "Save", style: .default) { (action) in
            if let categoryName = alert.textFields?.first?.text, categoryName != "" {
                self.useCategory(name: categoryName)
            }
        }
        alert.addAction(confirmAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func useCategory(name: String) {
        // TODO: 17 - useCategory
//        if let category = category {
//            let updatedCategory = Category(recordName: category.recordName, ownerName: category.ownerName, creationDate: category.creationDate, modificationDate: Date(), shareRecordName: category.shareRecordName, ownerFullName: category.ownerFullName, name: name)
//            CKRecordModelOperation.update(updatedCategory) { (result) in
//                switch result {
//                case .success(let category):
//                    self.category = category
//                    self.categories.append(category)
//                    self.setCategory(category)
//                case .failure(let err):
//                    CKBAlert.show(error: err, on: self)
//                }
//            }
//        } else {
//            let category = Category(name: name)
//
//            CKBOperation.save(category) { (result) in
//                switch result {
//                case .success(let category):
//                    self.category = category
//                    self.categories.append(category)
//                    self.setCategory(category)
//                case .failure(let err):
//                    CKBAlert.show(error: err, on: self)
//                }
//            }
//        }
    }
    
    @objc
    func handleSave() {
        // TODO: 18 - handleSave
//        guard let text = noteTextView.text, let noteImage = noteImage else {
//            return
//        }
//
//        if let note = note {
//            let changedNote = Note(recordName: note.recordName, ownerName: note.ownerName, creationDate: note.creationDate, modificationDate: Date(), shareRecordName: note.shareRecordName, parentRecordName: note.parentRecordName, parentRecordType: note.parentRecordType, text: text, images: [noteImage])
//            delegate?.didChange(changedNote, categories: categories)
//        } else {
//            var ownerName = CKManager.userRecordId?.recordName
//            if isShared {
//                ownerName = category?.ownerName
//            }
//            var newNote = Note(text: text, ownerName: ownerName)
//            newNote.parentRecordName = category?.recordName
//            newNote.parentRecordType = CKBConstant.RecordType.Category
//            newNote.images = [noteImage]
//            delegate?.didAdd(newNote, categories: categories)
//        }
//
//        navigationController?.popViewController(animated: true)
    }
    
    @objc
    func handleImage() {
        let controller = UIImagePickerController()
        controller.sourceType = .photoLibrary
        controller.delegate = self
        present(controller, animated: true)
    }
}

extension NoteViewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        enableDisableSaveBarButtonItem()
    }
    
}

extension NoteViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage else {
            // TODO: 19 - showInfo
//            CKBAlert.showInfo(message: "No image found", on: self)
            return
        }
        noteImage = image.jpegData(compressionQuality: 0.3)
        imageView.image = image
        enableDisableSaveBarButtonItem()
        picker.dismiss(animated: true, completion: nil)
    }
}
