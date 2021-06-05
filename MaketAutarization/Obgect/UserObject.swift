//
//  UserObject.swift
//  MaketAutarization
//
//  Created by user on 05.06.2021.
//

import Foundation
import Alamofire
import SwiftyJSON

class UserObjact: ObservableObject {
    
    func login(email:String, password: String){
    let parameters : [String: String] =
        ["email": email,
        "password": password]
    AF.request("http://cinema.areas.su/auth/login", method: .post, parameters: parameters, encoder: URLEncodedFormParameterEncoder.default).validate().responseJSON { response in
        switch response.result {
        case .success(let value):
            let json = JSON(value)
            print("JSON: \(json)")
        case .failure(let error):
            print(error)
            }
        }
    }
}
