//
//  Configuration.swift
//  WhiteLabel-Template
//
//  Created by Davi Cabral de Oliveira on 23/11/19.
//  Copyright © 2019 Davi Cabral de Oliveira. All rights reserved.
//

import Foundation

class Settings: Decodable {
    
    static var shared: Settings!
    
    let hasSelection: Bool
    let numberOfColumns: Int

}
