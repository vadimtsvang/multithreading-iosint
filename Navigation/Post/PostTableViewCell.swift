//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Vadim on 18.03.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    var viewModel: PostTableViewModel? {
        willSet(viewModel) {
            guard let viewModel = viewModel else {
                return
            }
            postTitle.text = viewModel.title
            postDescription.text = viewModel.description
            postImage.image = UIImage(named: viewModel.image)
            postLikes.text = "Likes: \(viewModel.likes)"
            postViews.text = "Views: \(viewModel.views)"
        }
    }

    var postTitle: UILabel = {
        let postTitle = UILabel()
        postTitle.toAutoLayout()
        postTitle.font =  .systemFont(ofSize: 20, weight: .bold)
        postTitle.textColor = .black
        postTitle.numberOfLines = 2
        return postTitle
    }()

    var postImage: UIImageView = {
        let postImage = UIImageView()
        postImage.toAutoLayout()
        postImage.backgroundColor = .black
        postImage.contentMode = .scaleAspectFit
        return postImage
    }()

    var postDescription: UILabel = {
        let postDescription = UILabel()
        postDescription.toAutoLayout()
        postDescription.font = UIFont.systemFont(ofSize: 14)
        postDescription.textColor = .systemGray
        postDescription.numberOfLines = 0
        return postDescription
    }()

    var postLikes: UILabel = {
        let postLikes = UILabel()
        postLikes.toAutoLayout()
        postLikes.font = .systemFont(ofSize: 16)
        postLikes.textColor = .black
        return postLikes
    }()

    var postViews: UILabel = {
        let postViews = UILabel()
        postViews.toAutoLayout()
        postViews.font = .systemFont(ofSize: 16)
        postViews.textColor = .black
        return postViews
    }()

    private func setupConstraints() {
        NSLayoutConstraint.activate([

            postTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            postTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            postTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            postImage.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            postImage.heightAnchor.constraint(equalTo: postImage.widthAnchor),
            postImage.topAnchor.constraint(equalTo: postTitle.bottomAnchor, constant: 16),

            postDescription.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 16),
            postDescription.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            postDescription.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            postLikes.topAnchor.constraint(equalTo: postDescription.bottomAnchor, constant: 16),
            postLikes.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            postLikes.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),

            postViews.topAnchor.constraint(equalTo: postDescription.bottomAnchor, constant: 16),
            postViews.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            postViews.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubviews(postTitle, postImage, postDescription, postLikes, postViews)
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
