//
//  ListTodosPresenter.swift
//  VipTodoAppPersonal
//
//  Created by FOLAHANMI KOLAWOLE on 21/10/2020.
//

import Foundation

protocol ListTodoPresentationLogic {
    func presentAllTodos(allTodos: [TodoModel])
}

class ListTodosPresenter: ListTodoPresentationLogic {
    var view: DisplayTodoLogic?
    
    func presentAllTodos(allTodos: [TodoModel]) {
        view?.databaseOfTodos = allTodos
    }
}
