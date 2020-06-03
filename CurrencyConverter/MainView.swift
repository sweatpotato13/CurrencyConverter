//
//  MainView.swift
//  CurrencyConverter
//
//  Created by BTU on 2020/06/03.
//  Copyright © 2020 BTU. All rights reserved.
//

import Foundation
import SwiftUI

struct MainView: View {
    @State var baseAmount: String = "1.0"
    @State var isEditing: Bool = false
    @State var lastUpdated: String = "2020.06.03"
    
    var body: some View {
        let inset = EdgeInsets(top: -8, leading: -20, bottom: -7, trailing: 5)
        
        return ZStack(alignment: .bottomTrailing){
            VStack(alignment: .leading){
                Text("From:").bold().foregroundColor(.gray)
                HStack{
                    // Flag
                    Text("\u{1f1e9}\u{1f1ea}").padding(5)
                    // Code and name
                    VStack(alignment: .leading){
                        Text("TCW").foregroundColor(.white)
                        Text("TC")
                    }
                    Spacer()
                        .padding()
                    // Amount and conversion
                    TextField("1.0", text: $baseAmount)
                        .keyboardType(.numberPad)
                        .foregroundColor(.white)
                        .background(
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color.clear)
                                .border(Color(red: 0.7, green: 0.7, blue: 0.7), width: 1 / UIScreen.main.scale)
                                .cornerRadius(5)
                                .padding(inset)
                        )
                }.background(Color.blue).cornerRadius(5)
                Text("To:").bold().foregroundColor(.gray)
                List{
                    Text("This is a list")
                }
                Text("Last updated: \(self.lastUpdated)").foregroundColor(.gray).bold()
            }
        }
    }
}
