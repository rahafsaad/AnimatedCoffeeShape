//
//  ContentView.swift
//  AnimatedCoffeeShape
//
//  Created by Rahaf on 26/04/2024.
//


import SwiftUI
import Intents

struct ContentView: View {
    @State private var percent = 0
    @State private var smallCupsCount = 0
    @State private var mediumCupsCount = 0
    @State private var largeCupsCount = 0
    @State private var amountDrinkingCups = 0

    @State public var selectedCup: CupSize?

    var body: some View {
        
        VStack {
        
            Spacer()
            
            ZStack {
                
                
                Text("Hi")
                    .font(.largeTitle)
                    .foregroundColor(.black)
                
                
            }
            
            ZStack {
                Text("950ml/\(amountDrinkingCups)ml")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .id(UUID())

       
            
            ZStack {
                ImageWaveView(percent: $percent, imageName: "New Project-3")
                // can be customized by overlaying the wave background with any shape you prefer
                    .overlay(
                        Text("\(percent)" + "%")
                            .foregroundColor(.orange)
                            .font(.title)
                    )
            }
            .id(UUID())

            HStack {
                Text("Cup size:")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }

            HStack {
                cupButton(for: .large, count: largeCupsCount)
                cupButton(for: .medium, count: mediumCupsCount)
                cupButton(for: .small, count: smallCupsCount)
         
            }
            .id(UUID())
            .padding(.horizontal)
            Spacer()
        }
        .background {
            Color.appBackground.ignoresSafeArea()
            .preferredColorScheme(.light)
        }
    }

    private func cupButton(for cupSize: CupSize, count: Int) -> some View {
        VStack {
            Button(action: {
                selectedCup = cupSize
            }) {
                VStack {
                    Image(getImageName(cupSize.rawValue))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                    Text(cupSize.rawValue)
                        .foregroundColor(.black)
                }
            }

            HStack {
                Button(action: {
                    if count > 0 {
                        decreaseCupsCount(cupSize: cupSize)
                    }
                }) {
                    Text("-")
                        .font(.title)
                        .foregroundColor(.gray)
                }

                Spacer()

                Text("\(count)")
                    .foregroundColor(.black)
                    .font(.headline)

                Spacer()

                Button(action: {
                    increaseCupsCount(cupSize: cupSize)
                }) {
                    Text("+")
                        .font(.title)
                        .foregroundColor(.gray)
                }
            }
        }
        .padding(.horizontal)
    }

    private func increaseCupsCount(cupSize: CupSize) {
        switch cupSize {
        case .small:
            smallCupsCount += 1
            amountDrinkingCups += 270
        case .medium:
            mediumCupsCount += 1
            amountDrinkingCups += 370
        case .large:
            largeCupsCount += 1
            amountDrinkingCups += 450
        }

        SoundManager.shared.playSound(soundName: "bubble", volume: 0.2, extensionS: "mp3")
        updatePercentage()
    }

    private func decreaseCupsCount(cupSize: CupSize) {
        switch cupSize {
        case .small:
            if smallCupsCount > 0 {
                smallCupsCount -= 1
                amountDrinkingCups -= 270
            }
        case .medium:
            if mediumCupsCount > 0 {
                mediumCupsCount -= 1
                amountDrinkingCups -= 370
            }
        case .large:
            if largeCupsCount > 0 {
                largeCupsCount -= 1
                amountDrinkingCups -= 450
            }
        }

        SoundManager.shared.playSound(soundName: "delete", volume: 0.2, extensionS: "wav")
        updatePercentage()
    }

    private func updatePercentage() {
        percent = max(0, amountDrinkingCups * 100 / 950)
    }

    private func getImageName(_ size: String) -> String {
        switch size {
        case "Small": return "cup-14"
        case "Medium": return "cup-10"
        case "Large": return "cup-13"
        default: return "Cup"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
