//
//  ViewRouter2.swift
//  GetFit
//
//  Created by Diego Menegatti on 4/1/23.
//

import SwiftUI

class ViewRouter2: ObservableObject {
    
    @Published var currentPage: Page = .MenuPage
    
    enum Page {
        case MenuPage
        case WorkoutPage
    }
    
}
