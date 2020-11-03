//
//  UIView+.swift
//  CloudKitBossDemo
//
//  Created by Alex Nagy on 03/11/2020.
//

import UIKit

public extension UIView {
    func edgeTo(_ view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func pinToTop(of view: UIView, height: CGFloat = 100) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
        leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12).isActive = true
        trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12).isActive = true
        topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12).isActive = true
    }
    
    func pinToBottom(of view: UIView, height: CGFloat = 100) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
        leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topAnchor.constraint(equalTo: view.bottomAnchor, constant: 12).isActive = true
    }
}

