//
//  DreamJournalModel.swift
//  JournalApp
//
//  Created by Justin Bell on 4/23/25.
//

import Foundation
import FirebaseFirestore

/// A struct model for holding dream journal entry data.
struct DreamJournalModel: Codable, Identifiable {
    @DocumentID var id: String?
    var title: String
    var story: String
    var people: String
    var places: String
    var objects: String
    var emotions: String
    var themes: String
    
    /// A method for determining if the dream journal entry is empty
    /// - Returns: Bool - whether entry is empty or not
    func isEmpty() -> Bool {
        return title.isEmpty &&
        story.isEmpty &&
        people.isEmpty &&
        places.isEmpty &&
        objects.isEmpty &&
        emotions.isEmpty &&
        themes.isEmpty
    }
}
