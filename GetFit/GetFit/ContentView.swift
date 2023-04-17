//
//  ContentView.swift
//  GetFit
//
//  Created by Diego Menegatti on 3/29/23.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel: AppViewModel
    @StateObject var viewRouter = ViewRouter()
    @StateObject var viewRouter2 = ViewRouter2()
    @StateObject var viewRouter3 = ViewRouter3()
    
    
    var body: some View {
        ZStack {
            
            if viewModel.signedIn {
                SwitchView2()
                    .environmentObject(viewModel)
                    .environmentObject(viewRouter2)
                    .environmentObject(viewRouter)
                    .environmentObject(viewRouter3)
                
            } else {
                SwitchView()
                    .environmentObject(viewModel)
                    .environmentObject(viewRouter)
            }
        }
        .onAppear {
            viewModel.signedIn = viewModel.isSignedIn
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
