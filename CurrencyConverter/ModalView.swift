//
//  ModalView.swift
//  CurrencyConverter
//
//  Created by BTU on 2020/06/03.
//  Copyright © 2020 BTU. All rights reserved.
//

import Foundation
import SwiftUI

struct ModalView: View {
    //var userData: UserData
    
    var body: some View {
        List {
            ForEach(userData.allCurrencies) { currency in
                return HStack {
                    Button(action: { self.select(currency) }) {
                        Text("\(currency.code) - \(currency.name)")
                    }
                    Spacer()
                    if self.isSelected(currency) {
                        Image(systemName: "checkmark").foregroundColor(.blue)
                    }
                }
            }
            }
    }
    
    private func select(_ currency: Currency) {
        if userData.userCurrency.map({ $0.code }).contains(currency.code) {
            userData.userCurrency.removeAll{$0.code == currency.code}
        }
        else {
            userData.userCurrency.append(currency)
        }
    }
    
    private func isSelected(_ currency: Currency) -> Bool {
        return userData.userCurrency.map({ $0.code }).contains(currency.code)
    }
}
