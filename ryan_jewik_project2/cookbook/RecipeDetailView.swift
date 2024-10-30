//
//  RecipeDetailView.swift
//  cookbook
//
//  Created by Ryan Jewik on 10/29/24.
//

import SwiftUI

import SwiftUI

struct RecipeDetailView: View {
    @State private var nightmode: Bool = false
    @State private var background: Color = Color.white
    @State private var foreground: Color = Color.black
    
    let selectedRecipe: Recipe
    var body: some View {
        VStack{
            Form{
                Section(header: Text("Recipe Details")){
                    Image(selectedRecipe.imageName)
                        .resizable()
                        .cornerRadius(12.0)
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 400, height: 240)
                        .clipped()
                        .padding()
                        .background(nightmode ? Color.black : Color.white)
                    Text(selectedRecipe.name)
                        .font(.headline)
                        .foregroundColor(nightmode ? .white : .black)
                        .background(nightmode ? Color.black : Color.white)
                    Spacer()
                        .foregroundColor(nightmode ? .black : .white)
                    Text(selectedRecipe.description)
                        .font(.body)
                        .foregroundColor(nightmode ? .white : .black)
                        .background(nightmode ? Color.black : Color.white)
                    HStack {
                        Image(systemName: selectedRecipe.isVegan ?
                              "checkmark.cicle": "xmark.circle")
                        Toggle(isOn: $nightmode) {
                            Text("Nightmode").background(nightmode ? Color.black : Color.white)
                                .foregroundColor(nightmode ? .white : .black)
                        }.padding()
                        .background(nightmode ? Color.black : Color.white)
                    }.background(nightmode ? Color.black : Color.white)
                }.background(nightmode ? Color.black : Color.white)
            }.foregroundColor(nightmode ? .white : .black)
        }.background(Color.clear)
    }

}

#Preview {
    RecipeDetailView(selectedRecipe: RecipeStore().recipes.first!)
}
