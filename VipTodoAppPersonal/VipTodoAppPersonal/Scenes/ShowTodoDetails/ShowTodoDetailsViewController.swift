//
//  TodoDetailsViewController.swift
//  TeamAceTodoListApp
//  Created by FOLAHANMI KOLAWOLE on 08/10/2020.

import UIKit

class ShowTodoDetailsViewController: UIViewController {
    var showTodoDetailsInteractor: ShowTodoDetailsBusinessLogic?
    var currentTodo: TodoModel?
    
    let titleTextView: UITextView = {
        let textView = UITextView()
        textView.textColor = .black
        textView.isEditable = false
        textView.attributedText = StringConstants.attributedTitle
        textView.textAlignment = .center
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.textColor = .black
        textView.isEditable = false
        textView.attributedText = StringConstants.attributedDescripttion
        textView.textAlignment = .justified
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.layer.borderWidth = 1
        textView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return textView
    }()
    
    let saveTodoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(StringConstants.editButtonTitle, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        button.layer.cornerRadius = 5
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isHidden = true
        button.addTarget(self, action: #selector(saveEditedTodo), for: .touchUpInside)
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
        titleTextView.text = currentTodo?.title
        descriptionTextView.text = currentTodo?.descriptionn
        let showTodoDetailsWorker = ShowTodoDetailsWorker()
        let showTodoDetailsInteractor = ShowTodoDetailsInteractor()
        showTodoDetailsInteractor.showTodoDetailsWorkerDelegate = showTodoDetailsWorker
        self.showTodoDetailsInteractor = showTodoDetailsInteractor
    }
    
    func setNavigationBar() {
        navigationController?.navigationBar.tintColor = .black
        let addButton = UIButton(type: .custom)
        addButton.setTitle(StringConstants.editButtonTitle, for: .normal)
        addButton.setTitleColor(.black, for: .normal)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: addButton)
        addButton.addTarget(self, action: #selector(handleEditTodoClick), for: .touchUpInside)
    }
    
    func layoutViews() {
        view.addSubview(titleTextView)
        view.addSubview(descriptionTextView)
        view.addSubview(saveTodoButton)
        setConstraints()
    }
    func setConstraints() {
        NSLayoutConstraint.activate([
            titleTextView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1, constant: 100),
            titleTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            titleTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            descriptionTextView.topAnchor.constraint(equalTo: titleTextView.bottomAnchor, constant: 0),
            descriptionTextView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5, constant: -100),
            descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            saveTodoButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            saveTodoButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            saveTodoButton.topAnchor.constraint(equalTo: descriptionTextView.bottomAnchor, constant: 50),
            saveTodoButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    @objc func handleEditTodoClick() {
        saveTodoButton.isHidden = false
        titleTextView.isEditable = true
        descriptionTextView.isEditable = true
    }
    
    @objc func saveEditedTodo() {
        showTodoDetailsInteractor?.editCurrentTodo(currentTodo: currentTodo ?? TodoModel(), title: titleTextView.text, descriptionn: descriptionTextView.text)
        clearInputFields()
        let homeViewController = ListTodosViewController()
        let navigationViewController = UINavigationController(rootViewController: homeViewController)
        navigationViewController.modalPresentationStyle = .fullScreen
        present(navigationViewController, animated: true)
    }
    
    func clearInputFields() {
        titleTextView.text = ""
        descriptionTextView.text = ""
    }
}
