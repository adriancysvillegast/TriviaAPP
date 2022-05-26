//
//  WelcomeViewModel.swift
//  TriviaAPP
//
//  Created by Adriancys Jesus Villegas Toro on 25/5/22.
//

import Foundation



class WelcomeViewModel{
        

    private var delegate : WelcomeViewDelegate
    
    init(delegate: WelcomeViewDelegate){
        self.delegate = delegate
    }
    
    func validateUser(userName: String?){
        if let userName = userName {
            if userName.isEmpty{
                self.delegate.typeAUser()
            }else {
                if userName.count < 6{
                    self.delegate.alertUserName()
                }else{
                    self.delegate.nextView()
                }
            }
        }
    }
    
    func showInfoAboutTrivia(){
        self.delegate.showInfoAboutTrivia()
    }
}


