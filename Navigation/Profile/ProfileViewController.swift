//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Vadim on 31.01.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var userService: UserServiceProtocol
    var userLogin: String
    private let coordinator: ProfileCoordinator?
    private let viewModel: ProfileViewModelProtocol?
    var timeSeconds = 11 {
        didSet {
            ProfileHeaderView.timerLabel.text = String(timeSeconds)
        }
    }
    
    init(coordinator: ProfileCoordinator?,
         viewModel: ProfileViewModelProtocol?,
         userService: UserServiceProtocol,
         userLogin: String) {
        self.coordinator = coordinator
        self.viewModel = viewModel
        self.userService = userService
        self.userLogin = userLogin
    
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static var postTableView: UITableView = {
        let postTableView = UITableView(frame: .zero, style: .grouped)
        postTableView.toAutoLayout()
        postTableView.register(PostTableViewCell.self, forCellReuseIdentifier: String(describing: PostTableViewCell.self))
        postTableView.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: String(describing: ProfileHeaderView.self))
        postTableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: String(describing: PhotosTableViewCell.self))
        postTableView.separatorInset = .zero
        return postTableView
    }()
    
    private func setupConstaintTableView() {
        NSLayoutConstraint.activate([
            ProfileViewController.postTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            ProfileViewController.postTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            ProfileViewController.postTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            ProfileViewController.postTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Profile"
        view.backgroundColor = .systemGray6
        view.addSubviews(ProfileViewController.postTableView)
        setupConstaintTableView()
        ProfileViewController.postTableView.dataSource = self
        ProfileViewController.postTableView.delegate = self
        ProfileViewController.postTableView.refreshControl = UIRefreshControl()
        ProfileViewController.postTableView.refreshControl?.addTarget(self, action: #selector(reloadTableView), for: .valueChanged)
        timer()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    @objc func reloadTableView() {
        ProfileViewController.postTableView.reloadData()
        ProfileViewController.postTableView.refreshControl?.endRefreshing()
    }
    
    func timer() {
        let timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] timer in
            guard let self = self else { return }
            self.timeSeconds -= 1
            if self.timeSeconds == 0 {
                timer.invalidate()
                ProfileHeaderView.timerLabel.isHidden = true
            }
        }
    }
    
    func reload() {
        var timerSecond = 11
        DispatchQueue.global(qos: .utility).async {
            let timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                timerSecond -= 1
                if timerSecond == 0 {
                    DispatchQueue.main.async {
                        ProfileViewController.postTableView.reloadData()
                    }
                }
            }
            RunLoop.current.add(timer, forMode: .common)
            RunLoop.current.run()
        }
    }
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            return viewModel?.numberOfRows() ?? 0
        } else {
            return 1
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 1 {
            let cell = ProfileViewController.postTableView.dequeueReusableCell(withIdentifier: String(describing: PostTableViewCell.self), for: indexPath) as? PostTableViewCell
            guard let tableViewCell = cell, let viewModel = viewModel else { return UITableViewCell() }
            let cellViewModel = viewModel.cellViewModel(forIndexPath: indexPath)
            tableViewCell.viewModel = cellViewModel
            
            return tableViewCell
            
        } else {
            let cell = ProfileViewController.postTableView.dequeueReusableCell(withIdentifier: String(describing: PhotosTableViewCell.self), for: indexPath) as! PhotosTableViewCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        guard section == 0 else { return nil }
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: String(describing: ProfileHeaderView.self)) as! ProfileHeaderView
        if let user = userService.getUser(login: userLogin) {
            headerView.currentUser(user: user)
        }
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 220
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            tableView.deselectRow(at: indexPath, animated: false)
        } else {
            tableView.deselectRow(at: indexPath, animated: false)
            let photosViewController = PhotosViewController()
            navigationController?.pushViewController(photosViewController, animated: true)
        }
        reload()
    }
}
