//
//  CategoryService.swift
//  TriviaAPP
//
//  Created by Adriancys Jesus Villegas Toro on 24/5/22.
//

import Foundation

class CategoryService{
    
    func getCategories(onComplete: @escaping ([Category]) -> Void,
                       onError: @escaping () -> Void){
        CallAPI.share.get(url: Constants().urlCategory) { response in
            
            switch response{
            case .success(let data):
                do{
                    if let data = data{
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        let categoriesResponse = try decoder.decode(Categories.self, from: data)
                        onComplete(categoriesResponse.triviaCategories)
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
