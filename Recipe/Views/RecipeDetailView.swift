//
//  RecipeDetailView.swift
//  Recipe
//
//  Created by 정호윤 on 2022/05/08.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe: Recipe
    @State var selectedServingSize = 2
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                // MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                // MARK: Recipe title
                Text(recipe.name)
                    .font(Font.custom("Avenir Heavy", size: 24))
                    .padding(.leading)
                    .padding(.top, 40)
                
                // MARK: Serving Size Picker
                VStack(alignment: .leading) {
                    Text("Select your serving size")
                        .font(Font.custom("Avenir", size: 15))
                    Picker("Serving Size", selection: $selectedServingSize) {
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }
                    .font(Font.custom("Avenir", size: 15))
                    .pickerStyle(.segmented)
                    .frame(width: 200)
                }
                .padding()
                
                // MARK: Ingredients
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(Font.custom("Avenir Heavy", size: 16))
                        .padding(.bottom, 10)
                    
                    ForEach(recipe.ingredients) { ingredient in
                        Text("- " + RecipeModel.getPortion(ingredient: ingredient, recipeServings: recipe.servings, targetServings: selectedServingSize) + " " + ingredient.name.lowercased())
                            .font(Font.custom("Avenir", size: 15))
                            .padding(.bottom, 2)
                    }
                }
                .padding()
                
                // MARK: Divider
                Divider()
                
                // MARK: Directions
                VStack(alignment: .leading) {
                    Text("Directions")
                        .font(Font.custom("Avenir Heavy", size: 16))
                        .padding(.bottom, 5)
                    
                    ForEach(0..<recipe.directions.count, id: \.self) { index in
                        Text(String(index+1) + ". " + recipe.directions[index])
                            .font(Font.custom("Avenir", size: 15))
                            .padding(.bottom, 2)
                    }
                }
                .padding()
            }
        }
//        .navigationBarHidden(true)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        // Create a dummy recipe
        let model = RecipeModel()
        RecipeDetailView(recipe: model.recipes[0])
    }
}
