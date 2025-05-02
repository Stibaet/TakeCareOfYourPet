//
//  UIStackView+Extension.swift
//  TakeCareOfYourPet
//
//  Created by Матвей Анкудимов on 02.05.2025.
//

import UIKit

extension UIStackView {
    
    convenience init(axis: NSLayoutConstraint.Axis, distribution: Distribution = .fill, spacing: CGFloat = 0, arrangedSubviews: [UIView] = [], tamic: Bool = false) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.axis = axis
        self.distribution = distribution
        self.spacing = spacing
        translatesAutoresizingMaskIntoConstraints = tamic
    }
}
