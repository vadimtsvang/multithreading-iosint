//
//  Post.swift
//  Navigation
//
//  Created by Vadim on 25.02.2022.
//

import UIKit

public struct Post {
   public let author: String
    public let description: String
    public let image: String
    public let likes: Int
    public let views: Int
    
    public init(author: String, description: String, image: String, likes: Int, views: Int) {
        self.author = author
        self.description = description
        self.image = image
        self.likes = likes
        self.views = views
    }
}
