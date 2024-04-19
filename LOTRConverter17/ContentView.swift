//
//  ContentView.swift
//  LOTRConverter17
//
//  Created by Dechon Ryan on 4/15/24.
//

import SwiftUI
import TipKit

struct ContentView: View {
    @State var showExchangeInfo = false
    @State var showSelectCurrency = false
    
    @State var leftAmount = ""
    @State var rightAmount = ""
    
    @FocusState var leftTyping
    @FocusState var rightTyping
    @FocusState var showingKeyboard
    
    @State var leftCurrency: Currency = .silverPiece
    @State var rightCurrency: Currency = .goldPiece
    
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
                    ConversionStack(currency: $leftCurrency,
                                    showSelectCurrency: $showSelectCurrency,
                                    amount: $leftAmount)
                    .popoverTip(CurrencyTip(), arrowEdge: .bottom)
                    .focused($leftTyping)
                    
                    // equal sign
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)
                    
                    // right conversion section
                    ConversionStack(currency: $rightCurrency,
                                    showSelectCurrency: $showSelectCurrency,
                                    amount: $rightAmount)
                    .focused($rightTyping)
                }
                .padding()
                .background(.black.opacity(0.5))
                .clipShape(.capsule)
                
                Spacer() // pushes views away from this spacer
                
                // Info button
                HStack {
                    Spacer()
                    
                    Button {
                        showExchangeInfo.toggle()
                    } label: { // visual design of the button
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    }
                    .padding(.trailing)
                }
            }
            //            .border(.blue) // useful for checking where the stack is visually
        }
        .task { // allows us to run code in the bg when screen appears
            try? Tips.configure()
        }
        .onChange(of: rightAmount) {
            if rightTyping { // if right textfield is focused
                leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
            }
        }
        .onChange(of: rightCurrency) {
            rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
        }
        .onChange(of: leftAmount) {
            if leftTyping {
                rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
            }
        }
        .onChange(of: leftCurrency) {
            leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
        }
        .sheet(isPresented: $showExchangeInfo) {
            ExchangeInfo()
        }
        .sheet(isPresented: $showSelectCurrency) {
            SelectCurrency(topCurrency: $leftCurrency, bottomCurrency: $rightCurrency)
        }
        .onTapGesture {
            leftTyping = false
            rightTyping = false
        }
    }
}

#Preview {
    ContentView()
}
