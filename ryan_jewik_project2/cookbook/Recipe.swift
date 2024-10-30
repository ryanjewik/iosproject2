//
//  recipe.swift
//  cookbook
//
//  Created by Ryan Jewik on 10/28/24.
//
import Foundation
import SwiftUI

struct Recipe: Hashable, Codable, Identifiable {
    var id:String
    var name: String
    var description:String
    var isVegan: Bool
    var imageName:String
}
