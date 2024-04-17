//
//  ExchangeRate.swift
//  LOTRConverter17
//
//  Created by Dechon Ryan on 4/17/24.
//

import SwiftUI

struct ExtractedView: View {
    var body: some View {
        HStack {
            // left currency image
            Image(.goldpiece)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            
            // exchg rate text
            Text("1 Gold Piece = 4 Gold Pennies")
            
            // right currency image
            Image(.goldpenny)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
        }
    }
}

#Preview {
    ExtractedView()
}
