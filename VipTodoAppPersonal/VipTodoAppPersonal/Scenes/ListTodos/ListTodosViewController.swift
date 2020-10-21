//
//  ListTodosTableViewController.swift
//  TeamAceTodoListApp
//
//  Created by FOLAHANMI KOLAWOLE on 08/10/2020.

import UIKit

protocol DisplayTodoLogic {
    var databaseOfTodos: [TodoModel]? { get set }
}

class ListTodosViewController: UITableViewController, DisplayTodoLogic {
    var listTodosInteracor: ListTodosBusinessLogic?
    var databaseOfTodos: [TodoModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        listTodosInteracor?.getAllTodos()
        setNavigationBar()
        view.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: StringConstants.cellId)
        tableView.tableFooterView = UIView()
    }
    
    func setup() {
        let listTodosPresenter = ListTodosPresenter()
        listTodosPresenter.view = self
        let listTodosWorker = ListTodosWorker()
        let listTodosInteractor = ListTodosInteractor()
        listTodosInteractor.listTodosPresenterDelegate = listTodosPresenter
        listTodosInteractor.listTodosWorkerDelegate = listTodosWorker
        let deleteTodoWorker = DeleteTodoWorker()
        listTodosInteractor.deleteTodoWorkerDelegate = deleteTodoWorker
        self.listTodosInteracor = listTodosInteractor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return databaseOfTodos?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StringConstants.cellId, for: indexPath)
        cell.textLabel?.text = databaseOfTodos?[indexPath.row].title
        let image = UIImage(systemName: StringConstants.seeDetailsArrow, withConfiguration: UIImage.SymbolConfiguration(weight: .regular))?.withTintColor(.black, renderingMode: .alwaysOriginal)
        cell.accessoryView = UIImageView(image: image)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = ShowTodoDetailsViewController()
        viewController.currentTodo = databaseOfTodos?[indexPath.row]
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            listTodosInteracor?.deleteCurrentTodo(todo: databaseOfTodos?[indexPath.row] ?? TodoModel())
        }
        listTodosInteracor?.getAllTodos()
        tableView.reloadData()
    }
    
    func setNavigationBar() {
        navigationItem.title = StringConstants.listTodosScreenTitle
        let addButton = UIButton(type: .custom)
        addButton.setTitle(StringConstants.addButtonTitle, for: .normal)
        addButton.setTitleColor(.black, for: .normal)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: addButton)
        addButton.addTarget(self, action: #selector(handleAddTodoClick), for: .touchUpInside)
    }
    
    @objc func handleAddTodoClick() {
        let viewController = AddNewTodoViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}
