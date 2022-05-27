//
//  RandomService.swift
//  TriviaAPP
//
//  Created by Adriancys Jesus Villegas Toro on 26/5/22.
//

import Foundation

class RandomService{
    
    
    func getRandom(onComplete: @escaping ([Random])-> Void,
                   onError: @escaping ()-> Void){
        CallAPI.share.get(url: Constants().urlRandom) { response in
            
            switch response{
            case .success(let data):
                do{
                    if let data = data{
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        let randomResponse = try decoder.decode(RandomQuestions.self, from: data)
                        onComplete(randomResponse.results)
                    }
                }catch{
                    onError()
                }
            case .failure(_):
                onError()
            }
        }
    }
}
