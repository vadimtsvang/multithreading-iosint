//
//  ProfileViewModel.swift
//  Navigation
//
//  Created by Vadim on 16.05.2022.
//

import Foundation

protocol ProfileViewModelProtocol {

    func numberOfRows() throws -> Int?
    func cellViewModel(forIndexPath indexPath: IndexPath) -> PostTableViewModel
    var postArray: [Post] { get set }
}

final class ProfileViewModel: ProfileViewModelProtocol {
    func numberOfRows() throws -> Int? {
        if postArray.count != 0 {
            return postArray.count
        } else {
            throw AuthorizationError.badAuthData
        }
    }
    
    public var postArray: [Post] = [
        Post(title: "Houston Rockets",
             description: "The Houston Rockets currently have the worst record in the league at 17-51, which is a half-game worse (or better depending on how you look at it) than the Orlando Magic. Once you get to this point in a season where you aren't competing for a playoff spot, you have to start evaluating your current roster to see what you have for the following season.",
             image: "rockets",
             likes: 3098,
             views: 10429),

        Post(title: "Boston Celtics",
             description: "You would be hard-pressed to find a fan of the NBA who did not believe Boston Celtics All-Star forward Jayson Tatum should not be described as a star — for good reason given the numbers the St. Louis native has put up in this and recent seasons.",
             image: "celtics",
             likes: 1290,
             views: 6701),

        Post(title: "New York Knicks",
             description: "«The New York Knicks (29-40) enjoyed a rare blowout win Wednesday, shoving the Portland Trail Blazers in a locker in a 128-98 smackdown. Looking to build off that momentum, the Knicks will welcome a Washington Wizards (29-39) team that has all but given up on this season. The Wizards come in losers of their last five games and remain without their star, Bradley Beal, who they lost for the season.",
             image: "knicks",
             likes: 978,
             views: 5090),

        Post(title: "Phoenix Suns",
             description: "The Phoenix Suns are currently off to their best start in franchise history as they sit atop the NBA with a 56-14 record. They have the top seed in the West all but locked up, and the best record in all the land by an 8-game margin. There are numerous reasons why this has occurred; from team cohesion to organic chemistry, from offensive firepower to depth, from clutch time performance to defensive intensity.",
             image: "suns",
             likes: 899,
             views: 3790)
    ]

//    func numberOfRows() -> Int? {
//        return postArray.count
//    }
    
//    func numberOfRows() throws -> Int {
//        if postArray.count != 0 {
//            return postArray.count
//        } else {
//            throw AuthorizationErrors.badAuthData
//        }
//    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> PostTableViewModel {
        let post = postArray[indexPath.row]
        return PostTableViewModel(post: post)
    }
}

