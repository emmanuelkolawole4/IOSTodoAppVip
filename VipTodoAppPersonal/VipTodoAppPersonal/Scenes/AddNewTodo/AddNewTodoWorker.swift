//
//  AddNewTodoWorker.swift
//  VipTodoAppPersonal
//
//  Created by FOLAHANMI KOLAWOLE on 21/10/2020.
//

import Foundation
import RealmSwift

protocol AddNewTodoProtocol {
    func addNewTodo(todo: TodoModel)
}

class AddNewTodoWorker: AddNewTodoProtocol {
    func addNewTodo(todo: TodoModel) {
        let realm = try? Realm()
        try? realm?.write {
            let newTodo = TodoModel()
            newTodo.title = todo.title
            newTodo.descriptionn = todo.descriptionn
            realm?.add(newTodo)
        }
    }
}
