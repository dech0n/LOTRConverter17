//
//  ExchangeInfo.swift
//  LOTRConverter17
//
//  Created by Dechon Ryan on 4/17/24.
//

import SwiftUI

struct ExchangeInfo: View {
    var body: some View {
        ZStack {
            // background parchment image
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack {
                // Title text
                Text("Exchange Rates")
                    .font(.largeTitle)
                    .tracking(3)
                
                // desc text
                Text("Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates:")
                    .font(.title2)
                    .padding()
                
                // exchg rates
                
                ExtractedView()
                
                // Done button
                Button("Done") {
                    
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown)
                .font(.largeTitle)
                .padding()
                .foregroundStyle(.white)
                
            }
            .foregroundStyle(.black)
        }
            // Vstack
                // some Hstacks
    }
}

#Preview {
    ExchangeInfo()
}

