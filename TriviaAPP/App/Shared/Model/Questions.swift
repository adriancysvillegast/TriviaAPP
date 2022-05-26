//
//  Questions.swift
//  TriviaAPP
//
//  Created by Adriancys Jesus Villegas Toro on 26/5/22.
//

import Foundation

struct Questions: Codable{
    var results: [QuestionValue]
}

struct QuestionValue: Codable{
    var category : String
    var type: String
    var question: String
    var correctAnswer: String // correct_answer
}
