//
//  WaveImage.swift
//  Created by Rahaf on 23/12/2023.
//


import SwiftUI

struct ImageWaveView: View {
    @State private var waveOffset = Angle(degrees: 0)
    @Binding var percent: Int  
    let imageName: String
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                
                Wave(offset: Angle(degrees: self.waveOffset.degrees), percent: Double(percent)/100)
                    .fill(Color("Color"))
                    .clipShape(Rectangle().scale(0.92))
                
                Image(self.imageName)
                    .resizable()
                    .scaledToFill()
                    .clipShape(Rectangle())
                
            }
        }
        .aspectRatio(contentMode: .fit)
        .onAppear {
            withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: false)) {
                self.waveOffset = Angle(degrees: 360)
            }
        }
    }
}
