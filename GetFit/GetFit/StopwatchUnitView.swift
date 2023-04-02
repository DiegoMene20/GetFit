//
//  Stopwatch.swift
//  StandApp
//
//  Created by Serafín Ennes Moscoso on 28/04/2021.
//
import SwiftUI

struct Stopwatch: View {

    /// Current progress time expresed in seconds
    @State private var progressTime = 0
    @Binding var isRunning: Bool
    
    

    /// Computed properties to get the progressTime in hh:mm:ss format
    var hours: Int {
        progressTime / 3600
    }

    var minutes: Int {
        (progressTime % 3600) / 60
    }

    var seconds: Int {
        progressTime % 60
    }

    /// Increase progressTime each second
    @State private var timer: Timer?

    var body: some View {
        VStack {
            HStack(spacing: 10) {
                StopwatchUnit(timeUnit: hours, color: Color.yellow)
                Text(":")
                    .font(.system(size: 48))
                    .offset(y: -7)
                    .foregroundColor(Color("Cactus"))
                StopwatchUnit(timeUnit: minutes, color: Color.yellow)
                Text(":")
                    .font(.system(size: 48))
                    .offset(y: -7)
                    .foregroundColor(Color("Cactus"))
                StopwatchUnit(timeUnit: seconds, color: Color.yellow)
            }

            HStack {
                Button(action: {
                    if isRunning{
                        timer?.invalidate()
                    } else {
                        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
                            progressTime += 1
                        })
                    }
                    isRunning.toggle()
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15.0)
                            .frame(width: 120, height: 50, alignment: .center)
                            .foregroundColor(isRunning ? Color.yellow : Color.yellow)

                        Text(isRunning ? "Stop" : "Start")
                            .font(.title)
                            .foregroundColor(.white)
                    }
                }

                Button(action: {
                    progressTime = 0
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15.0)
                            .frame(width: 120, height: 50, alignment: .center)
                            .foregroundColor(.gray)

                        Text("Reset")
                            .font(.title)
                            .foregroundColor(.white)
                    }
                }
            }
        }
    }
}


struct StopwatchUnit: View {

    var timeUnit: Int
    var color: Color

    /// Time unit expressed as String.
    /// - Includes "0" as prefix if this is less than 10.
    var timeUnitStr: String {
        let timeUnitStr = String(timeUnit)
        return timeUnit < 10 ? "0" + timeUnitStr : timeUnitStr
    }

    var body: some View {
        VStack {
            ZStack {

                HStack(spacing: 2) {
                    Text(timeUnitStr.substring(index: 0))
                        .font(.system(size: 48))
                        .foregroundColor(Color("Cactus"))
                        .frame(width: 28)
                    Text(timeUnitStr.substring(index: 1))
                        .font(.system(size: 48))
                        .foregroundColor(Color("Cactus"))
                        .frame(width: 28)
                }
            }

        }
    }
}
/*
struct Stopwatch_Previews: PreviewProvider {
    static var previews: some View {
       // Stopwatch(isRunning: $runningClock)
    }
    
}
*/
extension String {
    func substring(index: Int) -> String {
        let arrayString = Array(self)
        return String(arrayString[index])
    }
}
