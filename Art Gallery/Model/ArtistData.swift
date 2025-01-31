//
//  ArtistData.swift
//  Art Gallery
//
//  Created by Alexander Bokhulenkov on 31.01.2025.
//

import Foundation

struct Artists: Codable {
    let artists: [Artist]
}

struct Artist: Codable {
    let name: String
    let bio: String
    let image: String
    let works: [Work]
}

struct Work: Codable {
    let title: String
    let image: String
    let info: String
}
