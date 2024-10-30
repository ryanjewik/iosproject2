//
//  AddNewRecipe.swift
//  cookbook
//
//  Created by Ryan Jewik on 10/29/24.
//

import SwiftUI

struct AddNewRecipe: View {
    @State var recipeStore: RecipeStore
    @Binding var path: NavigationPath
    @State var name: String = ""
    @State var description: String = ""
    @State var isVegan: Bool = false
    
    
    var body: some View {
        Form{
            Section(header:Text("Recipe Details")) {
                Image("food")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                DataInput(title: "Name", userInput: $name)
                DataInput(title: "Description", userInput: $description)
                
                Toggle(isOn: $isVegan) {
                    Text("Vegan").font(.headline)
                }.padding()
            }
            Button(action: addNewRecipe) {
                Text("Add Recipe")
            }
        }
    }
    func addNewRecipe() {
        let newRecipe = Recipe(id: UUID().uuidString,
                               name: name, description: description,
                               isVegan: isVegan, imageName: "food")
        recipeStore.recipes.append(newRecipe)
        path.removeLast()
    }
}

struct DataInput: View {
    var title: String
    @Binding var userInput: String
    var body: some View {
        VStack(alignment: HorizontalAlignment.leading){
            Text(title)
                .font(.headline)
            TextField("Enter \(title)", text: $userInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }.padding()
    }
}
/*
 #Preview {
 AddNewRecipe(recipeStore: RecipeStore())
 }
 */
