//
//  MainNavigationController.swift
//  TeamAceTodoListApp
//
//  Created by FOLAHANMI KOLAWOLE on 08/10/2020.
//

import UIKit

class MainNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let listTodosVC = ListTodosViewController()
        viewControllers = [listTodosVC]
    }
}
