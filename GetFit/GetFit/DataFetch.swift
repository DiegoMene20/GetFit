//
//  UserName.swift
//  GetFit
//
//  Created by Diego Menegatti on 4/2/23.
//

import Foundation
import SwiftUI
import FirebaseFirestore

class DataFetchModel: ObservableObject {
    @Published var saved_username = ""
    @Published var workoutDates = [String]()
    
    @Published var result = ""
    
    @Published var ExerciseArray = [String]()
    
    private var db = Firestore.firestore()
    
    func fetchUsername(email : String){
        
        let docRef = db.collection(email.lowercased()).document("User Information")
        
        docRef.addSnapshotListener { documentSnapshot, error in
            guard let document = documentSnapshot else {
                print("Error fetching document :\(error!)")
                return
            }
            guard let data = document.data() else {
                print("Document data was empty.")
                return
            }
            self.saved_username = data["Username"] as! String
        }
    }
    
    func getDate(){
        let date = Date()
        let dateFormatter = DateFormatter()
         
        dateFormatter.dateFormat = "dd.MM.yyyy"
         
        self.result = dateFormatter.string(from: date)
        print(dateFormatter.string(from: date))
        print(self.result)
    }
    
    func getListOfExercises(){
        db.collection("Workout Collection").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                   // print("\(document.documentID) => \(document.data())")
                    self.ExerciseArray.append(document.documentID)
                }
                print(self.ExerciseArray)
            }
        }

    }
    
}
