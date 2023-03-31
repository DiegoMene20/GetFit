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
                
                Image("Logo")
                    .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.4)
                    
                /*
                Text("GetFit")
                    .padding()
                    .foregroundColor(Color("Cactus"))
                    .font(.system(size: 40))
                    .position(x: geometry.size.width * 0.2, y: geometry.size.height * 0.04)
                
                Image("Man Lifting")
                    .resizable()
                    .frame(width: 620.0, height: 525.0)
                    .opacity(0.3)
                    .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.24)
                 */
                
                Button(action: {
                  viewRouter.currentPage = .SignInPage
                }, label: {
                    Text("Sign in")
                        .font(.custom(
                            "Arial Italic",
                            fixedSize: 20))
                        .foregroundColor(Color.white)                })
                .padding()
                .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.06, alignment: .center)
                .background(Color("Cactus"))
                .cornerRadius(15)
                .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.75)
                
        
                Button(action: {
                    viewRouter.currentPage = .SignUpPage
                }, label: {
                    Text("Sign up")
                        .font(.custom(
                            "Arial Italic",
                            fixedSize: 20))
                        .foregroundColor(Color.white)                })
                .padding()
                .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.06, alignment: .center)
                .background(Color("Cactus"))
                .cornerRadius(15)
                .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.85)
                
            }
            .foregroundColor(.white)
            .background(Color("Firefly"))        }
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
