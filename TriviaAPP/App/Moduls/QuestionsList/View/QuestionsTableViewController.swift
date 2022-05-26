//
//  QuestionsTableViewController.swift
//  TriviaAPP
//
//  Created by Adriancys Jesus Villegas Toro on 26/5/22.
//

import UIKit

class QuestionsTableViewController: UITableViewController {
    
    var idCategory : Int = 0
    private var viewModel : QuestionViewModel?
    private var service = QuestionService()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        viewModel = QuestionViewModel(service: service)
        viewModel?.getQuestions(idCategory: idCategory)
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel?.getQuestionCount() ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = viewModel?.getQuestionTitle(at: indexPath.row)
       return cell
    }
    //MARK: - table view delegat
    
}

