// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftGodot

public let types: [Object.Type] = [
    MyLevel.self
]

#initSwiftExtension(
    cdecl: "swift_entry_point",
    types: types
)
