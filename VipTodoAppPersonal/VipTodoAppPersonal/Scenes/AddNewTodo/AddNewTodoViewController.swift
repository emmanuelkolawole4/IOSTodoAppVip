//
//  AddTodoViewController.swift
//  TeamAceTodoListApp
//  Created by FOLAHANMI KOLAWOLE on 08/10/2020.

import UIKit
import RealmSwift

class AddNewTodoViewController: UIViewController {
    var addNewTodoInteractor: AddNewTodoBusinessLogic?
    let realm = try? Realm()
    
    let titleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = StringConstants.todoTitle
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderWidth = 1
        textField.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        textField.setLeftPaddingPoints(10)
        textField.setRightPaddingPoints(10)
        return textField
    }()
    
    let descriptionTextField: UITextView = {
        let textField = UITextView()
        textField.text = StringConstants.todoDescription
        textField.layer.borderWidth = 1
        textField.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let saveTodoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(StringConstants.addButtonTitle, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        button.layer.cornerRadius = 5
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(addNewTodo), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        view.backgroundColor = .white
        setNavigationBar()
        layoutViews()
    }
    
    func setup() {
        let addNewTodoWorker = AddNewTodoWorker()
        let addNewTodoInteractor = AddNewTodoInteractor()
        addNewTodoInteractor.addNewTodoWorkerDelegate = addNewTodoWorker
        self.addNewTodoInteractor = addNewTodoInteractor
    }
    
    func setNavigationBar() {
        navigationController?.navigationBar.tintColor = .black
    }
    
    func layoutViews() {
        view.addSubview(titleTextField)
        view.addSubview(descriptionTextField)
        view.addSubview(saveTodoButton)
        setConstraints()
        hideKeyboard()
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            titleTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            titleTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            titleTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            titleTextField.heightAnchor.constraint(equalToConstant: 50),
            descriptionTextField.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 20),
            descriptionTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            descriptionTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            descriptionTextField.heightAnchor.constraint(equalToConstant: 300),
            saveTodoButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            saveTodoButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            saveTodoButton.topAnchor.constraint(equalTo: descriptionTextField.bottomAnchor, constant: 50),
            saveTodoButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func addNewTodo() {
        let newTodo = TodoModel()
        newTodo.title = titleTextField.text ?? ""
        newTodo.descriptionn = descriptionTextField.text
        addNewTodoInteractor?.addNewTodo(todo: newTodo)
        clearInputFields()
        
        let homeViewController = ListTodosViewController()
        let navigationViewController = UINavigationController(rootViewController: homeViewController)
        navigationViewController.modalPresentationStyle = .fullScreen
        present(navigationViewController, animated: true)
    }
    
    func clearInputFields() {
        titleTextField.text = ""
        descriptionTextField.text = ""
    }
}
