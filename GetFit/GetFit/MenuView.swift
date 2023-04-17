//
//  MenuView.swift
//  GetFit
//
//  Created by Diego Menegatti on 4/1/23.
//

import SwiftUI

struct MenuView: View {
    
    @EnvironmentObject var viewModel: AppViewModel
    @EnvironmentObject var viewRouter2: ViewRouter2
    @EnvironmentObject var viewRouter3: ViewRouter3
    @ObservedObject var keyboardResponder = KeyboardResponder()
    
    @ObservedObject private var DatafetchModel = DataFetchModel()
    
    var body: some View {
        GeometryReader { geometry in
            
            ZStack{
                
                ZStack{
                    
                    
                    Text("\(DatafetchModel.saved_username)")
                        .font(.custom(
                            "Machine",
                            fixedSize: 25))
                        .foregroundColor(Color.white)
                        .position(x: geometry.size.width * 0.2, y: geometry.size.height * 0.03)
                    
                    
                    if viewModel.auth.currentUser?.email == "test2@test.test"{
                        Button(action: {
                            viewRouter2.currentPage = .DataPage
                        }, label: {
                            Text("ADD DATA")
                        })
                        .position(x: geometry.size.width * 0.4, y: geometry.size.height * 0.03)
                    }
                    
                    Button(action: {
                        viewRouter2.currentPage = .SettingsPage
                    }, label: {
                        Image(systemName: "gearshape.fill")
                            .resizable()
                            .frame(width: 30.0, height: 30.0)
                            .foregroundColor(Color("Cactus"))
                    })
                    .frame(width: 30.0, height: 30.0)
                    .position(x: geometry.size.width * 0.9, y: geometry.size.height * 0.03)
                    
                    Image(systemName: "plus.app")
                        .resizable()
                        .frame(width: 30.0, height: 30.0)
                        .foregroundColor(Color("Cactus"))
                        .position(x: geometry.size.width * 0.75, y: geometry.size.height * 0.03)
                    
                    
                }
                .frame(width: geometry.size.width * 1, height: geometry.size.height * 0.06, alignment: .center)
                .background(Color("Firefly"))
                .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.02)
                .zIndex(1)
                
                Divider()
                    .frame(height: 3)
                    .frame(width: geometry.size.width)
                    .overlay(Color("Cactus"))
                    .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.05)
                    .zIndex(2)
                
                
                ScrollView{
                    Spacer().padding(.top, 40)
                    
                    ZStack {
                        
                        
                    }
                    .foregroundColor(Color.white)
                    .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.1, alignment: .center)
                    .background(Color.gray)
                    .opacity(0.3)
                    
                    ZStack {
                        
                        
                    }
                    .foregroundColor(Color.white)
                    .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.1, alignment: .center)
                    .background(Color.gray)
                    .opacity(0.3)
                    
                }
                .frame(width: geometry.size.width * 1, height: geometry.size.height * 1)
                .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.5)
                .background(Color("Firefly"))
                .zIndex(0)
                
                Button(action: {
                    viewRouter3.currentPage = .WorkoutPage
                    viewRouter2.currentPage = .SwitchPage
                }, label: {
                    Text("Begin Workout")
                        .font(.custom(
                            "Arial Italic",
                            fixedSize: 30))
                        .foregroundColor(Color.white)
                })
                .padding()
                .frame(width: geometry.size.width * 0.94, height: geometry.size.height * 0.06, alignment: .center)
                .background(Color("Cactus"))
                .cornerRadius(15)
                .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.95)
                
            }
            .onAppear{
                let userEmail = viewModel.auth.currentUser?.email
                if let userEmail = userEmail {
                    self.DatafetchModel.fetchUsername(email: userEmail)
                }
                
                self.DatafetchModel.getListOfExercises()
                
            }
        }
    }
}
/*
struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
*/
