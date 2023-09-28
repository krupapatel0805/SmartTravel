//
//  File.swift
//  Group#3
//
//  Created by MEGH SHAH on 2023-09-28.
//

import Foundation
import Foundation
import FirebaseFirestoreSwift

struct Listing: Identifiable, Codable {
    @DocumentID var id: String?
    var title: String
    var location: String
    var imageName: String
    var price: Int

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case location
        case imageName
        case price
    }
    
    init(id: String? = nil, title: String, location: String, imageName: String, price: Int) {
        self.id = id
        self.title = title
        self.location = location
        self.imageName = imageName
        self.price = price
    }
}



