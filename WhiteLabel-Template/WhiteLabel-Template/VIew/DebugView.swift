//
//  DebugView.swift
//  WhiteLabel-Template
//
//  Created by Davi Cabral de Oliveira on 23/11/19.
//  Copyright © 2019 Davi Cabral de Oliveira. All rights reserved.
//

import UIKit

class DebugView: UIView {

    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "DEBUG MODE"
        label.textColor = .yellow
        label.textAlignment = .center
        label.sizeToFit()
        addSubview(label)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
