//
//  RestProductResponse.swift
//  YukaLike
//
//  Created by Joanna Vigné on 06/10/2022.
//

import Foundation

struct ProductResponse: Decodable {
    let code: String
    let product: Product?
    let status: Int
    let statusVerbose: String
    
    enum CodingKeys: String, CodingKey {
        case code
        case product
        case status
        case statusVerbose = "status_verbose"
    }
}
