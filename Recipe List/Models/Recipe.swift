//
//  Recipe.swift
//  Recipe List
//
//  Created by 정호윤 on 2022/05/08.
//

import Foundation

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
    var ingredients: [String]
    var directions: [String]
    
}
