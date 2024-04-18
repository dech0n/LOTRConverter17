//
//  IconGrid.swift
//  LOTRConverter17
//
//  Created by Dechon Ryan on 4/18/24.
//

import SwiftUI

struct IconGrid: View {
    @State var currency: Currency // @State will trigger a screen refresh if self.currency's value changes
    
    var body: some View {
        LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
            ForEach(Currency.allCases) { currency in
                if self.currency == currency {
                    CurrencyIcon(currencyImage: currency.image, currencyName: currency.name)
                        .shadow(color: .black, radius: 10)
                        .overlay { // preferable to .border b/c we want to be able to have rounded edges
                            RoundedRectangle(cornerRadius: 25.0)
                                .stroke(lineWidth: 3) // makes overlay a line around the edge instead of completely overshadowing the image
                                .opacity(0.5)
                        }
                } else {
                    CurrencyIcon(currencyImage: currency.image, currencyName: currency.name)
                        .onTapGesture {
                            self.currency = currency // select the tapped icon, trigger screen refresh b/c @State
                        }
                }
            }
        }
    }
}

#Preview {
    IconGrid(currency: .silverPiece)
}
