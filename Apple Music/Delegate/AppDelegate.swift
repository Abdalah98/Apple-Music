//
//  AppDelegate.swift
//  Apple Music
//
//  Created by Abdallah on 8/16/21.
//

import UIKit
import IQKeyboardManagerSwift
import Toast

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        IQKeyboardManager.shared.enable = true

        return true
    }


}

