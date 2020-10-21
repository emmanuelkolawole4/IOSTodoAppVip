//
//  ShowTodoDetailsInteractor.swift
//  VipTodoAppPersonal
//
//  Created by FOLAHANMI KOLAWOLE on 21/10/2020.
//

import Foundation

protocol ShowTodoDetailsBusinessLogic {
    func editCurrentTodo(currentTodo: TodoModel, title: String, descriptionn: String)
}

class ShowTodoDetailsInteractor: ShowTodoDetailsBusinessLogic {
    var showTodoDetailsWorkerDelegate: ShowTodoDetailsProtocol?
    
    func editCurrentTodo(currentTodo: TodoModel, title: String, descriptionn: String) {
        showTodoDetailsWorkerDelegate?.editCurrentTodo(currentTodo: currentTodo, title: title, descriptionn: descriptionn)
    }
}
