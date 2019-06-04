//
//  ThirdViewController.swift
//  SafeArea Tutorial
//
//  Created by Mohammad Arafat Hossain on 3/06/19.
//  Copyright © 2019 Mohammad Arafat Hossain. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    override func loadView() {
        super.loadView()
        
        label1.translatesAutoresizingMaskIntoConstraints =  false
        label2.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            label1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            label1.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            label2.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            label2.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            label2.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
        additionalSafeAreaInsets.top = 20.0
        additionalSafeAreaInsets.left = 16.0
        additionalSafeAreaInsets.bottom = 20.0
        additionalSafeAreaInsets.right = 16.0
    }
}
