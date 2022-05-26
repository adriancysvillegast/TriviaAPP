//
//  AboutTriviaViewController.swift
//  TriviaAPP
//
//  Created by Adriancys Jesus Villegas Toro on 26/5/22.
//

import UIKit
protocol AboutTriviaDelegate{
    func goToWelcome()
}
class AboutTriviaViewController: UIViewController {

    private var viewModel : AboutTriviaViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = AboutTriviaViewModel(delegate: self)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension AboutTriviaViewController: AboutTriviaDelegate{
    func goToWelcome() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
}
