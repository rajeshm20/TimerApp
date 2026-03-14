//
//  TimerView.swift
//  TimerApp
//
//  Created by Rajesh Mani on 14/03/26.
//


import SwiftUI

struct TimerView: View {

    @StateObject private var viewModel = TimerViewModel()

    var body: some View {

        VStack(spacing: 40) {

            ZStack {

                Circle()
                    .stroke(lineWidth: 20)
                    .opacity(0.2)
                    .foregroundColor(.blue)

                Circle()
                    .trim(from: 0.0, to: viewModel.progress)
                    .stroke(style: StrokeStyle(
                        lineWidth: 20,
                        lineCap: .round
                    ))
                    .foregroundColor(.blue)
                    .rotationEffect(.degrees(-90))
                    .animation(.linear, value: viewModel.progress)

                Text(viewModel.formattedTime)
                    .font(.system(size: 48, weight: .bold))
            }
            .frame(width: 250, height: 250)

            HStack(spacing: 30) {

                Button(action: {
                    viewModel.startTimer()
                }) {
                    Text("Start")
                        .frame(width: 80, height: 40)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }

                Button(action: {
                    viewModel.pauseTimer()
                }) {
                    Text("Pause")
                        .frame(width: 80, height: 40)
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }

                Button(action: {
                    viewModel.resetTimer()
                }) {
                    Text("Reset")
                        .frame(width: 80, height: 40)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
        }
        .padding()
    }
}