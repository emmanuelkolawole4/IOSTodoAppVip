//
//  ShowTodoDetailsWorker.swift
//  VipTodoAppPersonal
//
//  Created by FOLAHANMI KOLAWOLE on 21/10/2020.
//

import Foundation
import RealmSwift

protocol ShowTodoDetailsProtocol {
    func editCurrentTodo(currentTodo: TodoModel, title: String, descriptionn: String)
}

class ShowTodoDetailsWorker: ShowTodoDetailsProtocol {
    func editCurrentTodo(currentTodo: TodoModel, title: String, descriptionn: String) {
        let realm = try? Realm()
        try? realm?.write {
            currentTodo.title = title
            currentTodo.descriptionn = descriptionn
        }
    }
}
