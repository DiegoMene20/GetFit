//
//  SwitchView3.swift
//  GetFit
//
//  Created by Diego Menegatti on 4/16/23.
//

import SwiftUI

struct SwitchView3: View {
    
    @EnvironmentObject var viewRouter3: ViewRouter3
    @EnvironmentObject var viewModel: AppViewModel
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        switch viewRouter3.currentPage {
        case .AddExercisePage:
            AddExerciseView()
                .environmentObject(viewRouter3)
        case .WorkoutPage:
            WorkoutView()
                .environmentObject(viewRouter3)
        case .MenuPage:
            MenuView()
                .environmentObject(viewRouter3)
        }
    }
}

struct SwitchView3_Previews: PreviewProvider {
    static var previews: some View {
        SwitchView3()
    }
}
