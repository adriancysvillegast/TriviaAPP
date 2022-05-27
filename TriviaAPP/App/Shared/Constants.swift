//
//  Constants.swift
//  TriviaAPP
//
//  Created by Adriancys Jesus Villegas Toro on 24/5/22.
//

import Foundation

struct Constants{
    
    let urlCategory = "https://opentdb.com/api_category.php"
    let urlQuestions = "https://opentdb.com/api.php?amount=10&difficulty=easy&type=boolean&category="
    let errorWithAPI = "We cannot get data, try again"
    let errorWithCategories = "The API haven't questions on this category"
    let urlRandom = "https://opentdb.com/api.php?amount=20&difficulty=easy&type=boolean"
}
