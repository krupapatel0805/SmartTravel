//
//  ListingCardView.swift
//  Group#3
//
//  Created by MEGH SHAH on 2023-09-28.
//

import SwiftUI

import SwiftUI

struct ListingCardView: View {
    var listing: Listing

    var body: some View {
        VStack(alignment: .leading) {
            Image(listing.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .cornerRadius(10)

            Text(listing.title)
                .font(.headline)
                .fontWeight(.bold)

            Text(listing.location)
                .foregroundColor(.gray)
                .font(.subheadline)

            Text("$\(listing.price) / night")
                .font(.headline)
                .fontWeight(.semibold)
        }
        .padding(.horizontal)
    }
}

struct ListingCardView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleListing = Listing(title: "Sample Listing", location: "Sample Location", imageName: "sample_image", price: 100)
        return ListingCardView(listing: sampleListing)
    }
}
