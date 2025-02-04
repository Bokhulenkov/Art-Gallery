//
//  Extensions.swift
//  Art Gallery
//
//  Created by Alexander Bokhulenkov on 04.02.2025.
//

import UIKit

final class LabelFactory {
    static func makeTitleLabel(text: String) -> UILabel {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .left
        label.textColor = .black //333647
        label.text = text
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}
