//
//  QuestionViewModel.swift
//  TriviaAPP
//
//  Created by Adriancys Jesus Villegas Toro on 26/5/22.
//

import Foundation

class QuestionViewModel{
    
    private var service : QuestionService?
    private var questions = [QuestionValue]()
    
    init(service: QuestionService){
        self.service = service
    }
    
    
    func getQuestions(idCategory: Int){
       let url = "\(Constants().urlQuestions)\(idCategory)" 
            service?.getQuestions(url: url, onComplete: { questions in
                self.questions = questions
    //            METER DELEGADO PARA CAMBIAR VISTA
                print(questions)
            }, onError: {
                print("SE ESCOÑETO ESTA MIERDA")
    //            PRINT ERROR
            })
    }
    
    func getQuestionCount()-> Int{
        questions.count
    }
    
    func getQuestionTitle(at index: Int) -> String{
        questions[index].question
    }
}
