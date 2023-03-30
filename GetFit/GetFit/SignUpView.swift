//
//  SignUpView.swift
//  GetFit
//
//  Created by Diego Menegatti on 3/29/23.
//

import SwiftUI
import FirebaseCore
//import FirebaseFirestore

struct SignUpView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var viewModel: AppViewModel
    @ObservedObject var keyboardResponder = KeyboardResponder()

    
    
    @State var email = ""
    @State var password = ""
    @State var username = ""
    
   // let db = Firestore.firestore()
    
    
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                
                Text("BrickSortz")
                    .padding()
                    .foregroundColor(.black)
                    .font(.system(size: 60))
                    .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.20)
                    .offset(y: -keyboardResponder.currentHeight*0.1)
                
                TextField("Username", text: $username)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                    .font(.system(size: 25))
                    .foregroundColor(.secondary)
                    .frame(width: 356, height: 40, alignment: .center)
                    .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.44)
                    .offset(y: -keyboardResponder.currentHeight*0.15)
                
                TextField("Email", text: $email)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                    .font(.system(size: 25))
                    .foregroundColor(.secondary)
                    .frame(width: 356, height: 40, alignment: .center)
                    .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.5)
                    .offset(y: -keyboardResponder.currentHeight*0.08)
                
                SecureField("Password", text: $password)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                    .font(.system(size: 25))
                    .foregroundColor(.secondary)
                    .frame(width: 356, height: 40, alignment: .center)
                    .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.56)
                
                Button(action: {
                    viewRouter.currentPage = .MainPage
                }, label: {
                    Text("\(Image(systemName: "chevron.left")) Back")
                        .font(.system(size: 15))
                })
                .padding()
                .position(x: geometry.size.width * 0.1, y: geometry.size.height * 0.01)
                
                Button(action: {
                    viewModel.signUp(email: email.lowercased(), password: password)
                    print("TESTING");
                    /*
                    let path = db.collection("UserData").document(email.lowercased()).collection("Pieces").document("Collection Info")
                    path.setData(["Total Pieces":0, "Piece List":["Empty"]])
                    
                    let setPath = db.collection("UserData").document(email.lowercased()).collection("Sets").document("Collection Info")
                    setPath.setData(["Total Sets":0, "Set List":["Empty"]])
                    
                    db.collection("UserData").document(email.lowercased()).setData(["Username": username])
                    print("test")
                    */
                }, label: {
                    Text("Create Account")
                        .font(.system(size: 30))
                        .foregroundColor(Color.white)
                })
                .padding()
                .frame(width: 325, height: 50, alignment: .center)
                .background(Color.yellow)
                .cornerRadius(15)
                .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.65)
                .offset(y: -keyboardResponder.currentHeight*(-0.02))
                
                Text("Already have an account: ")
                    .font(.system(size: 12))
                    .foregroundColor(Color.white)
                    .position(x: geometry.size.width * 0.41, y: geometry.size.height * 0.95)
                
                Button(action: {
                    viewRouter.currentPage = .SignInPage
                }, label: {
                    Text("Click Here")
                        .font(.system(size: 12))
                        .foregroundColor(Color.blue)
                })
                .position(x: geometry.size.width * 0.66, y: geometry.size.height * 0.95)
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
