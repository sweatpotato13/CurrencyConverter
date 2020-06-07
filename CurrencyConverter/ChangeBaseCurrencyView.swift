//
//  ChangeBaseCurrencyView.swift
//  CurrencyConverter
//
//  Created by BTU on 2020/06/08.
//  Copyright © 2020 BTU. All rights reserved.
//

import Foundation
import SwiftUI

struct ChangeBaseCurrencyView: View {
    @ObservedObject var ud: UserData = UserData()
    @Environment(\.presentationMode) private var presentationMode

    var body: some View {
        List {
            ForEach(ud.allCurrencies) { currency in
                return HStack {
                    Button(action: { self.ud.baseCurrency = currency
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("\(currency.code) - \(currency.name)")
                    }
                }
            }
        }
    }
}
