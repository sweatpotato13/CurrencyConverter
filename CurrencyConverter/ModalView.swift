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
    @ObservedObject var ud: UserData = UserData()
    @State var counter = 1

    var body: some View {
        List {
            ForEach(ud.allCurrencies) { currency in
                return HStack {
                    Button(action: { self.select(currency)
                        self.counter += 1
                    }) {
                        Text("\(currency.code) - \(currency.name)")
                    }
                    Spacer()
                    if self.counter >= 1{
                        if self.isSelected(currency) {
                            Image(systemName: "checkmark").foregroundColor(.blue)
                        }
                    }
                }
            }
        }
    }
    
    private func select(_ currency: Currency) {
        if ud.userCurrency.map({ $0.code }).contains(currency.code) {
            ud.userCurrency.removeAll{$0.code == currency.code}
        }
        else {
            ud.userCurrency.append(currency)
        }
    }
    
    private func isSelected(_ currency: Currency) -> Bool {
        return ud.userCurrency.map({ $0.code }).contains(currency.code)
    }
}
