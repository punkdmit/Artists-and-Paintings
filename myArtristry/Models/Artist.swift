//
//  Artist.swift
//  myArtristry
//
//  Created by Dmitry Apenko on 29.06.2022.
//

import UIKit

struct Artist: Codable {
    var name: String
    var bio: String
    var image: String
    var works: [Work]
    
    private enum CodingKeys: String, CodingKey {
        case name
        case bio
        case image
        case works
    }
}





