//
//  SwitchView2.swift
//  GetFit
//
//  Created by Diego Menegatti on 4/1/23.
//

import SwiftUI

struct SwitchView2: View {
    
    @EnvironmentObject var viewRouter2: ViewRouter2
    @EnvironmentObject var viewModel: AppViewModel
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        switch viewRouter2.currentPage {
        case .MenuPage:
            MenuView()
                .environmentObject(viewRouter)
        case .WorkoutPage:
            WorkoutView()
                .environmentObject(viewRouter2)
        }
    }
}
