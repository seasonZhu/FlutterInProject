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

    lazy var button: UIButton = {
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 0, y: 140, width: UIScreen.main.bounds.width, height: 20)
        button.setTitle("原生界面跳转到Flutter的指定页面", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "测试"
        view.backgroundColor = .white
        view.addSubview(button)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }

    @objc
    func buttonAction(_ button: UIButton) {
        gotoFlutterControllerByMessage()
    }
    
    /// 去Flutter的指定页面
    private func gotoFlutterControllerByMessage() {
        self.engine.navigationChannel.invokeMethod("setInitialRoute", arguments: "test")
        self.reloadMessageChannel.sendMessage("test")
        let flutterViewController = FlutterViewController(engine: self.engine, nibName: nil, bundle: nil)
        self.navigationController?.pushViewController(flutterViewController, animated: true)
    }
    
    /// 去Flutter的根控制器
    private func gotoRootFlutterController() {
        if let flutterEngine = (UIApplication.shared.delegate as? AppDelegate)?.flutterEngine {
            let flutterViewController = FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
            flutterViewController.modalPresentationStyle = .fullScreen
            self.present(flutterViewController, animated: true, completion: nil)
        }
    }
}

extension UIViewController {
    var engine: FlutterEngine {
        return (UIApplication.shared.delegate! as! AppDelegate).flutterEngine
    }
        
    var reloadMessageChannel: FlutterBasicMessageChannel {
        return (UIApplication.shared.delegate! as! AppDelegate).reloadMessageChannel
    }
}
