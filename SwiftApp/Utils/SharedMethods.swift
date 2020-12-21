//
//  SharedMethods.swift
//  SwiftApp
//
//  Created by Asim Mughal on 20/12/2020.
//

import Foundation
import Toast_Swift

class SharedMethods {
    
    static func getTimeFromMinutes(_ time: Int) -> String {
        
        var n = time % (24 * 3600)
        let hour = (n / 3600).format(pattern: "%02d")
        
        n %= 3600
        let minutes = (n / 60).format(pattern: "%02d")
        
        n %= 60
        let seconds = (n).format(pattern: "%02d")
        
        return "  \(hour):\(minutes):\(seconds)"
    }
    
    // SHOW TOAST -----------------------------------------------------------------------------
    static func showToast(_ vc: UIViewController, _ message: String, _ toast_type: Settings.TOAST_TYPE, _ completion: (() -> ())?){
        var style = ToastStyle()
        
        style.titleColor = UIColor.black
        style.messageColor = UIColor.black
        
        var title = ""
        var duration = 1.5
        
        switch toast_type {
        case .SUCCESS:
            duration = 1.0
            title = "Success"
            style.backgroundColor = UIColor.green
        case .FAIL:
            duration = 3.0
            title = "Whoops!"
            style.backgroundColor = UIColor.red
        case .INFO:
            duration = 3.0
            title = "Information"
            style.backgroundColor = UIColor.blue
        }
        vc.view.makeToast(message, duration: duration, position: .top, title: title, image: nil, style: style) { (success) in
            completion?()
        }
    }
    
    // PRINT ----------------------------------------------------------------------------------
    static func log(_ message: Any){
        #if DEBUG
        print(message)
        #endif
    }
    
    // REGISTER TABLEVIEW ---------------------------------------------------------------------
    static func registerTableView (_ tableView: UITableView , _ nibName: String) {
        tableView.separatorColor = UIColor.white
        tableView.register(UINib(nibName: nibName, bundle: nil), forCellReuseIdentifier: nibName)
    }
    
    static func registerCollectionView (_ collectionView: UICollectionView , _ nibName: String) {
        collectionView.register(UINib(nibName: nibName, bundle: nil), forCellWithReuseIdentifier: nibName)
    }
    
}
