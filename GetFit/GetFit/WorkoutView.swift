//
//  Workout.swift
//  GetFit
//
//  Created by Diego Menegatti on 4/2/23.
//

import SwiftUI

struct WorkoutView: View {
    
    @EnvironmentObject var viewRouter2: ViewRouter2
    
    @State private var runningClock: Bool = true
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Text("Holder")
                
                Button(action: {
                    viewRouter2.currentPage = .MenuPage
                }, label: {
                    Text("\(Image(systemName: "arrow.left"))")
                        .font(.system(size: 20))
                        .foregroundColor(Color("Cactus"))
                })
                .padding()
                .position(x: geometry.size.width * 0.05, y: geometry.size.height * 0.02)
                
                Stopwatch(isRunning: $runningClock)
                    .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.1)
            }
            .background(Color("Firefly"))
        }
    }
}

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutView()
    }
}
