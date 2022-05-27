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
    private var delegate : QuestionsViewDelegate?
    init(service: QuestionService, delegate: QuestionsViewDelegate){
        self.service = service
        self.delegate = delegate
    }
    
    
    func getQuestions(idCategory: Int){
       let url = "\(Constants().urlQuestions)\(idCategory)" 
            service?.getQuestions(url: url, onComplete: { questions in
                self.questions = questions
    //            METER DELEGADO PARA CAMBIAR VISTA
                self.validateData(data: questions)
            }, onError: {
                
                self.delegate?.showErrorWithApi(message: Constants().errorWithAPI)
            })
    }
    
    func validateData(data: [QuestionValue]){
        if data.isEmpty{
            self.delegate?.showErrorWithApi(message: Constants().errorWithCategories)
        }else{
            self.delegate?.updateView()
        }
    }
    
    func getQuestionCount()-> Int{
        questions.count
    }
    
    func getQuestionTitle(at index: Int) -> String{
        questions[index].question
    }
}
