//
//  NewWorkout.swift
//  GetFit
//
//  Created by Diego Menegatti on 4/2/23.
//

import Foundation

struct Workout: Codable {
  @DocumentID var id: String?
  var title: String
  var numberOfPages: Int
  var author: String
}
