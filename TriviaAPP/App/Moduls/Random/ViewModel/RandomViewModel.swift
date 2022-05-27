//
//  RandomViewModel.swift
//  TriviaAPP
//
//  Created by Adriancys Jesus Villegas Toro on 26/5/22.
//

import Foundation

class RandomViewModel{
    
    private var service: RandomService?
    private var randomQuestion = [Random]()
    private var delegate: RandonViewDelegate?

    var indexQuestion = 0
    
    init(service: RandomService, delegate: RandonViewDelegate){
        self.service = service
        self.delegate = delegate
    }

    func getRandomQuestion(){
        service?.getRandom(onComplete: { question in
            self.randomQuestion = question
            print(question)
        }, onError: {
            self.delegate?.showErrorApi()
        })
    }
    
    func validateArray() -> String{
        var data : String = ""
        if randomQuestion.isEmpty{
//            showAlert
        }else{
            data = setQuestion(index: indexQuestion)
        }
        return data
    }
    
    func setQuestion(index: Int) -> String{
        var question : String
            if index < randomQuestion.count {
                question = randomQuestion[index].question
            }else{
                indexQuestion = 0
                question = randomQuestion[indexQuestion].question
            }
        return question
    }
    
    func updateQuestion() -> String{
        indexQuestion += 1
        return setQuestion(index: indexQuestion)
    }
    
    //MARK: - Validations
    func isTrue()-> Bool{
        true
    }
    
    func isFalse()-> Bool{
        false
    }
    
    
    func validateAnswer(value: Bool){
        if randomQuestion[indexQuestion].correctAnswer == value{
//            delegado de correcto
            self.delegate?.showResult(message: "Correct!!")
        }else{
            self.delegate?.showResult(message: "That is Incorrect")
        }
    }

}
