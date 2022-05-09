//
//  RecipeDetailView.swift
//  Recipe
//
//  Created by 정호윤 on 2022/05/08.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe: Recipe
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                // MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                // MARK: Ingredients
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding(.bottom, 10)
                    
                    ForEach(recipe.ingredients) { ingredient in
                        Text("- \(ingredient.name)")
                            .padding(.bottom, 2)
                    }
                }
                .padding()
                
                // MARK: Divider
                Divider()
                
                // MARK: Directions
                VStack(alignment: .leading) {
                    Text("Directions")
                        .font(.headline)
                        .padding(.bottom, 5)
                    
                    ForEach(0..<recipe.directions.count, id: \.self) { index in
                        Text(String(index+1) + ". " + recipe.directions[index])
                            .padding(.bottom, 2)
                    }
                }
                .padding()
            }
        }
        .navigationTitle(recipe.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        // Create a dummy recipe
        let model = RecipeModel()
        RecipeDetailView(recipe: model.recipes[0])
    }
}
