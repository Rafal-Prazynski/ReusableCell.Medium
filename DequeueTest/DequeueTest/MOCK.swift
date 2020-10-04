//
//  MOCK.swift
//  DequeueTest
//
//  Created by Rafał P. on 15/08/2020.
//  Copyright © 2020 Rafał P. All rights reserved.
//

import Foundation

final class MOCK {
    
    static func getPepe() -> PepesModel {
        mock().decodeJson(for: PepesModel.self)!
    }
    

    private static func mock() -> Data {
          let json =
"""
{
    "pepes": {
        "pepe1": {
            "name": "pepe1",
            "count": 2
        },
        "pepe2": {
            "name": "pepe2",
            "count": 4
        },
        "pepe3": {
            "name": "pepe3",
            "count": 1
        },
    }
}
"""
          return json.data(using: .utf8)!
      }
}


struct PepesModel: Decodable {
    var pepes: PepeModel
}

struct PepeModel: Decodable {
    var pepe1: Pepe
    var pepe2: Pepe
    var pepe3: Pepe
}

struct Pepe: Decodable {
    var name: String
    var count: Int
}

extension Data {
    func decodeJson<T:Decodable>(for type: T.Type) -> T? {
        var model: T?
        do {
            model = try JSONDecoder().decode(T.self, from: self)
        } catch  {
            print("[JSON PARSING ERROR] \(error.localizedDescription)")
        }
        
        return model
    }
}
