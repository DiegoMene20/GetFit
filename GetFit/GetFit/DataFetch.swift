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
    /*
    func fetchWorkouts(email : String){
        
        let docRef = db.collection(email.lowercased()).document("Workout Dates")
        
        docRef.addSnapshotListener { documentSnapshot, error in
            guard let document = documentSnapshot else {
                print("Error fetching document :\(error!)")
                return
            }
            
            guard let data = document.data() else {
                print("Document data was empty.")
                return
            }
            
            print(data)
            self.workoutDates = data as! [String]
        }
    }*/
    
    
}
