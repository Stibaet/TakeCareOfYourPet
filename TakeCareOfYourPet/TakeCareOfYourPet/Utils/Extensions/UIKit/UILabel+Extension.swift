//
//  UILabel+Extension.swift
//  TakeCareOfYourPet
//
//  Created by Матвей Анкудимов on 30.04.2025.
//

import UIKit

extension UILabel {
    
    convenience init(text: String? = "", lines: Int = 1, font: UIFont? = .systemFont(ofSize: 14), textColor: UIColor = .black, alignment: NSTextAlignment = .left, isHidden: Bool = false, tamic: Bool = false) {
        self.init(frame: .zero)
        self.text = text
        numberOfLines = lines
        self.font = font
        self.textColor = textColor
        self.textAlignment = alignment
        self.isHidden = isHidden
        self.translatesAutoresizingMaskIntoConstraints = tamic
    }
}
