//
//  AddDataView.swift
//  GetFit
//
//  Created by Diego Menegatti on 4/6/23.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore

struct AddDataView: View {
    
    @State var Workout_Name = ""
    @State var Main_Muscle: Int = 0
    @State var Secondary_Muscle: Int = 0
    
    let db = Firestore.firestore()
    
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                TextField("Workout name", text: $Workout_Name)
                    .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.06, alignment: .center)
                    .foregroundColor(Color.black)
                    .background(Color.white)
                    .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.5)
                
                TextField("Main Muscle", value: $Main_Muscle, formatter: NumberFormatter())
                    .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.06, alignment: .center)
                    .foregroundColor(Color.black)
                    .background(Color.white)
                    .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.6)
                
                TextField("Secondary Muscle", value: $Secondary_Muscle, formatter: NumberFormatter())
                    .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.06, alignment: .center)
                    .foregroundColor(Color.black)
                    .background(Color.white)
                    .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.7)
                
                Text("Hello")
                    .foregroundColor(Color.white)
                
                Button(action: {
                    let newWorkoutData = InternalExerciseData(workoutName: Workout_Name, mainMuscle: Main_Muscle, secondaryMuscle: Secondary_Muscle)
                    
                    do {
                        try db.collection("Workout Collection").document(Workout_Name).setData(from: newWorkoutData)
                    }
                    catch {
                        print(error)
                    }
                }, label: {
                    Text("Add")
                })
                .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.85)
            }
            //   .background(Color("Firefly"))
        }
    }
}
struct AddDataView_Previews: PreviewProvider {
    static var previews: some View {
        AddDataView()
    }
}
