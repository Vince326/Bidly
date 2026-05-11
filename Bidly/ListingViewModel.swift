//
//  ListingViewModel.swift
//  Bidly
//
//  Created by Vincent Hunter on 5/10/26.
//

import Foundation
import FirebaseFirestore
internal import Combine

class ListingViewModel: ObservableObject {
    @Published var listings: [Listing] = []
    
    private var db = Firestore.firestore()
    
    func fetchListings() {
        db.collection("listings").getDocuments { snapshot, error in
            if let error = error {
                print("Error fetching listings: \(error)")
                return
            }
            
            guard let documents = snapshot?.documents else { return }
            
            DispatchQueue.main.async {
                self.listings = documents.compactMap { doc -> Listing? in
                    let data = doc.data()
                    guard
                        let itemName = data["itemName"] as? String,
                        let sellerName = data["sellerName"] as? String,
                        let currentBid = data["currentBid"] as? Double,
                        let imageName = data["imageName"] as? String
                    else { return nil }
                    
                    return Listing(id: doc.documentID,
                                   itemName: itemName, sellerName: sellerName,
                                   currentBid: currentBid, imageName: imageName)
                    
                }
            }
        }
    }
}
