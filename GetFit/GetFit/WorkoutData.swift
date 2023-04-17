//
//  Workout.swift
//  GetFit
//
//  Created by Diego Menegatti on 4/2/23.
//

import Foundation
import FirebaseFirestoreSwift
import FirebaseFirestore

struct InternalExerciseData: Codable {
    @DocumentID var id: String?
    var workoutName: String
    var mainMuscle: Int
    var secondaryMuscle: Int
}

struct IndividualWorkoutObject: Codable {
    @DocumentID var id: String?
    var name: String
    var repsAndWeightsArray: [String]
}

struct DaysWorkoutObject: Codable {
    @DocumentID var id: String?
    var date: String
    var duration: Int
    var exerciseArray: [IndividualWorkoutObject]
}

struct repsAndWeightsObects: Codable {
    @DocumentID var id: String?
    var reps: Int
    var weight: Int
}

class WorkoutModel: ObservableObject {
    @Published var currentWorkout: DaysWorkoutObject?
}

/*
 1. Chest
 2. Shoulders
 3. Triceps
 4. Abs
 5. Lower Back
 6. Quadriceps
 7. Back
 8. Calves
 9. Glutes
 10. Hamstrings

 
 */
