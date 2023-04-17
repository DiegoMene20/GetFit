//
//  ViewRouter3.swift
//  GetFit
//
//  Created by Diego Menegatti on 4/16/23.
//

import SwiftUI

class ViewRouter3: ObservableObject {
    
    @Published var currentPage: Page = .WorkoutPage
    
    enum Page {
        case WorkoutPage
        case AddExercisePage
        case MenuPage
    }
    
}
