//
//  Char.swift
//  WhiteLabel-Template
//
//  Created by Davi Cabral de Oliveira on 23/11/19.
//  Copyright © 2019 Davi Cabral de Oliveira. All rights reserved.
//

import UIKit

struct Char: Decodable {
    var name: String
    var description: String
    
    var image: UIImage? {
        return UIImage(named: name)
    }
}
