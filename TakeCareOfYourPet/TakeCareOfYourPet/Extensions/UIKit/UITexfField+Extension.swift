//
//  UITexfField+Extension.swift
//  TakeCareOfYourPet
//
//  Created by Матвей Анкудимов on 02.05.2025.
//

import UIKit

extension UITextField {
    
    convenience init(placeholder: String? = nil, font: UIFont = .systemFont(ofSize: 14),
                     textColor: UIColor = .black, delegate: UITextFieldDelegate? = nil,
                     returnKeyType key: UIReturnKeyType = .done,
                     keyboardType keyboard: UIKeyboardType = .default,
                     correctType: UITextAutocorrectionType = .default,
                     borderStyle: BorderStyle = .roundedRect, backgroundColor: UIColor? = nil,
                     rightView: UIView? = nil, rightViewMode: UITextField.ViewMode = .always,
                     isSecureTextEntry: Bool = false, tamic: Bool = false) {
        self.init()
        self.placeholder = placeholder
        self.font = font
        self.textColor = textColor
        self.delegate = delegate
        self.returnKeyType = key
        self.keyboardType = keyboard
        self.autocorrectionType = correctType
        self.borderStyle = borderStyle
        self.backgroundColor = backgroundColor
        self.rightView = rightView
        self.rightViewMode = rightViewMode
        translatesAutoresizingMaskIntoConstraints = tamic
        self.isSecureTextEntry = isSecureTextEntry

    }
}
