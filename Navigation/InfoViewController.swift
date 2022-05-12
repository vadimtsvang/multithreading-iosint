//
//  InfoViewController.swift
//  Navigation
//
//  Created by Vadim on 25.02.2022.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        makeMoreButton()
    }
    
    private func makeMoreButton() {
        let button = UIButton(frame: CGRect(x: 100, y: 300, width: 200, height: 50))
        button.setTitle("One more time", for: .normal)
        view.addSubview(button)
        button.addTarget(self, action: #selector(tapAlert), for: .touchUpInside)
    }
    
    @objc func tapAlert() {
        
        let vcAlert = UIAlertController(title: "Error", message: "You are wrong", preferredStyle: .alert)
        let action = UIAlertAction(title: "Okay", style: .default) { actionTap in
            print("OkAction")
        }
        let actionTwo = UIAlertAction(title: "Cancel", style: .cancel) { actionTap in
            print("CancelAction")
        }
        vcAlert.addAction(action)
        vcAlert.addAction(actionTwo)
        present(vcAlert, animated: true, completion: nil)
    }
}
