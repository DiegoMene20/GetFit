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
    @State private var title: String = ""
    
    
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                
                Text("GetFit")
                    .padding()
                    .foregroundColor(.black)
                    .font(.system(size: 60))
                    .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.10)
                    .offset(y: -keyboardResponder.currentHeight*0.1)
                
                ZStack(alignment: .leading) {
                    if title.isEmpty {
                        Text("Password")
                            .bold()
                            .foregroundColor(Color.white.opacity(0.4))
                    }
                    
                    TextField("", text: $email)
                    
                }
                .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.06, alignment: .center)
                .padding(.horizontal, 10)
                .padding(.vertical, 4)
                .overlay( RoundedRectangle(cornerRadius: 10)
                    .stroke(LinearGradient(
                        colors: [
                            .red,
                            .blue
                        ],
                        startPoint: .leading,
                        endPoint: .trailing
                    )) )
                .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.2)
                
                ZStack(alignment: .leading) {
                    if title.isEmpty {
                        Text("Email")
                            .bold()
                            .foregroundColor(Color.white.opacity(0.4))
                    }
                    
                    TextField("", text: $password)
                    
                }
                .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.06, alignment: .center)
                .padding(.horizontal, 10)
                .padding(.vertical, 4)
                .overlay( RoundedRectangle(cornerRadius: 10)
                    .stroke(LinearGradient(
                        colors: [
                            .red,
                            .blue
                        ],
                        startPoint: .leading,
                        endPoint: .trailing
                    )) )
                
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
                .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.06, alignment: .center)
                .background(Color("Fern Green"))
                .cornerRadius(15)
                .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.95)
                .offset(y: -keyboardResponder.currentHeight*0.04)
                
            }
           .background(Color("English Violet"))
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
