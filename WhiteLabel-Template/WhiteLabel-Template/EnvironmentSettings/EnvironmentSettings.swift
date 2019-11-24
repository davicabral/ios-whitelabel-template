//
//  EnvironmentSettings.swift
//  WhiteLabel-Template
//
//  Created by Davi Cabral de Oliveira on 24/11/19.
//  Copyright © 2019 Davi Cabral de Oliveira. All rights reserved.
//

import Foundation

public enum Environment {
  
  enum Keys {
    enum Plist {
      static let baseURL = "BASE_URL"
    }
  }

  private static let infoDictionary: [String: Any] = {
    guard let dict = Bundle.main.infoDictionary else {
      fatalError("Plist file not found")
    }
    return dict
  }()

  static let baseURL: String = {
    guard let rootURLstring = Environment.infoDictionary[Keys.Plist.baseURL] as? String else {
      fatalError("Root URL not set in plist for this environment")
    }
    return rootURLstring
  }()

}
