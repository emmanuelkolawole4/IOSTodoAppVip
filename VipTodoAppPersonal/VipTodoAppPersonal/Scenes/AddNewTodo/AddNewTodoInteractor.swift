//
//  AddNewTodoInteractor.swift
//  VipTodoAppPersonal
//
//  Created by FOLAHANMI KOLAWOLE on 21/10/2020.
//

import Foundation

protocol AddNewTodoBusinessLogic {
    func addNewTodo(todo: TodoModel)
}

class AddNewTodoInteractor: AddNewTodoBusinessLogic {
    var addNewTodoWorkerDelegate: AddNewTodoWorker?
    
    func addNewTodo(todo: TodoModel) {
        addNewTodoWorkerDelegate?.addNewTodo(todo: todo)
    }
}
