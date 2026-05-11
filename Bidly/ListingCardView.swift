//
//  ListingCardView.swift
//  Bidly
//
//  Created by Vincent Hunter on 5/10/26.
//

import SwiftUI

struct ListingCardView: View {
    let listing: Listing
    
    var body: some View {
        HStack(spacing: 16) {
            //Image Placeholder
            Image(systemName: listing.imageName)
                .resizable()
                .scaledToFit()
                .frame(width:70, height: 70)
                .padding(8)
                .background(Color(.systemGray6))
                .cornerRadius(12)
            
            VStack(alignment:.leading, spacing: 4) {
                Text(listing.itemName)
                    .font(.headline)
                
                Text("Sold By: \(listing.sellerName)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text("Current Bid: $\(listing.currentBid, specifier: "%.2f") ")
                    .font(.subheadline)
                    .foregroundColor(.green)
                    .bold()
            }
            Spacer()
            
        }
        .padding()
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.08), radius: 6, x: 0, y: 3)
    }
}
    
    #Preview {
        ListingCardView(listing: Listing(id: "preview123", itemName: "Vintage Baseball Card", sellerName: "Jim Johnson", currentBid: 33.00, imageName: "rectangle.portrait"))
    }

