//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Vadim on 18.03.2022.
//

import UIKit
import iOSIntPackage

class PostTableViewCell: UITableViewCell {
    
    private var imageProcessor = ImageProcessor()
    
    var post: PostVK? {
        didSet {
            if let post = post {
                authorLabel.text = post.author
                descriptionLabel.text = post.description
                
                if let image = UIImage(named: post.image) {
                    imageProcessor.processImage(sourceImage: image, filter: post.filter) {
                        image in postImage.image = image
                    }
                }
                
                switch post.likes {
                case 0..<1000:
                    likesLabel.text = "Likes: \(post.likes)"
                case 1_000..<1000_000:
                    likesLabel.text = "Likes: \(post.likes / 1_000)K"
                case 1_000_000... :
                    likesLabel.text = "Likes: \(post.likes / 1_000_000)Kk"
                default:
                    break
                }
                
                switch post.views {
                case 0..<1000:
                    viewsLabel.text = "Views: \(post.views)"
                case 1_000..<1000_000:
                    viewsLabel.text = "Views: \(post.views / 1_000)K"
                case 1_000_000... :
                    viewsLabel.text = "Views: \(post.views / 1_000_000)Kk"
                default:
                    break
                }
            }
        }
    }
    
    private var authorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 20)
        label.toAutoLayout()
        label.numberOfLines = 2
        label.textAlignment = .left
        return label
    }()
    
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 14)
        label.toAutoLayout()
        label.numberOfLines = 0
        return label
    }()
    
    private var postImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .black
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.toAutoLayout()
        return imageView
    }()
    
    private var likesLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .left
        label.toAutoLayout()
        return label
    }()
    
    private var viewsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .right
        label.toAutoLayout()
        return label
    }()
    
    private var baseInset: CGFloat { return 16 }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PostTableViewCell {
    private func setupViews() {
        [authorLabel, descriptionLabel, postImage, likesLabel, viewsLabel].forEach {contentView.addSubview ($0)}
    }
}
        
extension PostTableViewCell {
    private func setupConstraints() {
        [
            
            authorLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            authorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            authorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            authorLabel.heightAnchor.constraint(equalToConstant: 40),
            
            postImage.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 16),
            postImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            postImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            postImage.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            postImage.heightAnchor.constraint(equalTo: postImage.widthAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 100),
            
            likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            likesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            likesLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            likesLabel.heightAnchor.constraint(equalToConstant: 60),
                    
            viewsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            viewsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            viewsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            viewsLabel.heightAnchor.constraint(equalToConstant: 60)
        ]
        .forEach {$0.isActive = true}
    }
}
