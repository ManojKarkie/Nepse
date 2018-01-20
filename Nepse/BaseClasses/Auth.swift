//
//  Auth.swift
//  Nepse
//
//  Created by Lizan Pradhanang on 1/1/18.
//  Copyright © 2018 Swiftech. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

struct Constants {
    
    let baseURL = "http://139.59.25.250/nepal_stock_watch/public/"
    var authURL = "http://139.59.25.250/nepal_stock_watch/public/api/v1/login"
}

class Auth {
    
    static let shared = Auth()
    let baseUrl = {return Constants().baseURL}
   
}

extension Auth : RealmPersistenceType{
    
    func request(url: URL,headers:[String:String]?, method: HTTPMethod ,success: @escaping ([String:Any]) -> ()) {
        
        Alamofire.request(url, method: method, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
            let data = response.result.value as? [String:Any]
            success(data ?? [String:Any]())
        }
    }
    
    func loginIn(username: String, password: String, success: @escaping (String) -> (), failure: @escaping (String) -> () ) {
        let params = [
            "username": username,
            "password": password]
        Alamofire.request(Constants().authURL, method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            if response.response?.statusCode == 401 {
                
                failure("Invalid Credential")
            }else{
            if let data = response.value as? [String:Any] {
                if let auth = Mapper<AuthModel>().map(JSON: data) {
                    self.save(models: [auth])
                    if let userModel = auth.user {
                        self.save(models: [userModel])
                        success("Logged-in")
                    }
                }
            }
            }
        }
    }
    
    func register(data: Register, success: @escaping (String) -> ()) {
        
        let params = [
            "username": data.username ?? "" ,
            "password": data.password ?? "" ,
            "code": data.code ?? "" ,
            "name": data.name ?? "" ,
            "email": data.username ?? ""
        ]
        
        Alamofire.request(Constants().baseURL + "api/v1/register", method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            success("success")
        }
        
    }
    
    func activateUser(phone: String,code: String, success: @escaping (String) -> ()) {
        let params = [
            "code": phone ,
            "TOKEN": code
        ]
        
        Alamofire.request(Constants().baseURL + "api/v1/user/activate", method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            print(response)
        }
    }
    
    func resendCode(code: String , success: @escaping (String) -> () ) {
        let params = ["code": code]
        
        Alamofire.request(Constants().baseURL + "api/v1/resend-token", method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            success("")
        }
    }
    
    
    
    
}
