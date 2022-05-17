//
//  PostsVK.swift
//  Navigation
//
//  Created by Vadim on 16.05.2022.
//

import Foundation
import iOSIntPackage

struct PostsVK {
    var postsArray =
    [
        PostVK(author: "Houston Rockets",
               description: "The Houston Rockets currently have the worst record in the league at 17-51, which is a half-game worse (or better depending on how you look at it) than the Orlando Magic. Once you get to this point in a season where you aren't competing for a playoff spot, you have to start evaluating your current roster to see what you have for the following season.",
               image: "Rockets",
               likes: 17202,
               views: 164606,
               filter: .bloom(intensity: 0.8)),
        PostVK(author: "Boston Celtics",
               description: "You would be hard-pressed to find a fan of the NBA who did not believe Boston Celtics All-Star forward Jayson Tatum should not be described as a star — for good reason given the numbers the St. Louis native has put up in this and recent seasons.",
               image: "Celtics",
               likes: 3349,
               views: 45707,
               filter: .sepia(intensity: 0.8)),
        PostVK(author: "New York Knicks",
               description: "«The New York Knicks (29-40) enjoyed a rare blowout win Wednesday, shoving the Portland Trail Blazers in a locker in a 128-98 smackdown. Looking to build off that momentum, the Knicks will welcome a Washington Wizards (29-39) team that has all but given up on this season. The Wizards come in losers of their last five games and remain without their star, Bradley Beal, who they lost for the season.",
               image: "Knicks",
               likes: 9908,
               views: 76654,
               filter: .fade),
        PostVK(author: "Phoenix Suns",
               description: "Встречайте! МилThe Phoenix Suns are currently off to their best start in franchise history as they sit atop the NBA with a 56-14 record. They have the top seed in the West all but locked up, and the best record in all the land by an 8-game margin. There are numerous reasons why this has occurred; from team cohesion to organic chemistry, from offensive firepower to depth, from clutch time performance to defensive intensity.",
               image: "Suns",
               likes: 3309,
               views: 56522,
               filter: .colorInvert)
    ]
}
