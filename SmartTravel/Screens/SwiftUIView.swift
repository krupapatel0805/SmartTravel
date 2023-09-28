//
//  SwiftUIView.swift
//  Group#3
//
//  Created by MEGH SHAH on 2023-09-28.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct HomeView: View {
    @State private var listings: [Listing] = [] // Store retrieved listings data
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Explore Places to Stay")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 30)
                
                Spacer()
                
                ScrollView {
                    VStack(spacing: 20) {
                        ForEach(listings, id: \.id) { listing in
                            ListingCardView(listing: listing)
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .navigationBarTitle("Airbnb", displayMode: .automatic)
        }
        .onAppear {
            fetchListingsFromFirestore()
        }
    }
    
    func fetchListingsFromFirestore() {
        let db = Firestore.firestore()
        db.collection("listings").getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
            } else {
                if let documents = querySnapshot?.documents {
                    self.listings = documents.compactMap { queryDocumentSnapshot in
                        try? queryDocumentSnapshot.data(as: Listing.self)
                    }
                }
            }
        }
    }
}

