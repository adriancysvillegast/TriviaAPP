//
//  CallAPI.swift
//  TriviaAPP
//
//  Created by Adriancys Jesus Villegas Toro on 23/5/22.
//

import Foundation
import Alamofire

class CallAPI{
    static let share = CallAPI()
    
    func get(url: String, completion: @escaping(Result<Data?, AFError>) -> Void){
        AF.request(url).response{ response in
            completion(response.result)
        }
    }
}
