//
//  WelcomeViewController.swift
//  TriviaAPP
//
//  Created by Adriancys Jesus Villegas Toro on 25/5/22.
//

import UIKit

protocol WelcomeViewDelegate{
    func nextView()
    func isActiveButton()
    func alertUserName()
    func typeAUser()
    func showInfoAboutTrivia()
}

class WelcomeViewController: UIViewController {


    @IBOutlet weak var buttonOutlet: UIButton!
    @IBOutlet weak var textField: UITextField!
    
    var viewModel : WelcomeViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = WelcomeViewModel(delegate: self)
        buttonOutlet.isHidden = false
    }

    func setupView(){
        buttonOutlet.layer.cornerRadius = 10
    }
//MARK: - getStartButtonTapped
    @IBAction func getStartButtonTapped(_ sender: UIButton) {
        viewModel?.validateUser(userName: textField.text)
    }
    
    //MARK: - aboutTriviaButtonTapped
    @IBAction func aboutTriviaButtonTapped(_ sender: UIButton) {
        viewModel?.showInfoAboutTrivia()
    }
    
    
}
//MARK: - WelcomeViewDelegate
extension WelcomeViewController: WelcomeViewDelegate{
    func showInfoAboutTrivia() {
        let info = AboutTriviaViewController()
        self.navigationController?.pushViewController(info, animated: true)
    }
    
    func typeAUser() {
        let alert = UIAlertController(title: "Error", message: "Please type an Username", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
    
    func alertUserName() {
        let alert = UIAlertController(title: "Error", message: "Please type an Username with more than six characteres", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
    
    func isActiveButton() {
        buttonOutlet.isHidden = true
    }
    
    func nextView() {
        
        
//        test
//        let nextView = RandomViewController()
//        self.navigationController?.pushViewController(nextView, animated: true)
        let tabBarController = TabBarViewController()
        tabBarController.modalPresentationStyle = .overFullScreen
        self.present(tabBarController, animated: true)
    }
}

