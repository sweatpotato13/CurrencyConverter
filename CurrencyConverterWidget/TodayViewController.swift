//
//  TodayViewController.swift
//
//  Created by BTU on 2020/06/11.
//  Copyright © 2020 BTU. All rights reserved.
//

import UIKit
import NotificationCenter
import SwiftUI

class TodayViewController: UIViewController, NCWidgetProviding {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBSegueAction func addSwiftUIView(_ coder: NSCoder) -> UIViewController? {
        let hostingController = UIHostingController(coder: coder, rootView: WidgetView())
        hostingController!.view.backgroundColor = UIColor.clear;
        return hostingController
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
    
}
