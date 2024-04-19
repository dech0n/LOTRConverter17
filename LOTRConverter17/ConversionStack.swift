//
//  ConversionStack.swift
//  LOTRConverter17
//
//  Created by Dechon Ryan on 4/19/24.
//

import SwiftUI

struct ConversionStack: View {
    @State var currency: Currency = .silverPiece
    @State var showSelectCurrency = false
    @FocusState var typing
    @State var amount = ""
    
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
                .focused($typing)
                .keyboardType(.decimalPad)
        }
    }
}

#Preview {
    ConversionStack()
}
