//
//  CategoriesTableViewController.swift
//  TriviaAPP
//
//  Created by Adriancys Jesus Villegas Toro on 22/5/22.
//

import UIKit
protocol CategoriesListDelegate{
    func showError()
    func reloadTable()
    
}
class CategoriesTableViewController: UITableViewController {
    
    
    private var service = CategoryService()
    private var viewModel : CategoryViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        viewModel = CategoryViewModel(categoryService: service, delegate: self)
        viewModel?.getCategory()
    }
    

    //MARK: - setupView
    func setupView(){
        navigationController?.title = "Categories"
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib(nibName: "CategoryTableViewCell", bundle: nil), forCellReuseIdentifier: "custonCell")
    }
    
    //MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
//        here get idCategorie
        let idCategory = viewModel?.getCategories(at: indexPath.row).id
        let showQuestion = QuestionsTableViewController()
        showQuestion.idCategory = idCategory ?? 00
        self.navigationController?.pushViewController(showQuestion, animated: true)
        
    }
    
    
    //MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.getCategoriesCount() ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "custonCell", for: indexPath) as? CategoryTableViewCell else{return UITableViewCell()}
        cell.titleCell.text = viewModel?.getCategories(at: indexPath.row).name
        return cell
    }
}
//MARK: - CategoriesListDelegate
extension CategoriesTableViewController: CategoriesListDelegate{
    
    func showError() {
        let alert = UIAlertController(title: "Error", message: "We cannot get the data", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel))
        present(alert, animated: true)
    }
    
    func reloadTable() {
        tableView.reloadData()
    }
    
    
}


