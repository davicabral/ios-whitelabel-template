//
//  FetchService.swift
//  WhiteLabel-Template
//
//  Created by Davi Cabral de Oliveira on 23/11/19.
//  Copyright © 2019 Davi Cabral de Oliveira. All rights reserved.
//

import Foundation

struct FetchService {
    
    static func all(completion: ([Char]?) -> Void) {
        
        guard let url = Bundle.main.url(forResource: "source", withExtension: "json"), let data = try? Data(contentsOf: url) else {
            fatalError()
        }
        
        let jsonDecoder = JSONDecoder()
        let result = try? jsonDecoder.decode([Char].self, from: data)
        completion(result)
    }
}
