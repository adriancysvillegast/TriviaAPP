//
//  RandomViewController.swift
//  TriviaAPP
//
//  Created by Adriancys Jesus Villegas Toro on 26/5/22.
//

import UIKit

protocol RandonViewDelegate{
    func updateIndex() -> Int
}
class RandomViewController: UIViewController {

    @IBOutlet weak var nextQuestionOutlet: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var messageResultLabel: UILabel!
    @IBOutlet weak var trueOutlet: UIButton!
    @IBOutlet weak var falseOutlet: UIButton!
    
    private var viewModel : RandomViewModel?
    
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = RandomViewModel(service: RandomService(), delegate: self)
        messageResultLabel.isHidden = true
        nextQuestionOutlet.isHidden = true
        
        
        viewModel?.getRandomQuestion()
        setupView()
        
        showData()
    }

    func setupView(){
        trueOutlet.layer.cornerRadius = 30
        falseOutlet.layer.cornerRadius = 30
    }
    
    func showData(){
        questionLabel.text = viewModel?.showQuestion()
    }
    
    
    @IBAction func trueButtonTapped(_ sender: UIButton) {
        viewModel?.validateAnswer(value: (viewModel?.isTrue())!)
    }
    
    @IBAction func falseButtonTapped(_ sender: UIButton) {
        viewModel?.validateAnswer(value: (viewModel?.isFalse())!)
    }
    
    @IBAction func newQuestionButtonTapped(_ sender: UIButton) {
        
    }
    
    
}

//MARK: - RandonViewDelegate
extension RandomViewController: RandonViewDelegate{
    func updateIndex()-> Int {
        let value = 0
        return value
    }
    
    
}
