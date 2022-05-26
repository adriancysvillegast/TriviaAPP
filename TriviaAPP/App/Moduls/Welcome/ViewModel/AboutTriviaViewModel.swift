//
//  AboutTriviaViewModel.swift
//  TriviaAPP
//
//  Created by Adriancys Jesus Villegas Toro on 26/5/22.
//

import Foundation

struct AboutTriviaViewModel{
    private var delegate : AboutTriviaDelegate
    
    
    init(delegate : AboutTriviaDelegate){
        self.delegate = delegate
    }
    
    func goToWelcome(){
        self.delegate.goToWelcome()
    }
    
    
}
