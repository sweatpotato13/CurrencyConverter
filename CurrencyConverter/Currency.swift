//
//  Currency.swift
//  CurrencyConverter
//
//  Created by BTU on 2020/06/04.
//  Copyright © 2020 BTU. All rights reserved.
//

import Foundation
import SwiftUI

struct Currency: Equatable, Hashable, Codable, Identifiable{
    let id: UUID
    let name: String
    
    let rate: Double
    let symbol: String
    let code: String
    
    init(name: String, rate: Double, symbol: String = "", code: String) {
        self.id = UUID()
        self.name = name
        self.rate = rate
        self.symbol = symbol
        self.code = code
    }
    
    var flag: String {
        if self.symbol == "KR" { return "🇰🇷" }
        let base : UInt32 = 127397
        var s = ""
        for v in self.symbol.uppercased().unicodeScalars {
            s.unicodeScalars.append(UnicodeScalar(base + v.value)!)
        }
        
        return s
    }
}
