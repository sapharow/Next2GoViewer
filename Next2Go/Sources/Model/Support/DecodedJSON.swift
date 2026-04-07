//
//  DecodedJSON.swift
//  Next2Go
//
//  Created by Iskandar Safarov on 4/4/2026.
//

import Foundation

/// Decodes JSON sent as a string or as an object
@propertyWrapper
package struct DecodedJSON<T: Decodable & Sendable & Equatable>: Decodable, Sendable, Equatable {
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
