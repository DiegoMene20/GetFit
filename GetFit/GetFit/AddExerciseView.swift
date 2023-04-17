//
//  AddExerciseView.swift
//  GetFit
//
//  Created by Diego Menegatti on 4/8/23.
//

import SwiftUI
import Foundation

struct AddExerciseView: View {
    
    @EnvironmentObject var viewModel: AppViewModel
    @EnvironmentObject var viewRouter2: ViewRouter2
    @ObservedObject var keyboardResponder = KeyboardResponder()
    
    @ObservedObject private var DatafetchModel = DataFetchModel()
    
    @State private var selection: String?
    
    @State var todaysDate: String = ""
    
    
    var body: some View {
        GeometryReader { geometry in
            
            if selection == nil
            {
                List(self.DatafetchModel.ExerciseArray, id: \.self, selection: $selection) { contact in
                    
                    Text(contact)
                }
                .onAppear{
                    self.DatafetchModel.getListOfExercises()
                }
            } else {
                ZStack{
                    Text("Workout: ")
                        .font(.system(size: 25))
                        .foregroundColor(Color("Cactus"))
                        .position(x: geometry.size.width * 0.2, y: geometry.size.height * 0.1)
                        .zIndex(1)
                    
                    Text(selection ?? "")
                        .font(.system(size: 25))
                        .foregroundColor(Color("Cactus"))
                        .position(x: geometry.size.width * 0.65, y: geometry.size.height * 0.1)
                        .zIndex(1)
                    
                    
                    
                    Button(action: {
                        viewRouter2.currentPage = .SwitchPage
                    }, label: {
                        Text("\(Image(systemName: "arrow.left"))")
                            .font(.system(size: 20))
                            .foregroundColor(Color("Cactus"))
                    })
                    .padding()
                    .position(x: geometry.size.width * 0.05, y: geometry.size.height * 0.02)
                    .zIndex(1)
                    
                    ScrollView{
                        ForEach((1...10).reversed(), id: \.self) {_ in 
                            
                            ZStack {
                                
                                
                            }
                            .foregroundColor(Color.white)
                            .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.1, alignment: .center)
                            .background(Color.gray)
                            .opacity(0.3)
                            
                        }
                    }
                    .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.5, alignment: .center)
                    
                }
                .background(Color("Firefly"))
                .onAppear{
                    let date = Date()
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "dd.MM.yyyy"
                    self.todaysDate = dateFormatter.string(from: date)
                    
                    let emprtArr = [IndividualWorkoutObject]()
                    
                   // var todaysWorkout = DaysWorkoutObject(date: todaysDate, duration: 0, exerciseArray: emprtArr)
                }
            }
        }
    }
}

struct AddExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        AddExerciseView()
    }
}
