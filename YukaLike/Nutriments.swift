//
//  Nutriments.swift
//  YukaLike
//
//  Created by Joanna Vigné on 10/10/2022.
//

import Foundation


struct Nutriments: Decodable {
    let carbohydrates100g: Decimal
    let carbohydratesUnit: String
    let energyKcal100g: Decimal
    let energyKcalUnit: String
    let fat100g: Decimal
    let fatUnit: String
    let fiber100g: Decimal
    let fiber_unit: String
    let fruitsVegetablesNutsEstimateFromIngredients100g: Decimal
    let nutritionScoreFr100g: Decimal
    let proteins100g: Decimal
    let proteinsUnit: String
    let salt100g: Decimal
    let saltUnit: String
    let saturatedFat100g: Decimal
    let saturatedFatUnit: String
    let sodium100g: Decimal
    let sodiumUnit: String
    let sugars100g: Decimal
    let sugarsUnit: String
    
    enum CodingKeys: String, CodingKey {
        case carbohydrates100g = "carbohydrates_100g"
        case carbohydratesUnit = "carbohydrates_unit"
        case energyKcal100g = "energy-kcal_100g"
        case energyKcalUnit = "energy-kcal_unit"
        case fat100g = "fat_100g"
        case fatUnit = "fat_unit"
        case fiber100g = "fiber_100g"
        case fiber_unit = "fiber_unit"
        case fruitsVegetablesNutsEstimateFromIngredients100g = "fruits-vegetables-nuts-estimate-from-ingredients_100g"
        case nutritionScoreFr100g = "nutrition-score-fr_100g"
        case proteins100g = "proteins_100g"
        case proteinsUnit = "proteins_unit"
        case salt100g = "salt_100g"
        case saltUnit = "salt_unit"
        case saturatedFat100g = "saturated-fat_100g"
        case saturatedFatUnit = "saturated-fat_unit"
        case sodium100g = "sodium_100g"
        case sodiumUnit = "sodium_unit"
        case sugars100g = "sugars_100g"
        case sugarsUnit = "sugars_unit"
    }
}
