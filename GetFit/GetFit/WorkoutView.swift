//
//  Workout.swift
//  GetFit
//
//  Created by Diego Menegatti on 4/2/23.
//

import SwiftUI

struct WorkoutView: View {
    
    @EnvironmentObject var viewRouter2: ViewRouter2
    
    @State var startingTime = 0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var minutesPassedCalculation : Int {
        return startingTime / 60
    }
    
    var secondsPassedCalculation : Int {
        return startingTime % 60
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Text("\(secondsPassedCalculation, specifier: "%.2d")")
                    .onReceive(timer) { _ in
                        startingTime += 1
                    }
                    .font(.custom(
                        "Arial Italic",
                        fixedSize: 50))
                    .foregroundColor(Color.white)
                    .position(x: geometry.size.width * 0.58, y: geometry.size.height * 0.03)
                    .zIndex(1)
                
                Text(":")
                    .font(.custom(
                        "Arial Italic",
                        fixedSize: 50))
                    .foregroundColor(Color.white)
                    .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.03)
                    .zIndex(1)
                
                Text("\(minutesPassedCalculation, specifier: "%.2d")")
                    .font(.custom(
                        "Arial Italic",
                        fixedSize: 50))
                    .foregroundColor(Color.white)
                    .position(x: geometry.size.width * 0.42, y: geometry.size.height * 0.03)
                    .zIndex(1)
                
                
                Button(action: {
                    viewRouter2.currentPage = .MenuPage
                }, label: {
                    Text("\(Image(systemName: "arrow.left"))")
                        .font(.system(size: 20))
                        .foregroundColor(Color("Cactus"))
                })
                .padding()
                .position(x: geometry.size.width * 0.05, y: geometry.size.height * 0.02)
                .zIndex(1)
                
                Button(action: {
                    viewRouter2.currentPage = .MenuPage
                    
                }, label: {
                    Text("Finish Workout")
                        .font(.custom(
                            "Arial Italic",
                            fixedSize: 30))
                        .foregroundColor(Color.white)
                })
                .padding()
                .frame(width: geometry.size.width * 0.94, height: geometry.size.height * 0.06, alignment: .center)
                .background(Color("Cactus"))
                .cornerRadius(15)
                .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.97)
                .zIndex(1)
                
                ScrollView{
                    Spacer().padding(.top, 60)
                    
                    Button(action: {
                        viewRouter2.currentPage = .AddExercisePage
                    }, label: {
                        ZStack {
                            Text("\(Image(systemName: "plus.rectangle.fill"))")
                                .foregroundColor(Color("Cactus"))
                                .font(.system(size: 30))
                                .offset(y: -17)
                            
                            Text("Add a new exercise")
                                .foregroundColor(Color("Cactus"))
                                .font(.system(size: 30))
                                .offset(y: 25)
                                
                        }
                        .foregroundColor(Color.white)
                        .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.1, alignment: .center)
                    })

                    
                    Spacer()
                    
                    ZStack {
                        
                            
                    }
                    .foregroundColor(Color.white)
                    .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.1, alignment: .center)
                    .background(Color.gray)
                    .opacity(0.3)
                    
                }
                .frame(width: geometry.size.width * 1, height: geometry.size.height * 1)
                .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.5)
                .background(Color("Firefly"))
                .zIndex(0)
                
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
