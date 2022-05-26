//
//  QuestionService.swift
//  TriviaAPP
//
//  Created by Adriancys Jesus Villegas Toro on 26/5/22.
//

import Foundation

class QuestionService{
    
    func getQuestions(url: String, onComplete: @escaping ([QuestionValue])-> Void,
                      onError: @escaping ()-> Void ){
        CallAPI.share.get(url: url) { response in
            switch response{
            case .success(let data):
                do{
                    if let data = data{
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        let questionsResponse = try decoder.decode(Questions.self, from: data)
                        onComplete(questionsResponse.results)
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
