//
//  ListTodosInteractor.swift
//  VipTodoAppPersonal
//
//  Created by FOLAHANMI KOLAWOLE on 21/10/2020.
//

import Foundation

protocol ListTodosBusinessLogic {
    func getAllTodos()
    func deleteCurrentTodo(todo: TodoModel)
}

class ListTodosInteractor: ListTodosBusinessLogic {
    var listTodosWorkerDelegate: FetchAllTodosProtocol?
    var listTodosPresenterDelegate: ListTodoPresentationLogic?
    var deleteTodoWorkerDelegate: DeleteTodoProtocol?
    
    func getAllTodos() {
        if let results = listTodosWorkerDelegate?.fetchTodosFromDatabase() {
            listTodosPresenterDelegate?.presentAllTodos(allTodos: results)
        }
    }
    
    func deleteCurrentTodo(todo: TodoModel) {
        deleteTodoWorkerDelegate?.deleteCurrentTodo(todo: todo)
    }
}
