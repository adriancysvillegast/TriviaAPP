//
//  CategoryViewModel.swift
//  TriviaAPP
//
//  Created by Adriancys Jesus Villegas Toro on 24/5/22.
//

import Foundation

class CategoryViewModel{
    
    private var categoryService: CategoryService?
    private var categories = [Category]()
    private var delegate : CategoriesListDelegate
    
    init(categoryService : CategoryService, delegate : CategoriesListDelegate){
        self.categoryService = categoryService
        self.delegate = delegate
    }
    
    func getCategory(){
        categoryService?.getCategories(onComplete: { categories in
            self.categories = categories
            self.delegate.reloadTable()
        }, onError: {
            self.delegate.showError()
        })
    }
    
    
    func getCategories(at index: Int) -> Category{
        categories[index]
    }
    
    func getCategoriesCount() -> Int{
        categories.count
    }
    
}
