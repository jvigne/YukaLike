//
//  RestProduct.swift
//  YukaLike
//
//  Created by Joanna Vigné on 06/10/2022.
//

import Foundation

struct Product: Decodable {
    let code: String
    let imageUrl: String
    let imageSmallUrl: String
    let productName: String
    let lastModified: Date
    let brands: String
    let nutriments: Nutriments
    let additivesN: Int
    
    enum CodingKeys: String, CodingKey {
        case code
        case imageUrl = "image_url"
        case imageSmallUrl = "image_small_url"
        case productName = "product_name"
        case lastModified = "last_modified_t"
        case brands
        case nutriments
        case additivesN = "additives_n"
    }
}
