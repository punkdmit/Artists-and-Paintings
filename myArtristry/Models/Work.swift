//
//  Work.swift
//  myArtristry
//
//  Created by Dmitry Apenko on 29.06.2022.
//

import UIKit

struct Work: Codable {
    var title: String
    var image: String
    var info: String
    
    private enum CodingKeys: String, CodingKey {
        case title
        case image
        case info
    }
}
