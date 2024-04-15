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
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                
                // Conversion section
                HStack {
                    // left conversion section
                    VStack {
                        // Currency
                        HStack {
                            // Currency image
                            Image(.silverpiece)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            // Currency text
                            Text("Silver Piece")
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        // Textfield
                        Text("Textfield")
                    }
                    // equal sign
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)
                    
                    // right conversion section
                    VStack {
                        // Currency
                        HStack {
                            // Currency text
                            Text("Gold Piece")
                                .font(.headline)
                                .foregroundStyle(.white)
                            
                            // Currency image
                            Image(.goldpiece)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                        }
                        // Textfield
                        Text("Textfield")
                    }
                }
                
                Spacer() // pushes views away from this spacer
                
                // Info button
                Image(systemName: "info.circle.fill")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
            }
//            .border(.blue) // useful for checking where the stack is visually
        }
    }
}

#Preview {
    ContentView()
}
