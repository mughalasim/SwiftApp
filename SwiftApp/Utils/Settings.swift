//
//  Settings.swift
//  SwiftApp
//
//  Created by Asim Mughal on 20/12/2020.
//
import UIKit

struct Settings {
    static var shared = Settings()
    
    let BASE_URL: String
    let MAX_HORIZONTAL_ITEMS: Int
    let HORIZONTAL_ITEMS_HEIGHT: CGFloat
    
    let MESSAGE_DEFAULT_ERROR_CONNECTION: String
    let MESSAGE_DEFAULT_ERROR_INTERNAL: String
    
    enum TOAST_TYPE {
        case SUCCESS
        case FAIL
        case INFO
    }
    
    private init() {
        BASE_URL = "https://thefa-cm.streamamg.com/api/v1/"
        MAX_HORIZONTAL_ITEMS = 6
        HORIZONTAL_ITEMS_HEIGHT = 250.0
        
        MESSAGE_DEFAULT_ERROR_INTERNAL = "An internal error occured, We are looking into this urgently"
        MESSAGE_DEFAULT_ERROR_CONNECTION = "Failed to contact the server, please check your interent connection and try again"
        
        SharedMethods.log("Settings loaded -----------------------------------------------------")
        SharedMethods.log(self)
        SharedMethods.log("---------------------------------------------------------------------")
    }
}
