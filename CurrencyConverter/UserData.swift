//
//  UserData.swift
//  CurrencyConverter
//
//  Created by BTU on 2020/06/04.
//  Copyright © 2020 BTU. All rights reserved.
//


import Combine
import SwiftUI
import Foundation

private let defaultCurrencies: [Currency] = [
    Currency(name: "US dollar", rate: 1.0, symbol: "US", code: "USD"),
]

@propertyWrapper
struct UserDefaultValue<Value: Codable> {
    
    let key: String
    let defaultValue: Value
    
    var wrappedValue: Value {
        get {
            let data = UserDefaults.standard.data(forKey: key)
            let value = data.flatMap { try? JSONDecoder().decode(Value.self, from: $0) }
            return value ?? defaultValue
        }
        set {
            let data = try? JSONEncoder().encode(newValue)
            UserDefaults.standard.set(data, forKey: key)
        }
    }
}

final class UserData: ObservableObject {
    let didChange = PassthroughSubject<UserData, Never>()
    
    @UserDefaultValue(key: "allCurrencies", defaultValue: defaultCurrencies)
    var allCurrencies: [Currency] {
        didSet {
            didChange.send(self)
        }
    }
    
    @UserDefaultValue(key: "baseCurrency", defaultValue: defaultCurrencies[0])
    var baseCurrency: Currency {
        didSet {
            didChange.send(self)
        }
    }
    
    @UserDefaultValue(key: "userCurrency", defaultValue: defaultCurrencies)
    var userCurrency: [Currency] {
        didSet {
            didChange.send(self)
        }
    }
}
