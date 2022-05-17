//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Vadim on 31.01.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let userService: UserService
    let userName: String
    
    init(userService: UserService, userName: String) {
        self.userService = userService
        self.userName = userName
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.toAutoLayout()
        return tableView
    }()
    
    private let profileHeaderView = ProfileHeaderView()
    //private var posts = [PostVK]()
    let postID = String(describing: PostTableViewCell.self)
    let photosID = String(describing: PhotosTableViewCell.self)
    private var arrayOFPosts = PostsVK().postsArray
    
    let closeButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage (systemName: "xmark.circle.fill"), for: .normal)
        button.tintColor = .lightGray
        button.alpha = 0
        button.addTarget(self, action: #selector(tapOnСloseButton), for: .touchUpInside)
        button.toAutoLayout()
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        
        #if DEBUG
        profileHeaderView.backgroundColor = .yellow
        #else
        profileHeaderView.backgroundColor = .white
        #endif
        setupViews()
        setupConstraints()
        setupHideKeyboardOnTap()
        
        let tapOnAvatar = UITapGestureRecognizer(target: self, action: #selector(avatarOnTap))
        profileHeaderView.avatarImageView.isUserInteractionEnabled = true
        profileHeaderView.avatarImageView.addGestureRecognizer(tapOnAvatar)
        
        setupViewCloseButton()
        setupCloseButtonConstraints()
        showUser()
    }
    
    private func configureUI() {
        view.backgroundColor = .lightGray
        view.addSubviews(profileHeaderView, tableView)
    }
    
    @objc func buttonClicked() {
        //      print(statusTextField.text ?? "No text")
    }
}

extension ProfileViewController {
    private func setupViews() {
        
        view.addSubview(tableView)
        
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: postID)
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: photosID)
        
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension ProfileViewController {
    private func showUser() {
        if let user = userService.addUser(userName: userName) {
            profileHeaderView.fullNameLabel.text = user.userName
            profileHeaderView.statusLabel.text = user.userStatus
            profileHeaderView.avatarImageView.image = user.userAvatar
        }
    }
}

extension ProfileViewController {
    private func setupConstraints() {
        [
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        .forEach {$0.isActive = true}
    }
}

extension ProfileViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOFPosts.count + 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell: PhotosTableViewCell = tableView.dequeueReusableCell(withIdentifier: photosID, for: indexPath) as! PhotosTableViewCell
            return cell
        } else {
            let cell: PostTableViewCell = tableView.dequeueReusableCell(withIdentifier: postID, for: indexPath) as! PostTableViewCell
        cell.post = arrayOFPosts[indexPath.row - 1]
            return cell
        }
    }
}

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let photosVC = PhotosViewController()
            navigationController?.pushViewController(photosVC, animated: true)
            tableView.deselectRow(at: indexPath, animated: true)
        } else {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            guard section == 0 else { return nil }
            return profileHeaderView
    }
}

extension ProfileViewController {
    func setupHideKeyboardOnTap() {
        view.addGestureRecognizer(self.endEditingRecognizer())
        navigationController?.navigationBar.addGestureRecognizer(self.endEditingRecognizer())
    }

    private func endEditingRecognizer() -> UIGestureRecognizer {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(self.view.endEditing(_:)))
        tap.cancelsTouchesInView = false
        return tap
    }
}

extension ProfileViewController {
    func setupViewCloseButton() {
        view.addSubview(closeButton)
    }
}

extension ProfileViewController {
    func setupCloseButtonConstraints() {
        [
            closeButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10),
            closeButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            closeButton.widthAnchor.constraint(equalToConstant: 25),
            closeButton.heightAnchor.constraint(equalToConstant: 25)
        ]
        .forEach {$0.isActive = true}
    }
}

private let originalTransform = ProfileHeaderView().avatarImageView.transform

extension ProfileViewController {
    @objc func avatarOnTap() {
        UIView.animateKeyframes(withDuration: 0.5, delay: 0, options: [.calculationModeCubicPaced], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.3) {
               
               self.tableView.isScrollEnabled = false
               self.tableView.allowsSelection = false

               self.profileHeaderView.avatarImageView.center = self.view.center
               let scaleFactor = self.view.bounds.width / self.profileHeaderView.avatarImageView.bounds.width
               self.profileHeaderView.avatarImageView.transform = self.profileHeaderView.avatarImageView.transform.scaledBy(x: scaleFactor, y: scaleFactor)
               self.profileHeaderView.avatarImageView.layer.borderWidth = 0
               self.profileHeaderView.avatarImageView.layer.cornerRadius = 0
               
               self.profileHeaderView.animationView.transform = CGAffineTransform(scaleX: 1, y: 1)
               self.profileHeaderView.animationView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
               self.profileHeaderView.animationView.alpha = 0.75
            }
           UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.2) {
               self.closeButton.alpha = 1
           }
        })
    }
}

extension ProfileViewController {
    @objc func tapOnСloseButton() {
        UIView.animateKeyframes(withDuration: 0.5, delay: 0, options: [.calculationModeCubicPaced], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.3) {
                self.closeButton.alpha = 0
            }
            UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.2) {
                self.profileHeaderView.avatarImageView.transform = originalTransform
                self.profileHeaderView.avatarImageView.frame = CGRect(x: 16, y: 16, width: 110, height: 110)
                self.profileHeaderView.avatarImageView.layer.cornerRadius = 45
                self.profileHeaderView.avatarImageView.layer.borderWidth = 3
                
                self.profileHeaderView.animationView.frame = CGRect(x: 16, y: 16, width: 110, height: 110)
                self.profileHeaderView.animationView.transform = CGAffineTransform(scaleX: 1, y: 1)
                self.profileHeaderView.animationView.alpha = 0
                
                self.tableView.allowsSelection = true
                self.tableView.isScrollEnabled = true
            }
        })
    }
}
