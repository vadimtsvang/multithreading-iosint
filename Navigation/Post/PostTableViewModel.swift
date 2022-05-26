//
//  PostTableViewModel.swift
//  Navigation
//
//  Created by Vadim on 24.05.2022.
//

import Foundation

struct PostTableViewModel {

    var post: Post

    var title: String {
        return post.title
    }

    var description: String {
        return post.description
    }

    var image: String {
        return post.image
    }
    var likes: UInt {
        return post.likes
    }

    var views: UInt {
        return post.views
    }
}

