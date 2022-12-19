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

    static let coca = Product(
        code: "04963406",
        imageUrl: "https://images.openfoodfacts.org/images/products/04963406/front_en.71.400.jpg",
        imageSmallUrl: "https://images.openfoodfacts.org/images/products/04963406/front_en.71.200.jpg",
        productName: "Coca-Cola",
        lastModified: Date(timeIntervalSince1970: TimeInterval(1664880431)),
        brands: "Häagen-Dazs",
        nutriments: Nutriments(
            carbohydrates100g: 11.8182,
            carbohydratesUnit: "g",
            energyKcal100g: 42.4242,
            energyKcalUnit: "kcal",
            fat100g: 0,
            fatUnit: "g",
            fiber100g: 0,
            fiber_unit: "g",
            fruitsVegetablesNutsEstimateFromIngredients100g: 0,
            nutritionScoreFr100g: 14,
            proteins100g: 0,
            proteinsUnit: "g",
            salt100g: 0.034091,
            saltUnit: "g",
            saturatedFat100g: 0,
            saturatedFatUnit: "g",
            sodium100g: 0.0136364,
            sodiumUnit: "g",
            sugars100g: 11.8182,
            sugarsUnit: "g"
        ),
        additivesN: 2
    )
}
