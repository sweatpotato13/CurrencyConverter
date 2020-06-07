//
//  MainView.swift
//  CurrencyConverter
//
//  Created by BTU on 2020/06/03.
//  Copyright © 2020 BTU. All rights reserved.
//

import Foundation
import SwiftUI
import GoogleMobileAds

struct MainView: View {
    @ObservedObject var ud: UserData = UserData()
    @State var baseAmount: String = "1.0"
    @State var isEditing: Bool = false
    @State var lastUpdated: String = ""
    
    var body: some View {
        let inset = EdgeInsets(top: -8, leading: -20, bottom: -7, trailing: 5)
        let doubleValue: Double = Double(self.$baseAmount.wrappedValue) ?? 1.0

        return ZStack(alignment: .bottomTrailing){
            VStack(alignment: .leading){
                Text("From:").bold().foregroundColor(.gray)
                HStack{
                    // Flag
                    Text("\(ud.baseCurrency.flag)").padding(5)
                    // Code and name
                    VStack(alignment: .leading){
                        Text(ud.baseCurrency.code).foregroundColor(.white)
                        Text(ud.baseCurrency.name).foregroundColor(.white)
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
                    ForEach(ud.userCurrency) { currency in
                        CurrencyItemView( currency: currency, baseAmount: doubleValue, isEditing: self.$isEditing).onTapGesture {
                                // Swap this and base
                            self.ud.baseCurrency = currency
                            }
                        }
                }
                .onAppear(perform: loadCurrencies)
                GADBannerViewController()
                    .frame(width: kGADAdSizeBanner.size.width, height: kGADAdSizeBanner.size.height)
                Text("Last updated: \(self.lastUpdated)").foregroundColor(.gray).bold()
            }
        }
    }
    
    private func loadCurrencies() {
        let url = URL(string: "https://api.exchangeratesapi.io/latest?base=USD")!
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { data, _, _ in
            if let data = data {
                if let decoded: CurrencyList = self.decodeData(CurrencyList.self, data){
                    self.lastUpdated = decoded.date
                    // generate currency data
                    var newCurrencies = [Currency]()
                    for key in decoded.rates.keys {
                        let newCurrency = Currency(name: supportedCurrencies[key]?[0] ?? "Unknown", rate: 1.0 / (decoded.rates[key] ?? 1.0), symbol: supportedCurrencies[key]?[1] ?? "", code: key)
                        newCurrencies.append(newCurrency)
                    }
                    
                    DispatchQueue.main.async {
                        userData.allCurrencies  = newCurrencies
                        if let base = userData.allCurrencies.filter({ $0.symbol == userData.baseCurrency.symbol }).first {
                            userData.baseCurrency = base
                        }
                        
                        var tempNewUserCurrency = [Currency]()
                        let userCurrencies = userData.userCurrency.map{ $0.code }
                        for c in userData.allCurrencies {
                            if userCurrencies.contains(c.code){
                                tempNewUserCurrency.append(c)
                            }
                        }
                        
                        userData.userCurrency = tempNewUserCurrency
                    }
                }
            }
        })
        task.resume()
    }
}
extension MainView
{
    private func decodeData<T>(_ decodeObject: T.Type, _ data: Data) -> T? where T: Codable
    {
        let decoder = JSONDecoder()
        do
        {
            return try decoder.decode(decodeObject.self, from: data)
        }
        catch let jsonErr
        {
            print("Error decoding Json ", jsonErr)
            return nil
        }
    }
}

