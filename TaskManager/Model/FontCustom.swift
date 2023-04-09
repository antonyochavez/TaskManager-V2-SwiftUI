//
//  FontCustom.swift
//  TaskManager
//
//  Created by Antonio Chavez Saucedo on 05/01/23.
//

import SwiftUI

enum FontCustom{
    case light
    case bold
    case medium
    case regular
    var weight: Font.Weight{
        switch self{
        case .light: return .light
        case .bold: return .bold
        case .medium: return .medium
        case .regular: return .regular
        }
    }
}


