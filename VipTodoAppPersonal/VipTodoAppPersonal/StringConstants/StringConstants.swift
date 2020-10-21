//
//  StringConstants.swift
//  TeamAceTodoListApp
//
//  Created by FOLAHANMI KOLAWOLE on 08/10/2020.

import UIKit
enum StringConstants {
    static let listTodosScreenTitle = "Todo App"
    static let titleTextFieldPlaceholder = "Title"
    static let cellId = "cellId"
    static let addButtonTitle = "Add Todo"
    static let editButtonTitle = "Edit Todo"
    static let attributedTitle = NSMutableAttributedString(
        string: "\n", attributes: [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.bold),
            NSAttributedString.Key.foregroundColor: UIColor.black
        ])
    static let attributedDescripttion = NSMutableAttributedString(
        string: " ", attributes: [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.regular),
            NSAttributedString.Key.foregroundColor: UIColor.black
        ])
    static let todoTitle = "Title"
    static let todoDescription = "Description"
    static let seeDetailsArrow = "chevron.right"
}
