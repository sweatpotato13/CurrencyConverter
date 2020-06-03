//
//  ContentView.swift
//  CurrencyConverter
//
//  Created by BTU on 2020/06/03.
//  Copyright © 2020 BTU. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var isModalSheetShown: Bool = false
    
    var body: some View {
        NavigationView {
            MainView()
                .navigationBarTitle("Tutorials")
                .navigationBarItems(trailing:
                    Button(action: {
                        self.isModalSheetShown = true
                    }) {
                        Text("Edit")
                    }.sheet(isPresented: self.$isModalSheetShown) {
                        ModalView()
                    }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
