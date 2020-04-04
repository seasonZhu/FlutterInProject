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
    
    lazy var dataSource: [(String, String)] = [(title: "去随便写的test界面", routeName: "test"),
                                               (title: "去iOS风格的界面", routeName: "store"),
                                               (title: "去豆瓣电影界面", routeName: "douban"),
                                               (title: "去自己写的Demo界面", routeName: "myApp"),
    ]
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: view.frame, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        tableView.rowHeight = 66
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    private func setUpUI() {
        view.backgroundColor = .white
        title = "原生界面跳转到指定的Flutter页面"
        view.addSubview(tableView)
    }

    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }

}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)
        cell.textLabel?.text = dataSource[indexPath.row].0
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let routeName = dataSource[indexPath.row].1
        gotoFlutterControllerByMessage(message: routeName)
    }
}

extension ViewController {
    /// 去Flutter的指定页面
    private func gotoFlutterControllerByMessage(message: String = "test") {
        self.engine.navigationChannel.invokeMethod("setInitialRoute", arguments: message)
        self.reloadMessageChannel.sendMessage(message)
        let flutterViewController = FlutterViewController(engine: self.engine, nibName: nil, bundle: nil)
        self.navigationController?.pushViewController(flutterViewController, animated: true)
    }
    
    /// 去Flutter的根控制器
    private func gotoRootFlutterController() {
        let flutterViewController = FlutterViewController(engine: engine, nibName: nil, bundle: nil)
        flutterViewController.modalPresentationStyle = .fullScreen
        self.present(flutterViewController, animated: true, completion: nil)
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
