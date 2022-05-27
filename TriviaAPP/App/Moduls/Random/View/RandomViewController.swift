//
//  RandomViewController.swift
//  TriviaAPP
//
//  Created by Adriancys Jesus Villegas Toro on 26/5/22.
//

import UIKit

protocol RandonViewDelegate{
    func showErrorApi()
    func showResult(message: String)
    
}
class RandomViewController: UIViewController {

    @IBOutlet weak var nextQuestionOutlet: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var messageResultLabel: UILabel!
    @IBOutlet weak var trueOutlet: UIButton!
    @IBOutlet weak var falseOutlet: UIButton!
    
    private var viewModel : RandomViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = RandomViewModel(service: RandomService(), delegate: self)
        messageResultLabel.isHidden = true
        nextQuestionOutlet.isHidden = true
        
        viewModel?.getRandomQuestion()
        setupView()
        showQuestions()
    }

    func setupView(){
        trueOutlet.layer.cornerRadius = 30
        falseOutlet.layer.cornerRadius = 30
    }
    
    func showQuestions(){
        questionLabel.text = viewModel?.validateArray()
//        if let index = viewModel?.indexQuestion{
//            let value = viewModel?.setQuestion(index: index)
//            questionLabel.text = value
//        }
    }
    @IBAction func trueButtonTapped(_ sender: UIButton) {
        let result = viewModel?.isTrue()
        viewModel?.validateAnswer(value: result!)
        
    }
    
    @IBAction func falseButtonTapped(_ sender: UIButton) {
        let result = viewModel?.isFalse()
        viewModel?.validateAnswer(value: result!)
    }
    
    @IBAction func newQuestionButtonTapped(_ sender: UIButton) {
        _ = viewModel?.updateQuestion()
    }
    
    
}

//MARK: - RandonViewDelegate
extension RandomViewController: RandonViewDelegate{
    func showResult(message: String) {
        messageResultLabel.isHidden = false
        nextQuestionOutlet.isHidden = false
    
        messageResultLabel.text = message
    }
    
    func showErrorApi() {
        let alert = UIAlertController(title: "Error", message: Constants().errorWithAPI, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
}
