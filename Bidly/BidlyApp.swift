//
//  BidlyApp.swift
//  Bidly
//
//  Created by Vincent Hunter on 5/10/26.
//

import SwiftUI
import Firebase

@main
struct BidlyApp: App {
    
    init () {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}
