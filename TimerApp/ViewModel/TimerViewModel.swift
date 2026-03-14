//
//  TimerViewModel.swift
//  TimerApp
//
//  Created by Rajesh Mani on 14/03/26.
//


import Foundation
import Combine

class TimerViewModel: ObservableObject {

    @Published var remainingTime: Int = 60
    @Published var progress: Double = 1.0
    @Published var isRunning: Bool = false

    private var totalTime: Int = 60
    private var timerCancellable: AnyCancellable?

    func startTimer() {

        guard !isRunning else { return }

        isRunning = true

        timerCancellable = Timer
            .publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.tick()
            }
    }

    func pauseTimer() {
        timerCancellable?.cancel()
        isRunning = false
    }

    func resetTimer() {
        pauseTimer()
        remainingTime = totalTime
        progress = 1.0
    }

    private func tick() {

        if remainingTime > 0 {
            remainingTime -= 1
            progress = Double(remainingTime) / Double(totalTime)
        } else {
            pauseTimer()
        }
    }

    var formattedTime: String {
        let minutes = remainingTime / 60
        let seconds = remainingTime % 60

        return String(format: "%02d:%02d", minutes, seconds)
    }
}