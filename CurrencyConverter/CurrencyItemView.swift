//
//  CurrencyItemView.swift
//  CurrencyConverter
//
//  Created by BTU on 2020/06/04.
//  Copyright © 2020 BTU. All rights reserved.
//

import Foundation
import SwiftUI

struct CurrencyItemView: View {
    @ObservedObject var ud: UserData = UserData()
    let currency: Currency
    let baseAmount: Double
    @Binding var isEditing: Bool
    
    var body: some View {
        let currency = self.currency
        let converstionRate = String(format: "%.4f", currency.rate / ud.baseCurrency.rate)
        let totalAmount = String(format: "%.3f", baseAmount * ( ud.baseCurrency.rate / currency.rate))

        return HStack {
            if self.isEditing {
                // This is for delete mode
                // TODO : Make this
                HStack(alignment: .center){
                    Image(systemName: "minus.circle")
                        .foregroundColor(.red)
                        .onTapGesture(count: 1) {
                            self.delete()
                    }
                    
                    Text(currency.flag).font(.title)
                    VStack(alignment: .leading){
                        Text(currency.code)
                        Text(currency.name).foregroundColor(.gray)
                    }
                }.padding()
                .background(RoundedRectangle(cornerRadius: 25).fill(Color.white))
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.blue, lineWidth: 5)
                )
            }
            else {
                // This is normal mode
                HStack{
                    // Flag
                    Text(currency.flag).font(.largeTitle)
                    // Code and name
                    VStack(alignment: .leading){
                        Text(currency.code).font(.headline)
                        Text(currency.name).font(.footnote).foregroundColor(.gray)
                    }
                    Spacer()
                    // Amount and conversion
                    VStack(alignment: .trailing){
                        Text("\(totalAmount)")
                        // Would be 1 this currency = xxx base currency
                        Text("1 \(currency.code) = \(converstionRate) \(userData.baseCurrency.code)").font(.footnote).foregroundColor(.gray)
                    }
                }.padding()
                .background(RoundedRectangle(cornerRadius: 25).fill(Color.white))
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.blue, lineWidth: 5)
                )
            }
        }
    }
    
    // TODO: need to implement
    private func delete() {
    }
}
