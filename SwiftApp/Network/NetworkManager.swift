//
//  NetworkManager.swift
//  SwiftApp
//
//  Created by Asim Mughal on 20/12/2020.
//


import UIKit
import Alamofire
import SwiftyJSON

class NetworkManager {
    
    static let shared = NetworkManager()
    private var STR_TOKEN: String = ""
    private var STR_TOKEN_TYPE: String = "Bearer"
    
    // HEADERS --------------------------------------------------------------------------------
    private func getAuthHeaders() -> HTTPHeaders {
        // If you want to authorise the call
        return ["Authorization": "\(STR_TOKEN_TYPE) \(STR_TOKEN)", "Accept" : "application/json"]
    }
    
    
    // GET DATA -------------------------------------------------------------------------------
    func getData (_ context: UIViewController, _ completion: (() -> ())?) {
        let url = "\(Settings.shared.BASE_URL)a7abf1f6-b3d5-4dea-89f4-5141ff264bfa/6ln63lARRtIkiJF0LiyvQTBiKBtLmHscrT71Or3Mmc4wb85l8J/en/feed/d040fcda-0a39-4c25-b50e-2808f3308bde/sections/"
        
        AlamoClass.shared.call(nil, .get, url, nil) { (success, response) in
            if (success){
                do {
                    MainResult.shared = try JSONDecoder().decode(MainResult.self, from: (response?.rawData())!)
                    let sectionCount = MainResult.shared?.sections.count ?? 0
                    if (sectionCount < 0){
                        SharedMethods.showToast(context, "No sections available", Settings.TOAST_TYPE.SUCCESS, nil)
                    }
                } catch {
                    MainResult.shared = nil
                    SharedMethods.log("PARSE ERROR: \(error.localizedDescription).")
                    SharedMethods.showToast(context, Settings.shared.MESSAGE_DEFAULT_ERROR_INTERNAL, Settings.TOAST_TYPE.INFO, nil)
                }
            } else {
                MainResult.shared = nil
                SharedMethods.showToast(context, Settings.shared.MESSAGE_DEFAULT_ERROR_CONNECTION, Settings.TOAST_TYPE.FAIL, nil)
            }
            completion?()
        }
    }

}
