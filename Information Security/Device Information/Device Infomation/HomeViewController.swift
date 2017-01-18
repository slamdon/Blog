//
//  HomeViewController.swift
//  Device Infomation
//
//  Created by don chen on 2017/1/17.
//  Copyright © 2017年 don chen. All rights reserved.
//

import UIKit

struct DeviceInfo {
    var type:String
    var value:String
}

class HomeViewController: UIViewController {

    @IBOutlet weak var aTableView: UITableView!
    var deviceInfos = [DeviceInfo]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDeviceInfo()
    }
    
    func setupDeviceInfo() {
        deviceInfos.append(DeviceInfo(type: "iPhone名稱", value: UIDevice.current.name))
        deviceInfos.append(DeviceInfo(type: "設備型號", value: UIDevice.current.model))
        deviceInfos.append(DeviceInfo(type: "localizedModel", value: UIDevice.current.localizedModel))
        deviceInfos.append(DeviceInfo(type: "系統名稱", value: UIDevice.current.systemName))
        deviceInfos.append(DeviceInfo(type: "系統版本", value: UIDevice.current.systemVersion))
        
        // 檢測電量，首先需要開啟電量檢測，batteryLevel範圍是0到1，當值為 -1 時表示檢測不到。
        UIDevice.current.isBatteryMonitoringEnabled = true
        deviceInfos.append(DeviceInfo(type: "電池電量", value: "\(UIDevice.current.batteryLevel)"))
        
        if let uuid = UIDevice.current.identifierForVendor?.uuidString {
            deviceInfos.append(DeviceInfo(type: "UUID", value: uuid))
        }
        

    }
    
}

// MARK: UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return deviceInfos.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "aCell")
        if cell == nil {
            cell = UITableViewCell(style: .value1, reuseIdentifier: "aCell")
        }
        
        let deviceInfo = deviceInfos[indexPath.row]
        cell?.textLabel?.text = deviceInfo.type
        cell?.detailTextLabel?.text = deviceInfo.value
        return cell!
    }
    
    
}

// MARK: UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}
