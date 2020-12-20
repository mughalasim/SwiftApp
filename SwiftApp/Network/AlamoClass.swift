//
//  AlamoClass.swift
//  SwiftApp
//
//  Created by Asim Mughal on 20/12/2020.
//


import Foundation

import UIKit
import Alamofire
import SwiftyJSON

class AlamoClass {

    static let shared = AlamoClass()
    
    public func call (
        _ headers: HTTPHeaders?,
        _ method: HTTPMethod,
        _ url: URLConvertible,
        _ params: Parameters? = nil,
        interfaceCompleted: ((Bool, JSON?) -> ())?) {
            
        Alamofire.request(url, method: method, parameters: params, encoding: URLEncoding.default, headers: headers).validate(contentType: ["application/json"]).responseJSON( completionHandler: { response in

            SharedMethods.log("NETWORK ------------------------------------------------")
            guard let code = response.response?.statusCode else {
                interfaceCompleted?(false, nil)
                SharedMethods.log("Error: \(response.error as Any)")
                SharedMethods.log("-----------------------------------------------------")
                return
            }
            
            switch response.result {
                
            case .success(let value):
                let json = JSON(value)
                
                SharedMethods.log("Method: \(method.rawValue)")
                SharedMethods.log("URL: \(url)")
                SharedMethods.log("Parameters: \(params as Any)")
                SharedMethods.log("Status code: \(code)")
                SharedMethods.log("-----------------------------------------------------")
                
                if (code > 199 && code < 227) {
                    interfaceCompleted?(true, json)
                    
                } else if code == 401 {
                    // Authentication issue attemmpt to re-auth with the server
                    
                } else if code == 403 {
                    // Permissions failure
                    interfaceCompleted?(false, json)
                    
                } else if code == 422 {
                    // Can handle Error object
                    interfaceCompleted?(false, json)
                    
                } else {
                    interfaceCompleted?(false, json)
                }
                
            case .failure(let error):
                SharedMethods.log("Method: \(method.rawValue)")
                SharedMethods.log("URL: \(url)")
                SharedMethods.log("Parameters: \(params as Any)")
                SharedMethods.log("Status code: \(error)")
                SharedMethods.log("-----------------------------------------------------")
                interfaceCompleted?(false, nil)
            }
        })}
    
}
