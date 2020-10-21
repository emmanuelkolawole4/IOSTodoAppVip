//
//  UIViewController+Extension.swift
//  TeamAceTodoListApp
//
//  Created by FOLAHANMI KOLAWOLE on 14/10/2020.
//

import UIKit
extension UIViewController {
    func hideKeyboard() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
}
