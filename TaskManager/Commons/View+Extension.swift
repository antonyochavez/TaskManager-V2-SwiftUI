//
//  View+Extensions.swift
//  TaskManager
//
//  Created by Antonio Chavez Saucedo on 05/01/23.
//

import SwiftUI

extension View{
    func fontCustom(_ size: CGFloat, _ weight: FontCustom)->some View{
        self.font(.custom("Ubuntu", size: size))
            .fontWeight(weight.weight)
    }
    
    func hAlign(_ alignment: Alignment)->some View{
        self.frame(maxWidth: .infinity, alignment: alignment)
    }
    
    func vAlign(_ alignment: Alignment)->some View{
        self.frame(maxHeight: .infinity, alignment: alignment)
    }
}
