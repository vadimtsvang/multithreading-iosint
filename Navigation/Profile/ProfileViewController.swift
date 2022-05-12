//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Vadim on 31.01.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private let profileHeaderView = ProfileHeaderView()
    private var posts = [Post]()
    private let tableView = UITableView()
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        configureUI()
        configureLayout()
        appendPosts()
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "Cell")
        showUser()
    }
    
    private func configureUI() {
        view.backgroundColor = .lightGray
        view.addSubviews(profileHeaderView, tableView)
    }
    
    private func configureLayout() {
        profileHeaderView.toAutoLayout()
        tableView.toAutoLayout()
        tableView.delegate = self
        tableView.dataSource = self
        
        NSLayoutConstraint.activate([
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: profileHeaderView.bottomAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func appendPosts() {
        posts.append(.init(author: "Houston Rockets", description: "The Houston Rockets currently have the worst record in the league at 17-51, which is a half-game worse (or better depending on how you look at it) than the Orlando Magic. Once you get to this point in a season where you aren't competing for a playoff spot, you have to start evaluating your current roster to see what you have for the following season.", image: "Rockets", likes: 3412, views: 11390))
        posts.append(.init(author: "Boston Celtics", description: "You would be hard-pressed to find a fan of the NBA who did not believe Boston Celtics All-Star forward Jayson Tatum should not be described as a star — for good reason given the numbers the St. Louis native has put up in this and recent seasons.", image: "Celtics", likes: 2188, views: 8756))
        posts.append(.init(author: "New York Knicks", description: "The New York Knicks (29-40) enjoyed a rare blowout win Wednesday, shoving the Portland Trail Blazers in a locker in a 128-98 smackdown. Looking to build off that momentum, the Knicks will welcome a Washington Wizards (29-39) team that has all but given up on this season. The Wizards come in losers of their last five games and remain without their star, Bradley Beal, who they lost for the season.", image: "Knicks", likes: 4389, views: 7998))
        posts.append(.init(author: "Phoenix Suns", description: "The Phoenix Suns are currently off to their best start in franchise history as they sit atop the NBA with a 56-14 record. They have the top seed in the West all but locked up, and the best record in all the land by an 8-game margin. There are numerous reasons why this has occurred; from team cohesion to organic chemistry, from offensive firepower to depth, from clutch time performance to defensive intensity.", image: "Suns", likes: 1190, views: 3879))
    }
    
    @objc func buttonClicked() {
        //      print(statusTextField.text ?? "No text")
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView (_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView (_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PostTableViewCell
        let post = posts[indexPath.row]
        cell.configure(with:post)
        self.tableView.rowHeight = UITableView.automaticDimension
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.rowHeight
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
