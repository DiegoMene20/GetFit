//
//  SettingsView.swift
//  GetFit
//
//  Created by Diego Menegatti on 4/6/23.
//


import SwiftUI

struct SettingsView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var viewRouter2: ViewRouter2
    @EnvironmentObject var viewModel: AppViewModel
    @ObservedObject private var DatafetchModel = DataFetchModel()
    
    @State var email: String = ""
    
    
    
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                
                Text("Email")
                    .font(.system(size: 24))
                    .foregroundColor(Color("Cactus"))
                    .position(x: geometry.size.width * 0.1, y: geometry.size.height * 0.1)
                
                Divider()
                    .frame(height: 2)
                    .frame(width: geometry.size.width * 0.63)
                    .background(Color("Cactus"))
                    .position(x: geometry.size.width * 0.62, y: geometry.size.height * 0.13)
                
                Text(email)
                    .font(.system(size: 24))
                    .foregroundColor(Color("Cactus"))
                    .position(x: geometry.size.width * 0.75, y: geometry.size.height * 0.1)
                
                Text("User Name")
                    .font(.system(size: 24))
                    .foregroundColor(Color("Cactus"))
                    .position(x: geometry.size.width * 0.18, y: geometry.size.height * 0.2)
                
                Divider()
                    .frame(height: 2)
                    .frame(width: geometry.size.width * 0.63)
                    .background(Color("Cactus"))
                    .position(x: geometry.size.width * 0.62, y: geometry.size.height * 0.23)
                
                Text(DatafetchModel.saved_username)
                    .font(.system(size: 24))
                    .foregroundColor(Color("Cactus"))
                    .position(x: geometry.size.width * 0.75, y: geometry.size.height * 0.2)
                
                
                Button(action: {
                    viewRouter2.currentPage = .MenuPage
                }, label: {
                    Text("\(Image(systemName: "arrow.left"))")
                        .font(.system(size: 20))
                        .foregroundColor(Color("Cactus"))
                })
                .padding()
                .position(x: geometry.size.width * 0.05, y: geometry.size.height * 0.02)
                .zIndex(1)
                
                Button(action: {
                    
                    viewModel.signedIn = false
                    
                }, label: {
                    Text("Sign up")
                        .font(.custom(
                            "Arial Italic",
                            fixedSize: 20))
                        .foregroundColor(Color.white)
                })
                .padding()
                .frame(width: geometry.size.width * 0.94, height: geometry.size.height * 0.06, alignment: .center)
                .background(Color("Cactus"))
                .cornerRadius(15)
                .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.5)
                
                
                
            }
            .background(Color("Firefly"))
            .onAppear{
                let userEmail = viewModel.auth.currentUser?.email
                if let userEmail = userEmail {
                    email = userEmail
                    self.DatafetchModel.fetchUsername(email: userEmail)
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
