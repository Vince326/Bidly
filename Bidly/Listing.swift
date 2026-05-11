//
//  Listing.swift
//  Bidly
//
//  Created by Vincent Hunter on 5/10/26.
//

import Foundation

struct Listing: Identifiable {
    let id: String
    let itemName: String
    let sellerName: String
    let currentBid: Double
    let imageName: String
}
