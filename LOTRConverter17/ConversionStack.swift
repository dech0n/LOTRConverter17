//
//  ConversionStack.swift
//  LOTRConverter17
//
//  Created by Dechon Ryan on 4/19/24.
//

import SwiftUI
import TipKit

struct ConversionStack: View {
    @Binding var currency: Currency
    @Binding var showSelectCurrency: Bool
    @Binding var amount: String
    
    var body: some View {
        VStack {
            // Currency
            HStack {
                // Currency image
                Image(currency.image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 33)
                // Currency text
                Text(currency.name)
                    .font(.headline)
                    .foregroundStyle(.white)
            }
            .padding(.bottom, -5)
            .onTapGesture {
                showSelectCurrency.toggle()
            }
            .popoverTip(CurrencyTip(), arrowEdge: .bottom)
            // Textfield
            TextField("Amount", text: $amount) // `$` binds the var/const with the user input
                .textFieldStyle(.roundedBorder)
                .keyboardType(.decimalPad)
        }
        .task { // allows us to run code in the bg when screen appears
            try? Tips.configure()
        }
    }
}

//#Preview {
//    ConversionStack()
//}
