//
//  GetFitApp.swift
//  GetFit
//
//  Created by Diego Menegatti on 3/29/23.
//

import SwiftUI
import FirebaseCore

struct GradientTextFieldBackground: TextFieldStyle {
    
    let systemImageString: String
    
    // Hidden function to conform to this protocol
    func _body(configuration: TextField<Self._Label>) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5.0)
                .stroke(
                    LinearGradient(
                        colors: [
                            .red,
                            .blue
                        ],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .frame(height: 40)
            
            HStack {
                Image(systemName: systemImageString)
                // Reference the TextField here
                configuration
            }
            .padding(.leading)
            .foregroundColor(.gray)
        }
    }
}


class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
}

@main
struct YourApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    
    var body: some Scene {
        WindowGroup{
            let viewModel = AppViewModel()
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
/*
struct TextFieldExample: View {
    @State private var title: String = ""
    @State private var category: String = ""
    @State private var type: String = ""
    
    var body: some View {
        VStack { Text("DevTechie Courses")
                .font(.largeTitle)
            
            VStack(alignment: .leading) {
                Text("Enter new course title")
                    .font(.title3)
                
                ZStack(alignment: .leading) {
                    if title.isEmpty {
                        Text("Course title")
                            .bold()
                            .foregroundColor(Color.purple.opacity(0.4))
                        
                    }
                    
                    TextField("", text: $title)
                    
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 4)
                .overlay( RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.purple, lineWidth: 1) )
                
            }
        }
    }
*/
