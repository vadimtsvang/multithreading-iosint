//
//  AudioViewModel.swift
//  Navigation
//
//  Created by Vadim on 05.06.2022.
//

import UIKit

final class AudioViewModel {

    var audioLibrary: [(title: String, artist: String, url: URL?, image: String?)] = []

    init() {
        for i in nameAudioArray.enumerated() {
            let value = i.element
            audioLibrary.append((title: value.title,
                                 artist: value.artist,
                                 url: URL(fileURLWithPath: Bundle.main.path(forResource: value.url, ofType: "mp3")!),
                                 image : value.image))
        }

    }

    private var nameAudioArray: [Audio] = [
        Audio(title: "Don't Say Nuthin'", artist: "The Roots", url: "Roots1", image: "roots1"),
        Audio(title: "I Remember", artist: "The Roots", url: "Roots2", image: "roots2"),
        Audio(title: "How I Got Over", artist: "The Roots", url: "Roots3", image: "roots3"),
        Audio(title: "Here I Come", artist: "The Roots", url: "Roots4", image: "roots4"),
        Audio(title: "You Got Me", artist: "The Roots", url: "Roots5", image: "roots5")
    ]
}


