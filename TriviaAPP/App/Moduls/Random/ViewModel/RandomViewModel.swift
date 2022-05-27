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

    var index = 0
    
    init(service: RandomService, delegate: RandonViewDelegate){
        self.service = service
        self.delegate = delegate
    }

    func getRandomQuestion(){
        service?.getRandom(onComplete: { question in
            self.randomQuestion = question
        }, onError: {
            print("errorrrrrrr")
        })
    }
    
    func randomCount() -> Int{
        randomQuestion.count
    }
    
    func isTrue()-> Bool{
        true
    }
    
    func isFalse()-> Bool{
        false
    }
    
    func validateAnswer(value: Bool){
        
    }
    
    
    
}
