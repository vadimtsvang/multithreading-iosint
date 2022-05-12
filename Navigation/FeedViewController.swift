//
//  FeedViewController.swift
//  Navigation
//
//  Created by Vadim on 31.01.2022.
//

import UIKit
import StorageService

class FeedViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeNextButton()
    }
    
    func makeNextButton() {
        let button = UIButton(frame: CGRect(x: 100, y: 300, width: 200, height: 50))
        button.setTitle("Next", for: .normal)
        view.addSubview(button)
        button.addTarget(self, action: #selector(nextTap), for: .touchUpInside)
    }
    
    @objc func nextTap() {
        let vc = PostViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

