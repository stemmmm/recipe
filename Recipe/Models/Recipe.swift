//
//  Recipe.swift
//  Recipe
//
//  Created by 정호윤 on 2022/05/08.
//

import Foundation
import CoreText

class Recipe: Identifiable, Decodable {
    
    var id: UUID?
    
    var name: String
    var featured: Bool
    var image: String
    var description: String
    var prepTime: String
    var cookTime: String
    var totalTime: String
    var servings: Int
    var highlights: [String]
    var ingredients: [Ingredient]
    var directions: [String]
    
}

class Ingredient: Identifiable, Decodable {
    
    var id: UUID?
    
    var name: String
    var num: Int?
    var denom: Int?
    var unit: String?
    
}
