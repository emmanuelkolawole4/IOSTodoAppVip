//
//  DeleteTodoWorker.swift
//  VipTodoAppPersonal
//
//  Created by FOLAHANMI KOLAWOLE on 21/10/2020.
//

import Foundation
import RealmSwift

protocol DeleteTodoProtocol {
    func deleteCurrentTodo(todo: TodoModel)
}

class DeleteTodoWorker: DeleteTodoProtocol {
    func deleteCurrentTodo(todo: TodoModel) {
        let realm = try! Realm()
        try! realm.write {
            realm.delete(todo)
        }
    }
}
