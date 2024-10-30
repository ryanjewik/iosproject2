//
//  ContentView.swift
//  cookbook
//
//  Created by Ryan Jewik on 10/28/24.
//

import SwiftUI

struct ContentView: View {
    @State var recipeStore : RecipeStore = RecipeStore(recipes: recipeData)
    @State private var stackPath = NavigationPath()
    var body: some View {
        NavigationStack(path: $stackPath) {
            List {
                ForEach ($recipeStore.recipes, id: \.self) {$recipe in
                    NavigationLink(value: recipe){
                        ListCell(recipe: recipe)
                    }
                }
                    .onDelete(perform: deleteItems)
                    .onMove(perform: moveItems)
            }
            .navigationDestination(for: Recipe.self){ recipe in
                RecipeDetailView(selectedRecipe: recipe)
            }
            .navigationDestination(for: String.self){ _ in
                AddNewRecipe(recipeStore: recipeStore, path: $stackPath)
            }
            .navigationTitle(Text("Recipes"))
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink(value: "Add Recipe") { Text("Add")}
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
        }
        /*
        NavigationView {
            List {
                ForEach (recipeStore.recipes){ recipe in
                    ListCell(recipe: recipe)
                }
                .onDelete(perform: deleteItems)
                .onMove(perform: moveItems)
            }
            .navigationBarTitle(Text("Recipes"))
            .navigationBarItems(leading: NavigationLink(destination:
                                                            AddNewRecipe(recipeStore: self.recipeStore)) {
                Text("Add")
                    .foregroundColor(.blue)
            }, trailing: EditButton())
        }
         */
    }
    func deleteItems(at offsets: IndexSet){
        recipeStore.recipes.remove(atOffsets: offsets)
    }
    func moveItems(from source: IndexSet, to destination: Int){
        recipeStore.recipes.move(fromOffsets: source, toOffset: destination)
    }
}
struct ListCell: View{
    //@State var recipeStore: RecipeStore
    var recipe: Recipe
    var body: some View{
        HStack{
            Image(recipe.imageName).resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 60)
                .clipped()
            Text(recipe.name)
        }
        
    }
}

#Preview {
    ContentView()
}
