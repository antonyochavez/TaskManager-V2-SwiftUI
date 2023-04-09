//
//  Category.swift
//  TaskManager
//
//  Created by Antonio Chavez Saucedo on 05/01/23.
//

import SwiftUI

enum Category: String, CaseIterable{
    case general = "General"
    case bug = "Bug"
    case idea = "Idea"
    case modifiers = "Modifiers"
    case challenge = "Challenge"
    case coding = "Coding"
    
    var color: Color{
        switch self{
        case .general: return Color("Gray")
        case .bug: return Color("Green")
        case .idea: return Color("Pink")
        case .modifiers: return Color("Blue")
        case .challenge: return Color.purple
        case .coding: return Color.brown
        }
    }
}
