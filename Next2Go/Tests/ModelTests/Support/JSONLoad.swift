//
//  JSONLoad.swift
//  Next2Go
//
//  Created by Iskandar Safarov on 4/4/2026.
//

import Foundation

func loadJSON<T: Decodable>(named name: String, file: StaticString = #file) throws -> T {
    guard let url = Bundle.module.url(forResource: name, withExtension: "json") else {
        fatalError("Missing file \(name).json")
    }
    let decoder = JSONDecoder()
    return try decoder.decode(T.self, from: try Data(contentsOf: url))
}
