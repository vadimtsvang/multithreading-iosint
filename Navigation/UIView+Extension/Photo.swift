//
//  Photo.swift
//  Navigation
//
//  Created by Vadim on 16.05.2022.
//

import UIKit

var arrayPhotos: [UIImage] = []

func appendArrayPhotos() {
    for i in (1...21).shuffled() {
        arrayPhotos.append(((UIImage(named: "\(i)") ?? UIImage(named: "error"))!))
    }
}
