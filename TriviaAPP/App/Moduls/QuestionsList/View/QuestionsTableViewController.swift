//
//  QuestionsTableViewController.swift
//  TriviaAPP
//
//  Created by Adriancys Jesus Villegas Toro on 26/5/22.
//

import UIKit
protocol QuestionsViewDelegate{
    func updateView()
    func showErrorWithApi(message: String)
}
class QuestionsTableViewController: UITableViewController {
    
    var idCategory : Int = 0
    private var viewModel : QuestionViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        viewModel = QuestionViewModel(service: QuestionService(), delegate: self)
        viewModel?.getQuestions(idCategory: idCategory)
    }
    
    func setupView(){
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib(nibName: "ShowTitleTableViewCell", bundle: nil), forCellReuseIdentifier: "custonCell")
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel?.getQuestionCount() ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "custonCell", for: indexPath) as! ShowTitleTableViewCell
        cell.titleCell.text = viewModel?.getQuestionTitle(at: indexPath.row)
       return cell
    }
    //MARK: - table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        show the view to response the question
    }
    
}

extension QuestionsTableViewController: QuestionsViewDelegate{
    func showErrorWithApi(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        present(alert, animated: true)
    }

    
    func updateView() {
        tableView.reloadData()
    }
}
