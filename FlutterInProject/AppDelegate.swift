//
//  AppDelegate.swift
//  FlutterInProject
//
//  Created by season on 2020/1/10.
//  Copyright © 2020 season. All rights reserved.
//

import UIKit
import Flutter
import FlutterPluginRegistrant

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    lazy var flutterEngine = FlutterEngine(name: "io.flutter", project: nil)

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        flutterEngine.run()
        GeneratedPluginRegistrant.register(with: flutterEngine)
        
        let flutterViewController = FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
        
        window = UIWindow()
        window?.frame = UIScreen.main.bounds
        window?.rootViewController = ViewController() //flutterViewController
        window?.makeKeyAndVisible()
        return true
    }
}
