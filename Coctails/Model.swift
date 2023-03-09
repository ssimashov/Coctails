//
//  Model.swift
//  Coctails
//
//  Created by Sergey Simashov on 28.03.2022.
//

struct DrinksResponce: Codable {
    let drinks: [Drinks]
}

struct Drinks {
    let drinkName: String
    let drinkPhoto: String
}


extension Drinks: Codable {
    enum CodingKeys: String, CodingKey{
        case drinkName = "strDrink"
        case drinkPhoto = "strDrinkThumb"
    }
}

