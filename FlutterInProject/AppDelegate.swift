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

let _kReloadChannelName = "reload"

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    var methodChannel : FlutterMethodChannel?
    
    lazy var lifeCycleDelegate = FlutterPluginAppLifeCycleDelegate()
    
    var  reloadMessageChannel : FlutterBasicMessageChannel!

    lazy var flutterEngine = FlutterEngine(name: "flutter.FlutterInProject")

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        flutterEngine.run()
        GeneratedPluginRegistrant.register(with: flutterEngine)
        
        let flutterViewController = FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
        
        window = UIWindow()
        window?.frame = UIScreen.main.bounds
        window?.rootViewController = UINavigationController(rootViewController: ViewController())
        window?.makeKeyAndVisible()
        
        flutterRount()
        
        flutterCallbackUseNativeMethod()
        
        return true
    }
    
    func flutterRount() {
        //实现App 路由跳转
        reloadMessageChannel = FlutterBasicMessageChannel(name: _kReloadChannelName, binaryMessenger: flutterEngine.binaryMessenger, codec: FlutterStringCodec.sharedInstance())
        
    }
}

//MARK: - 原生页面跳转跳转到指定Flutter页面
extension AppDelegate: FlutterAppLifeCycleProvider {
    func add(_ delegate: FlutterApplicationLifeCycleDelegate) {
        lifeCycleDelegate.add(delegate)
    }
}

//MARK: - Flutter调用原生方法
extension AppDelegate {
    /// Flutter里的方法回调使用原生代码的方法
    func flutterCallbackUseNativeMethod() {
        let methodChannel = FlutterMethodChannel(name: "flutter.doubanmovie/buy",
                                                 binaryMessenger: flutterEngine.binaryMessenger)
        
        methodChannel.setMethodCallHandler({ [weak self]
            (call: FlutterMethodCall, result: @escaping FlutterResult) in
            
            if let _ = self {
                switch(call.method) {
                case "buyTicket":
                    self?.buyTicket(call: call, result: result)
                default:
                    print("Unrecognized method name: \(call.method)")
                }
            }
        })
    }
}

extension AppDelegate {
    func buyTicket(call: FlutterMethodCall, result: @escaping FlutterResult) {
        if let message = call.arguments as? String {
            let okAction = UIAlertAction(title: "购买", style: .default) { (_) in
                print("购买成功")
                // 这个是回调给Flutter的数据 Any类型
                result(true)
            }
            
            let cancelAction = UIAlertAction(title: "取消", style: .cancel) { (_) in
                print("取消购买")
                result(false)
            }
            
            let alertController = UIAlertController(title: "Flutter 调用 Native", message: message, preferredStyle: .alert)
            alertController.addAction(okAction)
            alertController.addAction(cancelAction)
            
            self.window?.rootViewController?.present(alertController, animated: true)
        }else {
            result("call success, but argument as failed")
        }
    }
}
