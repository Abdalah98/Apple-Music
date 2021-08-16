//
//  HiddenKeyboard.swift
//  GitHub
//
//  Created by Abdallah on 7/26/21.
//

import Foundation

import UIKit
extension UIViewController {
    func tapToHiddenKeypord() {
        let tapAnyWhere: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        tapAnyWhere.cancelsTouchesInView = false
        view.addGestureRecognizer(tapAnyWhere)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
/*    func creatDismissKeyboardTapRecognizer(){
 let tab = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
 view.addGestureRecognizer(tab)
}
*/
