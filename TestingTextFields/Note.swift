//
//  Note.swift
//  Challenge07
//
//  Created by Robert Hoover on 2023-04-05.
//

import Foundation

struct Note: Identifiable, Codable, Comparable {
    var id: UUID
    var noteBody: String
    var noteTitle: String
    var createDate: Date
    
    var dateString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        return formatter.string(from: createDate)
    }
    
    var idString: String {
        "\(self.id)"
    }
    
    static func < (lhs: Note, rhs: Note) -> Bool {
        lhs.createDate < rhs.createDate
    }

    static let example = Note(id: UUID(), noteBody: "this is some note text", noteTitle: "the note title", createDate: Date.now)
    static let newNoteDefault = Note(id: UUID(), noteBody: "note text", noteTitle: "title", createDate: Date.now)
}
