//
//  ContentView.swift
//  LOTRConverter17
//
//  Created by Dechon Ryan on 4/15/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            // background image
            Image(.background)
                .resizable() // overrides default of max image size
                .ignoresSafeArea()
            
            VStack {
                // Prancing Pony image view
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                
                // Currency exchange text
                
                // Conversion section
                HStack {
                    // left conversion section
                    VStack {
                        // Currency
                        HStack {
                            // Currency image
                            
                            // Currency text
                        }
                        // Textfield
                    }
                    // equal sign
                    
                    // right conversion section
                    VStack {
                        // Currency
                        HStack {
                            // Currency text
                            
                            // Currency image
                        }
                        // Textfield
                    }
                }
                // Info button
            }
        }
    }
}

#Preview {
    ContentView()
}
