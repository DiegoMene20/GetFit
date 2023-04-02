//
//  SignUpView.swift
//  GetFit
//
//  Created by Diego Menegatti on 3/29/23.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore

struct SignUpView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var viewModel: AppViewModel
    @ObservedObject var keyboardResponder = KeyboardResponder()
    
    let db = Firestore.firestore()

    
    
    @State var email = ""
    @State var password = ""
    @State var username = ""
    
   // let db = Firestore.firestore()
    
    
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                
                Image("Logo Text")
                    .resizable()
                    .frame(width: 300.0, height: 300.0)
                    .padding()
                    .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.10)
                
                Button(action: {
                    viewRouter.currentPage = .MainPage
                }, label: {
                    Text("\(Image(systemName: "arrow.left"))")
                        .font(.system(size: 20))
                        .foregroundColor(Color("Cactus"))
                })
                .padding()
                .position(x: geometry.size.width * 0.05, y: geometry.size.height * 0.02)
                
                ZStack(alignment: .leading) {
                    if username.isEmpty {
                        Text("Username")
                            .bold()
                            .foregroundColor(Color.white.opacity(0.4))
                    }
                    
                    TextField("", text: $username)
                        .foregroundColor(Color.white)
                    
                }
                .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.06, alignment: .center)
                .padding(.horizontal, 10)
                .padding(.vertical, 4)
                .overlay( RoundedRectangle(cornerRadius: 10)
                    .stroke(LinearGradient(
                        colors: [
                            Color("Cactus"),
                            Color("Grey Goose"),
                            Color("Dark Grey Blue")
                        ],
                        startPoint: .leading,
                        endPoint: .trailing
                    )) )
                .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.4)
                
                ZStack(alignment: .leading) {
                    if email.isEmpty {
                        Text("Email")
                            .bold()
                            .foregroundColor(Color.white.opacity(0.4))
                    }
                    
                    TextField("", text: $email)
                        .foregroundColor(Color.white)
                    
                }
                .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.06, alignment: .center)
                .padding(.horizontal, 10)
                .padding(.vertical, 4)
                .overlay( RoundedRectangle(cornerRadius: 10)
                    .stroke(LinearGradient(
                        colors: [
                            Color("Cactus"),
                            Color("Grey Goose"),
                            Color("Dark Grey Blue")
                        ],
                        startPoint: .leading,
                        endPoint: .trailing
                    )) )
                .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.2)
                
                ZStack(alignment: .leading) {
                    if password.isEmpty {
                        Text("Password")
                            .bold()
                            .foregroundColor(Color.white.opacity(0.4))
                    }
                    
                    SecureField("", text: $password)
                        .foregroundColor(Color.white)
                    
                }
                .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.06, alignment: .center)
                .padding(.horizontal, 10)
                .padding(.vertical, 4)
                .overlay( RoundedRectangle(cornerRadius: 10)
                    .stroke(LinearGradient(
                        colors: [
                            Color("Cactus"),
                            Color("Grey Goose"),
                            Color("Dark Grey Blue")
                        ],
                        startPoint: .leading,
                        endPoint: .trailing
                    )) )
                .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.3)
                
                Button(action: {
                    
                    viewModel.signUp(email: email.lowercased(), password: password)
                    
                    db.collection(email.lowercased()).document("User Information").setData(["Username": username])
                    
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
                .offset(y: -keyboardResponder.currentHeight*0.04)
            }
            .background(Color("Firefly"))
            
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
