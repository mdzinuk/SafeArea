//
//  File.swift
//  SafeArea Tutorial
//
//  Created by Mohammad Arafat Hossain on 4/06/19.
//  Copyright © 2019 Mohammad Arafat Hossain. All rights reserved.
//

import UIKit

protocol TableViewHeaderFooterViewResizing {
    func prepareAutoresizingMask()
    func updateLayout(with tableViewWidth: CGFloat)
}

extension TableViewHeaderFooterViewResizing where Self: UIView {
    func prepareAutoresizingMask() {
        autoresizingMask = .flexibleWidth
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func updateLayout(with tableViewWidth: CGFloat) {
        let temporaryWidthConstraint = widthAnchor.constraint(equalToConstant: tableViewWidth)
        NSLayoutConstraint.activate([temporaryWidthConstraint])
        let layoutSize = systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        removeConstraint(temporaryWidthConstraint)
        var updatedBounds = bounds
        updatedBounds.size.height = layoutSize.height
        bounds = updatedBounds
        translatesAutoresizingMaskIntoConstraints = true
    }
}

class ReusableHeaderFooter: UIView, TableViewHeaderFooterViewResizing {
    private weak var textLabel: UILabel!
    
    public init(text: String) {
        super.init(frame: .zero)
        prepareAutoresizingMask()
        setUp(with: text)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private struct Layout {
        static let verticalInset: CGFloat = 16
        static let horizontalInset: CGFloat = 20
    }
    
    private func setUp(with text: String) {
        backgroundColor = .yellow
        let textLabel = UILabel(frame: .zero)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.numberOfLines = 0
        textLabel.text = text
        textLabel.font = UIFont.systemFont(ofSize: 20.0, weight: .heavy)
        textLabel.textAlignment = .left
        textLabel.backgroundColor = .clear
        addSubview(textLabel)
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: topAnchor, constant: Layout.verticalInset),
            textLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Layout.verticalInset),
            textLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: Layout.horizontalInset),
            textLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -Layout.horizontalInset)
            ])
        
        self.textLabel = textLabel
    }
}

