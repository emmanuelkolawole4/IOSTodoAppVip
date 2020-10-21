//
//  ListTodosWorker.swift
//  VipTodoAppPersonal
//
//  Created by FOLAHANMI KOLAWOLE on 21/10/2020.
//

import Foundation
import RealmSwift

protocol FetchAllTodosProtocol {
    func fetchTodosFromDatabase() -> [TodoModel]
}

class ListTodosWorker: FetchAllTodosProtocol {
    func fetchTodosFromDatabase() -> [TodoModel] {
        let realm = try? Realm()
        guard let databaseOfTodos: Results<TodoModel> = { realm?.objects(TodoModel.self) }() else { fatalError("Unable to get data from databse.")  }
        return Array(databaseOfTodos)
    }
}
