//
//  TabBarViewController.swift
//  TriviaAPP
//
//  Created by Adriancys Jesus Villegas Toro on 26/5/22.
//

import UIKit


class TabBarViewController: UITabBarController{
    
    
    override func viewDidLoad() {
    super.viewDidLoad()
    setupViewControllers()
    }
    
    func setupViewControllers(){
//        CATEGORIES
        let firstTabBarTitle = "Categories"
        let firstTabBarImage = UIImage(named: "list.dash")
        let firstTab = CategoriesTableViewController(nibName: String(describing: CategoriesTableViewController.self) , bundle: nil)
        firstTab.title = firstTabBarTitle
        
        let firstNavigationViewController = UINavigationController(rootViewController: firstTab)
        
        firstNavigationViewController.tabBarItem = UITabBarItem(title: firstTabBarTitle, image: firstTabBarImage, selectedImage: firstTabBarImage)
        
//        RANDOM
        let secondTabBarTitle = "Random"
        let secondTabBarImage = UIImage(named: "shuffle.dash")
        let secondTab = RandomViewController(nibName: String(describing: RandomViewController.self) , bundle: nil)
        secondTab.title = secondTabBarTitle
        
        let secondNavigationViewController = UINavigationController(rootViewController: secondTab)
        
        secondNavigationViewController.tabBarItem = UITabBarItem(title: secondTabBarTitle, image: secondTabBarImage, selectedImage: secondTabBarImage)
        
        let controllers = [firstNavigationViewController, secondNavigationViewController]
        viewControllers = controllers
    }
}
