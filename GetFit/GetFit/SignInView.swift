//
//  SignInView.swift
//  GetFit
//
//  Created by Diego Menegatti on 3/29/23.
//

import SwiftUI

struct SignInView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var viewModel: AppViewModel
    @ObservedObject var keyboardResponder = KeyboardResponder()
    
    
    @State var email = ""
    @State var password = ""
    
    
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                
                Text("BrickSortz")
                    .padding()
                    .foregroundColor(.black)
                    .font(.system(size: 60))
                    .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.20)
                    .offset(y: -keyboardResponder.currentHeight*0.1)
                
                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .font(.system(size: 25))
                    .foregroundColor(.secondary)
                    .frame(width: 356, height: 50, alignment: .center)
                    .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.45)
                    .offset(y: -keyboardResponder.currentHeight*0.08)
                
                SecureField("Password", text: $password)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                    .font(.system(size: 25))
                    .foregroundColor(.secondary)
                    .frame(width: 356, height: 50, alignment: .center)
                    .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.54)
                
                Button(action: {
                    viewRouter.currentPage = .MainPage
                }, label: {
                    Text("\(Image(systemName: "chevron.left")) Back")
                        .font(.system(size: 15))
                })
                .padding()
                .position(x: geometry.size.width * 0.1, y: geometry.size.height * 0.01)
                
                Button(action: {
                    
                    guard !email.isEmpty, !password.isEmpty else {
                        return
                    }
                    
                    viewModel.signIn(email: email, password: password)
                    
                }, label: {
                    Text("Sign in")
                        .font(.system(size: 30))
                        .foregroundColor(Color.white)
                })
                .padding()
                .frame(width: 325, height: 50, alignment: .center)
                .background(Color.yellow)
                .cornerRadius(15)
                .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.75)
                .offset(y: -keyboardResponder.currentHeight*0.04)
                
                Text("Forgot Login info: ")
                    .font(.system(size: 12))
                    .foregroundColor(Color.white)
                    .position(x: geometry.size.width * 0.61, y: geometry.size.height * 0.58)
                    .offset(y: -keyboardResponder.currentHeight*(-0.02))
                
                Button(action: {
                    
                }, label: {
                    Text("Click Here")
                        .font(.system(size: 12))
                        .foregroundColor(Color.blue)
                })
                .position(x: geometry.size.width * 0.8, y: geometry.size.height * 0.58)
                .offset(y: -keyboardResponder.currentHeight*(-0.02))
                
                Text("Don't have an account yet: ")
                    .font(.system(size: 12))
                    .foregroundColor(Color.white)
                    .position(x: geometry.size.width * 0.41, y: geometry.size.height * 0.8)
                
                Button(action: {
                    viewRouter.currentPage = .SignUpPage
                }, label: {
                    Text("Click Here")
                        .font(.system(size: 12))
                        .foregroundColor(Color.blue)
                })
                .position(x: geometry.size.width * 0.66, y: geometry.size.height * 0.8)
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
