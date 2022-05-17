//
//  PostViewController.swift
//  Navigation
//
//  Created by Vadim on 03.02.2022.
//

import UIKit

class PostViewController: UIViewController {
    
    var post = Post(title: "")
    var buttonInfo = UIBarButtonItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = post.title
        view.backgroundColor = .brown
        
        let barButton = UIBarButtonItem(barButtonSystemItem: .organize, target: self, action: #selector(tapInfo))
        navigationItem.rightBarButtonItem = barButton
    }
    
    @objc func tapInfo() {
        let vcInfo = InfoViewController()
        present(vcInfo, animated: true, completion: nil)
    }
}

