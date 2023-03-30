//
//  SwitchView.swift
//  GetFit
//
//  Created by Diego Menegatti on 3/30/23.
//

import SwiftUI

struct SwitchView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    
    
    var body: some View {
        
        switch viewRouter.currentPage {
        case .MainPage:
            MainView()
                .environmentObject(viewRouter)
        case .SignInPage:
            SignInView()
                .environmentObject(viewRouter)
        case .SignUpPage:
            SignUpView()
                .environmentObject(viewRouter)
        }
        
    }
}

struct SwitchView_Previews: PreviewProvider {
    static var previews: some View {
        SwitchView()
    }
}
