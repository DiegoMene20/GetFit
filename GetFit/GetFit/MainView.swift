//
//  MainView.swift
//  GetFit
//
//  Created by Diego Menegatti on 3/29/23.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var viewModel: AppViewModel

    
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
            
                Text("GetFit")
                    .padding()
                    .foregroundColor(.black)
                    .font(.system(size: 60))
                    .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.20)
            
                Button(action: {
                  viewRouter.currentPage = .SignInPage
                }, label: {
                    Text("Sign in")
                        .font(.system(size: 40))
                        .foregroundColor(Color.white)
                })
                .padding()
                .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.width * 0.13, alignment: .center)
                .background(Color.yellow)
                .cornerRadius(15)
                .position(x: UIScreen.main.bounds.width * 0.5, y: UIScreen.main.bounds.height * 0.724)
                
                
        
                Button(action: {
                    viewRouter.currentPage = .SignUpPage
                }, label: {
                    Text("Sign up")
                        .font(.system(size: 40))
                        .foregroundColor(Color.white)
                })
                .padding()
                .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.width * 0.13, alignment: .center)
                .background(Color.yellow)
                .cornerRadius(15)
                .position(x: UIScreen.main.bounds.width * 0.5, y: UIScreen.main.bounds.height * 0.625)
                
            
                Text("Already have an account: ")
                    .padding()
                    .font(.system(size: 15))
                    .position(x: UIScreen.main.bounds.width * 0.5, y: UIScreen.main.bounds.height * 0.684)
                
                
                Text("Don't Have an account yet: ")
                    .padding()
                    .font(.system(size: 15))
                    .position(x: UIScreen.main.bounds.width * 0.5, y: UIScreen.main.bounds.height * 0.585)
                
            }
            .foregroundColor(.white)
        }
    }
}
