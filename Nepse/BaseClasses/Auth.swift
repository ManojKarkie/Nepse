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
import SwiftyJSON

struct Constants {
    
    let baseURL = "http://139.59.25.250/nepal_stock_watch/public/"
    var authURL = "http://139.59.25.250/nepal_stock_watch/public/api/v1/login"
}

class Auth {
    
    static let shared = Auth()
    let baseUrl = {return Constants().baseURL}
   
}

extension Auth : RealmPersistenceType{
    
    func request(url: String, parameters: [String:Any]?, headers:[String:String]?, method: HTTPMethod, encoding: ParameterEncoding ,success: @escaping ([String:Any]) -> (), failure: @escaping (Error) -> ()) {
        
        Alamofire.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers).responseJSON { (response) in
            if let value = response.value as? [String:Any] {
                success(value)
            }else if response.response?.statusCode ?? 0 >= 500 {
                let error = NSError(domain: "INTERNAL_SERVER_ERROR", code: 500, userInfo: [NSLocalizedDescriptionKey: "Compnay not found."])
                failure(error)
            }
        }
    }
    
    func requestArray(url: String, parameters: [String:Any]?, headers:[String:String]?, method: HTTPMethod, encoding: ParameterEncoding ,success: @escaping ([[String:Any]]) -> ()) {
        
        Alamofire.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers).responseJSON { (response) in
            if let value = response.value as? [[String:Any]] {
                success(value)
            }
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
                    AuthNormalModel.shared = auth.normalModel()
                    if let userModel = auth.user {
                        UserModel.shared = userModel.normalModel()
                        self.save(models: [userModel])
                        success("Logged-in")
                    }
                }
            }
            }
        }
    }
    
    func register(data: Register, success: @escaping (String) -> (), failure: @escaping (String) -> ()) {
        
        let params = [
            "username": data.username ?? "" ,
            "password": data.password ?? "" ,
            "code": data.code ?? "" ,
            "name": data.name ?? "" ,
            "email": data.username ?? ""
        ]
        
        Alamofire.request(Constants().baseURL + "api/v1/register", method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            if response.response?.statusCode == 422 {
                if let data = response.value as? [String:Any] {
                    let error = Mapper<ResponseError>().map(JSON: data)
                    if let errorMsg = error?.email {
                        failure(errorMsg.first ?? "")
                    }else if let errorMsg = error?.code {
                        failure(errorMsg.first ?? "")
                    }else{
                        failure("The phone number has already been taken.")
                    }
                }
            }else{
                success("Successfully created user!, Activate Code is send to your mobile")
            }
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
    
    func validateLogin() {
        let header = ["Authorization": "Bearer " + (AuthNormalModel.shared.token ?? "")]
        Alamofire.request(Constants().baseURL + "api/v1/validateLogin", method: .get, parameters: nil, encoding: URLEncoding.default, headers: header).responseJSON { (response) in
            if let data = Mapper<AuthModel>().map(JSON: (response.value as! [String: Any])) {
                if let user = data.user?.normalModel() {
                    UserModel.shared = user
                }
            }
        }
    }
    
    @objc func logout() {
        if let authModel = realm.objects(AuthModel.self).first {
            try? realm.write {
                realm.delete(authModel)
            }
            status = .notLogged
            appdelegate?.window?.rootViewController = UINavigationController(rootViewController: Wireframe.shared.getMain())
        }
    }
}
