//
//  TodayViewController.swift
//  CurrencyConverterWidget
//
//  Created by BTU on 2020/06/11.
//  Copyright © 2020 BTU. All rights reserved.
//

import SwiftUI
import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Allow the today widget to be expanded or contracted.
    
    }
        
    @IBSegueAction func addSwiftUIView(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: WidgetView())
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        completionHandler(NCUpdateResult.newData)
    }
    
}
