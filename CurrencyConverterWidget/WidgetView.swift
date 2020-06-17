//
//  WidgetView.swift
//
//  Created by BTU on 2020/06/16.
//  Copyright © 2020 BTU. All rights reserved.
//

import SwiftUI

struct WidgetView : View {
    @ObservedObject var ud: UserData = UserData()
    @State var isEdit : Bool = false
    var body: some View {
        VStack(alignment: .leading){
            Text("From:").bold().foregroundColor(.gray)
            HStack{
                // Flag
                Text("\(ud.baseCurrency.flag)").padding(5)
                // Code and name
                VStack(alignment: .leading){
                    Text(
                        "1 " + ud.baseCurrency.code).foregroundColor(.black)
                    Text(ud.baseCurrency.name).font(.footnote).foregroundColor(.gray)
                }
            }
            Spacer()
            Text("To:").bold().foregroundColor(.gray)
            List{
                ForEach(ud.userCurrency) { currency in
                    CurrencyItemView( currency: currency, baseAmount: 1, isEditing: self.$isEdit)
                }
            }
        }
    }
}
