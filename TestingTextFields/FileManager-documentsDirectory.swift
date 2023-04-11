//
//  FileManager-documentsDirectory.swift
//  Challenge07
//
//  Created by Robert Hoover on 2023-04-05.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
