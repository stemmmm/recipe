//
//  RecipeFeaturedView.swift
//  Recipe
//
//  Created by 정호윤 on 2022/05/09.
//

import SwiftUI

struct RecipeFeaturedView: View {
    
    @EnvironmentObject var model: RecipeModel
    @State private var isDetailViewShowing = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Featured Recipe")
                .bold()
                .font(.largeTitle)
                .padding(.leading)
                .padding(.top, 40)
            
            GeometryReader { geometry in
                TabView {
                    // Loop through each recipe
                    ForEach(0 ..< model.recipes.count) { index in
                        // Only show those that should be featured
                        if model.recipes[index].featured {
                            // Recipe card button
                            Button {
                                // Show the Recipe Detail sheet
                                self.isDetailViewShowing = true
                            } label: {
                                // Recipe card
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.white)

                                    VStack(spacing: 0) {
                                        Image(model.recipes[index].image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .clipped()
                                        Text(model.recipes[index].name)
                                            .padding(5)
                                    }
                                }
                            }
                            .sheet(isPresented: $isDetailViewShowing) {
                                // Show the Recipe Detail View
                                RecipeDetailView(recipe: model.recipes[index])
                            }
                            .buttonStyle(.plain)
                            .frame(width: geometry.size.width - 40, height: geometry.size.height - 100)
                            .cornerRadius(15)
                            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -5, y: 5)
                        }
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Preparation Time: ")
                    .font(.headline)
                Text("1 hour")
                
                Text("Highlights")
                    .font(.headline)
                Text("Healthy, Hearty")
            }
            .padding([.leading, .bottom])
        }
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
