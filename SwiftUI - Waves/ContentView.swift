//
//  ContentView.swift
//  SwiftUI - Waves
//
//  Created by Allen White on 7/6/20.
//  Copyright © 2020 Allen White. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                NavigationLink(destination: Text("Second View")) {
                    Text("Hello, World!")
                }
                WavingBackground()
            }
            .navigationBarTitle(Text("Waves"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
