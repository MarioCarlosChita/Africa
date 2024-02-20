//
//  VideoModel.swift
//  Africa
//
//  Created by Eliezer Antonio on 11/02/24.
//

import SwiftUI

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String

    // computed property

    var thumbnail: String {
        "video-\(id)"
    }
}
