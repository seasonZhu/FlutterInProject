//
//  ViewController.swift
//  FlutterInProject
//
//  Created by season on 2020/1/10.
//  Copyright © 2020 season. All rights reserved.
//

import UIKit
import Flutter

class ViewController: UIViewController {

    lazy var counterLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 100, width: UIScreen.main.bounds.width, height: 20)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    lazy var button: UIButton = {
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 0, y: 140, width: UIScreen.main.bounds.width, height: 20)
        button.setTitle("按钮", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(buttonWasTapped(_:)), for: .touchUpInside)
        return button
    }()

    var methodChannel : FlutterMethodChannel?
    
    var count = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(counterLabel)
        view.addSubview(button)
        
        if let flutterEngine = (UIApplication.shared.delegate as? AppDelegate)?.flutterEngine {
            methodChannel = FlutterMethodChannel(name: "dev.flutter.example/counter",
                                                 binaryMessenger: flutterEngine.binaryMessenger)
            methodChannel?.setMethodCallHandler({ [weak self]
                (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
                
                if let strongSelf = self {
                    switch(call.method) {
                    case "incrementCounter":
                        strongSelf.count += 1
                        strongSelf.counterLabel.text = "Current counter: \(strongSelf.count)"
                        strongSelf.reportCounter()
                    case "requestCounter":
                        strongSelf.reportCounter()
                    default:
                        // Unrecognized method name
                        print("Unrecognized method name: \(call.method)")
                    }
                }
            })
        }
    }

    func reportCounter() {
        methodChannel?.invokeMethod("reportCounter", arguments: count)
    }

    
    @objc
    func buttonWasTapped(_ sender: Any) {
        if let flutterEngine = (UIApplication.shared.delegate as? AppDelegate)?.flutterEngine {
            let flutterViewController = FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
            flutterViewController.modalPresentationStyle = .fullScreen
            self.present(flutterViewController, animated: true, completion: nil)
        }
    }
}

