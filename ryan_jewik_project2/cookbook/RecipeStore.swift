//
//  recipeStore.swift
//  cookbook
//
//  Created by Ryan Jewik on 10/28/24.
//

import Foundation
import SwiftUI

@Observable class RecipeStore: Identifiable {
    var recipes: [Recipe]
    init (recipes: [Recipe] = []) {
        self.recipes = recipes
    }
}
