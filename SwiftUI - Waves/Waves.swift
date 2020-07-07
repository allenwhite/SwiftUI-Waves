//
//  Waves.swift
//  SwiftUI - Waves
//
//  Created by Allen White on 7/6/20.
//  Copyright © 2020 Allen White. All rights reserved.
//

import SwiftUI

struct WavingBackground: View {
    @State var allWavesOffsetY: CGFloat = -3.0
    
    @State private var foregroundOffset = CGPoint(x: 0, y: 85)
    @State private var middlegroundOffset = CGPoint(x: 70, y: 69)
    @State private var backgroundOffset = CGPoint(x: 70, y: 52)
    
    private let foregroundWaveWidth: CGFloat = 0.75
    private let middlegroundWaveWidth: CGFloat = 0.82
    private let backgroundWaveWidth: CGFloat = 0.98
    
    private let foregroundWaveColor: Color = Color.darkBlue
    private let middlegroundWaveColor: Color = Color.mediumBlue
    private let backgroundWaveColor: Color = Color.lightBlue
    
    private var fastAnimation: Animation {
        Animation.linear.speed(0.15).repeatForever(autoreverses: false)
    }
    
    private var slowAnimation: Animation {
        Animation.linear.speed(0.07).repeatForever(autoreverses: false)
    }
    
    private var bobAnimation: Animation {
        Animation.easeInOut.speed(0.15).repeatForever()
    }
    
    var body: some View {
        ZStack {
            VStack {
                ZStack {
                    GeometryReader { geo in
                        Wave(graphWidth: self.backgroundWaveWidth, amplitude: 0.015)
                            .offset(self.backgroundOffset)
                            .foregroundColor(self.backgroundWaveColor)
                            .onAppear {
                                withAnimation(self.slowAnimation) {
                                    self.backgroundOffset.x -= geo.size.width * self.backgroundWaveWidth
                                }
                            }
                        
                        Wave(graphWidth: self.middlegroundWaveWidth, amplitude: 0.015)
                            .offset(self.middlegroundOffset)
                            .foregroundColor(self.middlegroundWaveColor)
                            .onAppear {
                                withAnimation(self.slowAnimation) {
                                    self.middlegroundOffset.x -= geo.size.width * self.middlegroundWaveWidth
                                }
                            }
                        
                        Wave(graphWidth: self.foregroundWaveWidth, amplitude: 0.02)
                            .offset(self.foregroundOffset)
                            .foregroundColor(self.foregroundWaveColor)
                            .onAppear {
                                withAnimation(self.fastAnimation) {
                                    self.foregroundOffset.x -= geo.size.width * self.foregroundWaveWidth
                                }
                            }
                    }
                }
            }
            .frame(minWidth: .zero, maxWidth: .infinity, minHeight: .zero, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
            .offset(y: self.allWavesOffsetY)
            .onAppear {
                withAnimation(self.bobAnimation) {
                    self.allWavesOffsetY = 0
                }
            }
        }
    }
}


#if DEBUG

struct WavingBackground_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Text("Hello World")
        
            WavingBackground()
        }
    }
}

#endif
