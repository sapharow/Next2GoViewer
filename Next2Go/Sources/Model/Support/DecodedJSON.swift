//
//  DecodedJSON.swift
//  Next2Go
//
//  Created by Iskandar Safarov on 4/4/2026.
//

import Foundation

// Convenient wrapper to decode JSON provided as a String
@propertyWrapper
package struct DecodedJSON<T: Decodable & Sendable>: Decodable, Sendable {
    package let wrappedValue: T

    package init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()

        if let jsonString = try? container.decode(String.self),
           let data = jsonString.data(using: .utf8) {
            wrappedValue = try JSONDecoder().decode(T.self, from: data)
        } else {
            wrappedValue = try container.decode(T.self)
        }
    }

    package init(_ wrappedValue: T) {
        self.wrappedValue = wrappedValue
    }
}
