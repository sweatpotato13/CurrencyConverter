//
//  GADBannerViewController.swift
//  CurrencyConverter
//
//  Created by BTU on 2020/06/04.
//  Copyright © 2020 BTU. All rights reserved.
//

import GoogleMobileAds
import SwiftUI
import UIKit

struct GADBannerViewController: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let view = GADBannerView(adSize: kGADAdSizeBanner)
        let viewController = UIViewController()
        view.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        view.rootViewController = viewController
        viewController.view.addSubview(view)
        viewController.view.frame = CGRect(origin: .zero, size: kGADAdSizeBanner.size)
        view.load(GADRequest())
        return viewController
    }
    
    func updateUIViewController(
        _ uiViewController: UIViewController,
        context: Context) {
        
    }
}
