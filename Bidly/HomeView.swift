//
//  ContentView.swift
//  Bidly
//
//  Created by Vincent Hunter on 5/10/26.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = ListingViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack (spacing: 16) {
                    ForEach(viewModel.listings) { listing in
                        ListingCardView(listing: listing)
                            
                    }
                }
                .padding()
            }
            .navigationTitle("Live Auctions")
            .background(Color(.systemGroupedBackground))
            .onAppear {
                viewModel.fetchListings()
            }
        }
    }
}

#Preview {
    HomeView()
}
