//
//  DataService.swift
//  Recipe List
//
//  Created by 정호윤 on 2022/05/08.
//

import Foundation

class DataService {
    
    static func getLocalData() -> [Recipe] {
        
        // Parse local json file
        
        // Get a url path to the json file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        // Checl if pathString is not nill, otherwise...
        guard pathString != nil else {
            return [Recipe]()
        }
        
        // Create a url object
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            // Create a data object
            let data = try Data(contentsOf: url)
            
            // Decode the data with a JsonDecoder
            let decoder = JSONDecoder()
            
            do {
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                // Add the unique IDs
                for recipe in recipeData {
                    recipe.id = UUID()
                }
                
                // Return the recipes
                return recipeData
            } catch {
                // Error with parsing json
                print(error)
            }
        } catch {
            // Error with getting data
            print(error)
        }
        return [Recipe]()
    }
    
}
