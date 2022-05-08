//
//  RecipeModel.swift
//  Recipe
//
//  Created by 정호윤 on 2022/05/08.
//

import Foundation

class RecipeModel: ObservableObject {
    @Published var recipes: [Recipe] = []
    
    init() {
        
        // Create an instance of data service and get the data
        self.recipes = DataService.getLocalData()
        
    }
}
