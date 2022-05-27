//
//  RandomQuestions.swift
//  TriviaAPP
//
//  Created by Adriancys Jesus Villegas Toro on 26/5/22.
//

import Foundation

struct RandomQuestions: Codable{
 
    var results: [Random]
}
struct Random: Codable{
    var question: String
    var correctAnswer: Bool
}
